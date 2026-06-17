#!/usr/bin/env python3
"""確定性 vulnerability_tracking 萃取器：依 Layer CLAUDE.md 模板將 raw JSONL 轉為 .md。
涵蓋 nvd-cve, gh-advisories, msrc, govcert-hk, cert-pl, ncsc-nl, hkcert, ncsc-fi-vulns。
EPSS 補充不獨立產出；jpcert 空；TWCERT rss-132/139 另由 LLM+fetch_url 處理。
分類依 CVSS / 官方等級；CVE/GHSA 去重；filename collisions -N。
"""
import json, os, re, glob, sys
from datetime import datetime, timezone

BASE = "docs/Extractor/vulnerability_tracking"
NOW = datetime.now(timezone.utc).strftime("%Y-%m-%d %H:%M")
CVE_RE = re.compile(r'CVE-\d{4}-\d{4,}', re.I)

# 索引
idx = json.load(open("/tmp/idx_vulnerability_tracking.json"))
by_cve = {k.upper(): v for k, v in idx.get("by_cve", {}).items()}
existing_files = set(idx.get("by_filename", {}).keys())
created = set()
seen_cve_this_run = set()

written = {"critical_high":0, "medium":0, "low_info":0}
skipped = 0
review_needed = 0

def strip_html(s):
    s = re.sub(r'<[^>]+>', ' ', s or '')
    s = re.sub(r'&nbsp;|&amp;|&lt;|&gt;|&#\d+;', ' ', s)
    return re.sub(r'\s+', ' ', s).strip()

def slugify(s, maxlen=60):
    s = (s or "").lower()
    s = re.sub(r'([0-9])\.([0-9])', r'\1-\2', s)
    s = s.replace("sql injection","sqli").replace("remote code execution","rce")
    s = re.sub(r'[^a-z0-9]+', '-', s)
    s = re.sub(r'-+', '-', s).strip('-')
    return s[:maxlen].rstrip('-') or "advisory"

def norm_cve(s):
    m = CVE_RE.search(s or "")
    return m.group(0).upper() if m else None

def cat_from_score(score):
    try: score = float(score)
    except: return None
    if score >= 7.0: return "critical_high", "High" if score < 9 else "Critical"
    if score >= 4.0: return "medium", "Medium"
    return "low_info", "Low"

def cat_from_word(text):
    t = (text or "").lower()
    if any(w in t for w in ["critical","嚴重","kritisch"]): return "critical_high","Critical"
    if any(w in t for w in ["high threat","high","severe","important","hoog","/h]"]): return "critical_high","High"
    if any(w in t for w in ["medium","moderate","middel","/m]"]): return "medium","Medium"
    if any(w in t for w in ["low","laag","資訊"]): return "low_info","Low"
    return None

def uniq(base):
    cand = base + ".md"
    if cand not in existing_files and cand not in created: return cand
    i = 2
    while True:
        cand = f"{base}-{i}.md"
        if cand not in existing_files and cand not in created: return cand
        i += 1
        if i > 200: return f"{base}-{i}.md"

def emit(category, fname, cve_disp, tvn, date, source, vendor, product, severity, cvss, epss, conf, desc_en, desc_zh, remediation, url_en, url_zh, feed_id, review=False):
    global review_needed
    d = os.path.join(BASE, category); os.makedirs(d, exist_ok=True)
    zh_block = f"\n### 中文\n{desc_zh}\n" if desc_zh else ""
    zh_link = f"\n- [TWCERT/CC 中文公告]({url_zh})" if url_zh else ""
    prefix = "[REVIEW_NEEDED]\n" if review else ""
    if review: review_needed += 1
    content = f"""{prefix}# {desc_en[:90] if desc_en else cve_disp}

| 項目 | 內容 |
|------|------|
| **TVN 編號** | {tvn or '—'} |
| **CVE** | {cve_disp} |
| **日期** | {date} |
| **來源** | {source} |
| **廠商** | {vendor} |
| **產品** | {product} |
| **嚴重程度** | {severity} |
| **CVSS** | {cvss} |
| **EPSS** | {epss} |
| **信心水準** | {conf} |

## 漏洞描述
{zh_block}
### English
{desc_en or '未提供'}

## 修補建議

{remediation}

## 來源連結

- [來源公告]({url_en}){zh_link}

---
> 萃取時間：{NOW} UTC
> 資料來源：{source} {feed_id}
"""
    with open(os.path.join(d, fname), "w") as f:
        f.write(content)
    created.add(fname); written[category] += 1

def dedup_cve(cve):
    """True 表示應跳過。"""
    global skipped
    if cve and (cve in by_cve or cve in seen_cve_this_run):
        skipped += 1; return True
    return False

# ---------- NVD ----------
def proc_nvd(o):
    c = o.get("cve", {})
    cve = (c.get("id") or "").upper()
    if not cve: return
    if dedup_cve(cve): return
    desc = ""
    for d in c.get("descriptions", []):
        if d.get("lang") == "en": desc = d.get("value",""); break
    score = sevword = None
    metrics = c.get("metrics", {})
    for key in ("cvssMetricV31","cvssMetricV30","cvssMetricV2"):
        if metrics.get(key):
            cd = metrics[key][0].get("cvssData", {})
            score = cd.get("baseScore"); sevword = cd.get("baseSeverity") or metrics[key][0].get("baseSeverity")
            break
    if score is not None:
        category, severity = cat_from_score(score)
        cvss = str(score)
    else:
        category, severity, cvss = "low_info", (sevword or "未評估").title(), "未提供"
    year = (c.get("published") or "2026")[:4]
    fname = uniq(f"{year}-{cve}")
    seen_cve_this_run.add(cve)
    emit(category, fname, cve, None, (c.get("published") or "")[:10], "NIST NVD",
         "未提供", "未提供", severity, cvss, "未提供", "高",
         desc, "", "請參閱官方公告與廠商修補資訊。",
         f"https://nvd.nist.gov/vuln/detail/{cve}", "", "nvd-cve")

# ---------- GitHub Advisories ----------
def proc_gh(o):
    cve = (o.get("cve_id") or "")
    cve = cve.upper() if cve else None
    ghsa = o.get("ghsa_id") or ""
    if cve and dedup_cve(cve): return
    sev = (o.get("severity") or "").lower()
    category, severity = {"critical":("critical_high","Critical"),"high":("critical_high","High"),
                          "moderate":("medium","Medium"),"low":("low_info","Low")}.get(sev, ("medium","未評估"))
    year = (o.get("published_at") or "2026")[:4]
    if cve:
        fname = uniq(f"{year}-{cve}"); seen_cve_this_run.add(cve)
    else:
        if (ghsa + ".md") and any(ghsa in x for x in existing_files):
            global skipped; skipped += 1; return
        fname = uniq(f"{year}-GHSA-{ghsa.replace('GHSA-','')}")
    emit(category, fname, cve or "未提供", None, (o.get("published_at") or "")[:10],
         "GitHub Security Advisories", "未提供", "未提供", severity,
         "未提供", "未提供", "高", strip_html(o.get("summary") or o.get("description") or ""),
         "", "請參閱官方公告與套件維護者修補版本。",
         o.get("html_url") or "https://github.com/advisories", "", "gh-advisories")

# ---------- MSRC ----------
def proc_msrc(o):
    title = o.get("title") or ""
    cve = norm_cve(title)
    if cve and dedup_cve(cve): return
    desc = strip_html(o.get("description") or "")
    cw = cat_from_word(title + " " + desc)
    if cw: category, severity = cw
    else: category, severity = "medium", "未評估"
    conf = "中" if cw else "低"
    year = "2026"
    if cve:
        fname = uniq(f"{year}-{cve}"); seen_cve_this_run.add(cve)
    else:
        fname = uniq(f"{year}-msrc-{slugify(title)}")
    emit(category, fname, cve or "未提供", None, "", "Microsoft MSRC", "Microsoft", "未提供",
         severity, "未提供", "未提供", conf, title + (" — " + desc if desc else ""),
         "", "請參閱 Microsoft 官方更新指引並套用對應修補。",
         o.get("link") or "https://msrc.microsoft.com/update-guide", "", "msrc")

# ---------- GovCERT.HK ----------
def proc_govcerthk(o):
    title = o.get("title") or ""
    desc = strip_html(o.get("description") or "")
    cves = list(dict.fromkeys(m.upper() for m in CVE_RE.findall(title + " " + desc)))
    cw = cat_from_word(title)
    if cw: category, severity = cw
    else: category, severity = "medium", "未評估"
    # 第一個未存在的 CVE 作主鍵
    primary = next((c for c in cves if c not in by_cve and c not in seen_cve_this_run), None)
    if cves and not primary:
        global skipped; skipped += 1; return  # 全部 CVE 已存在
    year = "2026"
    if primary:
        fname = uniq(f"{year}-{primary}"); seen_cve_this_run.add(primary)
    else:
        aid = re.search(r'A\d{2}-\d{2}-\d{2,}', title)
        slug = aid.group(0).lower() if aid else slugify(title)
        fname = uniq(f"{year}-govcert-hk-{slug}")
    emit(category, fname, ", ".join(cves) if cves else "未提供", None, "",
         "GovCERT.HK", "未提供", "未提供", severity, "未提供", "未提供",
         "中" if cw else "低", title + (" — " + desc[:600] if desc else ""), "",
         "請參閱 GovCERT.HK 公告與廠商修補建議。",
         o.get("link") or "https://www.govcert.gov.hk/", "", "govcert-hk")

# ---------- cert-pl ----------
def proc_certpl(o):
    title = o.get("title") or ""; desc = strip_html(o.get("description") or "")
    cve = norm_cve(title + " " + desc)
    if cve and dedup_cve(cve): return
    cw = cat_from_word(title + " " + desc)
    category, severity = cw if cw else ("medium","未評估")
    year = (re.search(r'/(\d{4})/', o.get("link") or "") or [None,"2026"])[1] if "/20" in (o.get("link") or "") else "2026"
    if cve:
        fname = uniq(f"{year}-{cve}"); seen_cve_this_run.add(cve)
    else:
        fname = uniq(f"{year}-cert-pl-{slugify(title)}")
    emit(category, fname, cve or "未提供", None, "", "CERT.PL", "未提供", "未提供",
         severity, "未提供", "未提供", "中" if cve else "低", title + (" — " + desc if desc else ""),
         "", "請參閱 CERT.PL 公告與官方修補。", o.get("link") or "https://cert.pl/", "", "cert-pl")

# ---------- ncsc-nl ----------
def proc_ncscnl(o):
    title = o.get("title") or ""; desc = strip_html(o.get("description") or "")
    cve = norm_cve(desc + " " + title)
    if cve and dedup_cve(cve): return
    cw = cat_from_word(title)  # 含 [M/H] 等
    category, severity = cw if cw else ("medium","未評估")
    nid = re.search(r'NCSC-\d{4}-\d+', title)
    year = (nid.group(0)[5:9] if nid else "2026")
    if cve:
        fname = uniq(f"{year}-{cve}"); seen_cve_this_run.add(cve)
    elif nid:
        fname = uniq(f"{year}-ncsc-nl-{nid.group(0).lower()}")
    else:
        fname = uniq(f"{year}-ncsc-nl-{slugify(title)}")
    emit(category, fname, cve or "未提供", None, "", "NCSC-NL", "未提供", "未提供",
         severity, "未提供", "未提供", "中", title + (" — " + desc if desc else ""), "",
         "請參閱 NCSC-NL advisory 與廠商修補。", o.get("link") or "https://advisories.ncsc.nl/", "", "ncsc-nl")

# ---------- hkcert ----------
def proc_hkcert(o):
    title = o.get("title") or ""; desc = strip_html(o.get("description") or "")
    cve = norm_cve(title + " " + desc)
    if cve and dedup_cve(cve): return
    cw = cat_from_word(title + " " + desc)
    category, severity = cw if cw else ("medium","未評估")
    year = "2026"
    if cve:
        fname = uniq(f"{year}-{cve}"); seen_cve_this_run.add(cve)
    else:
        fname = uniq(f"{year}-hkcert-{slugify(title)}")
    rem = "請參閱 HKCERT 保安公告與廠商修補。"
    emit(category, fname, cve or "未提供", None, "", "HKCERT", "未提供", "未提供",
         severity, "未提供", "未提供", "低" if not desc else "中",
         title + (" — " + desc if desc else ""), "", rem,
         o.get("link") or "https://www.hkcert.org/", "", "hkcert")

# ---------- ncsc-fi-vulns ----------
def proc_ncscfi(o):
    title = o.get("title") or ""; desc = o.get("description") or ""
    cvss_m = re.search(r'CVSSv?[\d.]*:\s*([\d.]+)', desc)
    cves = list(dict.fromkeys(m.upper() for m in CVE_RE.findall(desc + " " + title)))
    primary = next((c for c in cves if c not in by_cve and c not in seen_cve_this_run), None)
    if cves and not primary:
        global skipped; skipped += 1; return
    if cvss_m:
        category, severity = cat_from_score(cvss_m.group(1)); cvss = cvss_m.group(1)
    else:
        cw = cat_from_word(desc); category, severity = cw if cw else ("medium","未評估"); cvss = "未提供"
    year = "2026"
    if primary:
        fname = uniq(f"{year}-{primary}"); seen_cve_this_run.add(primary)
    else:
        fname = uniq(f"{year}-ncsc-fi-vulns-{slugify(title)}")
    emit(category, fname, ", ".join(cves) if cves else "未提供", None, "", "NCSC-FI Vulnerabilities",
         "未提供", "未提供", severity, cvss, "未提供", "中",
         title + " — " + strip_html(desc), "", "請參閱官方 advisory 與廠商修補。",
         o.get("link") or "https://www.kyberturvallisuuskeskus.fi/", "", "ncsc-fi-vulns")

HANDLERS = {
    "nvd-cve": proc_nvd, "gh-advisories": proc_gh, "msrc": proc_msrc,
    "govcert-hk": proc_govcerthk, "cert-pl": proc_certpl, "ncsc-nl": proc_ncscnl,
    "hkcert": proc_hkcert, "ncsc-fi-vulns": proc_ncscfi,
}

for jf in sorted(glob.glob(BASE + "/raw/*.jsonl")):
    name = os.path.basename(jf).replace(".jsonl","")
    h = HANDLERS.get(name)
    if not h: continue
    with open(jf) as f:
        for line in f:
            line = line.strip()
            if not line: continue
            try: o = json.loads(line)
            except: continue
            try: h(o)
            except Exception as e: sys.stderr.write(f"ERR {name}: {e}\n")

print("=== vulnerability_tracking 確定性萃取完成 ===")
for k,v in written.items(): print(f"  {k}: 新增 {v}")
print(f"  跳過(已存在/重複): {skipped}")
print(f"  REVIEW_NEEDED: {review_needed}")
print(f"  總新增: {sum(written.values())}")

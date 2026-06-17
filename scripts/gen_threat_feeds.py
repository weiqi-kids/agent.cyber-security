#!/usr/bin/env python3
"""確定性 threat_feeds 萃取器：依 Layer CLAUDE.md 模板將 raw JSONL 轉為 .md。
規則：category 由 source 對應；URL 脫敏 hxxp；檔名 hash/domain/IP；索引去重；collisions -N。
"""
import json, os, re, glob, sys
from datetime import datetime, timezone

BASE = "docs/Extractor/threat_feeds"
NOW = datetime.now(timezone.utc).strftime("%Y-%m-%d %H:%M")

# 既有檔名索引（去重）
existing = set()
for fp in glob.glob(BASE + "/**/*.md", recursive=True):
    if "/raw/" in fp or os.path.basename(fp) == "index.md":
        continue
    existing.add(os.path.basename(fp))

written = {"malicious_url":0, "malware_sample":0, "ioc_indicator":0, "c2_infrastructure":0}
skipped = 0
created_this_run = set()

def defang(u):
    if not u: return u
    return u.replace("https://","hxxps://").replace("http://","hxxp://")

def slugify(s, maxlen=60):
    s = (s or "").lower()
    s = re.sub(r'[^a-z0-9]+', '-', s)
    s = re.sub(r'-+', '-', s).strip('-')
    return s[:maxlen].rstrip('-') or "ioc"

def domain_of(url):
    m = re.sub(r'^https?://', '', url or '')
    m = m.split('/')[0].split(':')[0]
    return m

def uniq_name(base):
    """base 不含 .md。回傳可用檔名（含 .md），處理 collisions。"""
    cand = base + ".md"
    if cand not in existing and cand not in created_this_run:
        return cand
    i = 2
    while True:
        cand = f"{base}-{i}.md"
        if cand not in existing and cand not in created_this_run:
            return cand
        i += 1
        if i > 200:
            return f"{base}-{i}.md"

def write_md(category, fname, content):
    d = os.path.join(BASE, category)
    os.makedirs(d, exist_ok=True)
    with open(os.path.join(d, fname), "w") as f:
        f.write(content)
    created_this_run.add(fname)
    written[category] += 1

def md_template(title, date, source, category, threat_type, family, status, level, conf, desc, ioc_type, ioc_value, source_url, source_id, relation=""):
    return f"""# {title}

| 項目 | 內容 |
|------|------|
| **日期** | {date} |
| **來源** | {source} |
| **分類** | {category} |
| **威脅類型** | {threat_type} |
| **惡意程式家族** | {family} |
| **狀態** | {status} |
| **威脅等級** | {level} |
| **信心水準** | {conf} |

## 威脅描述

{desc}

## IoC 指標

| 類型 | 值 |
|------|-----|
| {ioc_type} | `{ioc_value}` |

## 關聯分析

{relation or "無已識別的關聯。"}

## 來源連結

- [{source}]({source_url})

---
> 萃取時間：{NOW} UTC
> 資料來源：{source} {source_id}
"""

def proc_urlhaus(o):
    global skipped
    url = (o.get("url") or "").strip()
    if not url: return
    date = (o.get("dateadded") or "")[:10] or "2026-01-01"
    dom = domain_of(url)
    base = f"{date}-{slugify(dom)}"
    fname = uniq_name(base)
    if fname in existing:
        skipped += 1; return
    threat = o.get("threat") or ""
    tt = "malware" if "malware" in threat else ("phishing" if "phish" in threat else "other")
    tags = ", ".join(o.get("tags") or []) if isinstance(o.get("tags"), list) else ""
    status = o.get("url_status") or "unknown"
    desc = f"abuse.ch URLhaus 回報的惡意 URL（威脅：{threat or 'N/A'}{('；標籤：'+tags) if tags else ''}）。回報者：{o.get('reporter','N/A')}。狀態：{status}。最後上線：{o.get('last_online','N/A')}。"
    content = md_template(
        title=f"惡意 URL：{dom}", date=date, source="abuse.ch URLhaus",
        category="malicious_url", threat_type=tt, family="未知", status=status,
        level="未評估", conf="中", desc=desc, ioc_type="url",
        ioc_value=defang(url), source_url=o.get("urlhaus_link") or "https://urlhaus.abuse.ch/",
        source_id="urlhaus-recent")
    write_md("malicious_url", fname, content)

def proc_mb(o):
    global skipped
    sha = (o.get("sha256") or "").strip()
    if not sha: return
    date = (o.get("first_seen") or "")[:10] or "2026-01-01"
    base = f"{date}-{sha[:16].lower()}"
    fname = uniq_name(base)
    if fname in existing:
        skipped += 1; return
    sig = (o.get("signature") or "").strip() or "未知"
    ftype = (o.get("file_type") or "").strip()
    fnm = (o.get("file_name") or "").strip()
    desc = f"abuse.ch MalwareBazaar 收錄的惡意程式樣本（檔名：{fnm or 'N/A'}；類型：{ftype or 'N/A'}）。簽章/家族：{sig}。回報者：{(o.get('reporter') or '').strip() or 'N/A'}。"
    content = md_template(
        title=f"惡意程式樣本：{sig if sig!='未知' else (fnm or sha[:16])}", date=date,
        source="abuse.ch MalwareBazaar", category="malware_sample",
        threat_type="malware", family=sig, status="unknown", level="未評估",
        conf="中", desc=desc, ioc_type="hash_sha256", ioc_value=sha,
        source_url=f"https://bazaar.abuse.ch/sample/{sha}/", source_id="malwarebazaar-recent")
    write_md("malware_sample", fname, content)

def proc_tf(o):
    global skipped
    val = (o.get("ioc_value") or "").strip()
    if not val: return
    date = (o.get("first_seen_utc") or "")[:10] or "2026-01-01"
    itype = o.get("ioc_type") or "ioc"
    fam = o.get("malware_printable") or o.get("malware") or "unknown"
    base = f"{date}-threatfox-{slugify((fam if fam!='unknown' else val))}"
    fname = uniq_name(base)
    if fname in existing:
        skipped += 1; return
    cl = o.get("confidence_level")
    conf = "高" if (isinstance(cl,int) and cl>=80) else ("中" if (isinstance(cl,int) and cl>=50) else "低")
    tt = o.get("threat_type") or "other"
    iv = defang(val) if itype in ("url",) else val
    norm_itype = {"domain":"domain","ip:port":"ip","url":"url","md5_hash":"hash_md5","sha256_hash":"hash_sha256"}.get(itype, itype)
    desc = f"abuse.ch ThreatFox 分享的 IoC 指標（威脅類型：{tt}；惡意程式：{fam}）。信心水準：{cl}。最後出現：{o.get('last_seen_utc','N/A')}。"
    content = md_template(
        title=f"IoC 指標：{fam if fam!='unknown' else val}", date=date,
        source="abuse.ch ThreatFox", category="ioc_indicator", threat_type=tt,
        family=fam, status="unknown", level="未評估", conf=conf, desc=desc,
        ioc_type=norm_itype, ioc_value=iv,
        source_url="https://threatfox.abuse.ch/", source_id="threatfox-recent")
    write_md("ioc_indicator", fname, content)

def proc_feodo(o):
    global skipped
    ip = (o.get("ip_address") or "").strip()
    if not ip: return
    date = (o.get("first_seen") or o.get("last_online") or "")[:10] or "2026-01-01"
    base = f"{date}-{ip.replace('.','-')}"
    fname = uniq_name(base)
    if fname in existing:
        skipped += 1; return
    fam = o.get("malware") or "未知"
    status = o.get("status") or "unknown"
    desc = f"abuse.ch Feodo Tracker 追蹤的 C2 伺服器（IP：{ip}:{o.get('port','N/A')}；家族：{fam}）。狀態：{status}。AS：{o.get('as_number','N/A')} {o.get('as_name','')}。"
    content = md_template(
        title=f"C2 基礎設施：{ip}", date=date, source="abuse.ch Feodo Tracker",
        category="c2_infrastructure", threat_type="botnet", family=fam, status=status,
        level="High", conf="中", desc=desc, ioc_type="ip", ioc_value=ip,
        source_url="https://feodotracker.abuse.ch/", source_id="feodo-c2")
    write_md("c2_infrastructure", fname, content)

HANDLERS = {
    "urlhaus-recent": proc_urlhaus,
    "malwarebazaar-recent": proc_mb,
    "threatfox-recent": proc_tf,
    "feodo-c2": proc_feodo,
}

for jf in sorted(glob.glob(BASE + "/raw/*.jsonl")):
    name = os.path.basename(jf).replace(".jsonl","")
    h = HANDLERS.get(name)
    if not h:
        continue
    with open(jf) as f:
        for line in f:
            line = line.strip()
            if not line: continue
            try:
                o = json.loads(line)
            except Exception:
                continue
            try:
                h(o)
            except Exception as e:
                sys.stderr.write(f"ERR {name}: {e}\n")

print("=== threat_feeds 確定性萃取完成 ===")
for k,v in written.items():
    print(f"  {k}: 新增 {v}")
print(f"  跳過(已存在): {skipped}")
print(f"  總新增: {sum(written.values())}")

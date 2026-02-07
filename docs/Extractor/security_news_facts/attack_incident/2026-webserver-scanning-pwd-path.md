# Scanning Webserver with /$(pwd)/ as a Starting Path

| 項目 | 內容 |
|------|------|
| **日期** | 2026-01-26 |
| **來源** | SANS ISC |
| **分類** | attack_incident |
| **嚴重程度** | 低 |
| **信心水準** | 高 |

## 摘要

ISC sensors detected webserver scanning with $(pwd)/ path targeting config files (.env, terraform.tfstate, docker-compose.yml) from IPs 185.177.72.52/23 since Jan 13, 2026.

## 事實內容

SANS ISC analysis of webserver scanning activity:

**Timeline:**
- Activity started: January 13, 2026 (based on ISC sensor reports)
- Analyst's sensor detected: January 21, 2026
- Activity level: Limited probes

**Observed Patterns:**

**Targeted Files:**
- Environment files: `.env.staging`, `.env.development`, `.env.production`, `.env.local`, `.env`
- Infrastructure files: `terraform.tfstate`, `docker-compose.yml`, `netlify.toml`

**Attack Pattern:**
- Using `$(pwd)/` path pattern
- Focus on configuration and infrastructure files

**Threat Assessment:**

**Source IPs:**
- 185.177.72.52
- 185.177.72.23

**Threat Level:** Green (low)

**Activity Scope:**
- "This activity has been limited to a few scans based on the reports"
- Suggests reconnaissance rather than active exploitation

**Open Questions:**
- ISC researchers requested community feedback on "what tool is used to perform these scans"
- Indicates uncertainty about attacker tooling or intent

**Analysis Methods:**
- Kibana ES|QL queries
- Gephi network visualization for mapping scanning relationships

## 受影響系統

- Web servers exposing configuration files
- Docker deployments
- Terraform infrastructure
- Environment configuration systems

## 來源連結

- [Scanning Webserver with /$(pwd)/ as a Starting Path](https://isc.sans.edu/diary/rss/32654)

---
> 萃取時間：2026-01-27 UTC
> 資料來源：SANS ISC sans-isc

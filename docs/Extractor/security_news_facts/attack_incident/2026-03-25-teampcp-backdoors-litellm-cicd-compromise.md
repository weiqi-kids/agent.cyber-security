# TeamPCP Backdoors LiteLLM via Trivy CI/CD Compromise

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-25 |
| **來源** | NCSC-FI Daily News |
| **分類** | attack_incident |
| **嚴重程度** | 高 |
| **信心水準** | 高 |

## 摘要

Threat actor TeamPCP compromised popular Python package litellm versions 1.82.7–1.82.8 via a Trivy CI/CD pipeline compromise, deploying a three-stage attack with credential harvester, Kubernetes lateral movement toolkit, and persistent systemd backdoor.

## 事實內容

Multiple security vendors (Endor Labs and JFrog) revealed a supply chain attack on the litellm Python package:

Threat actor: TeamPCP (previously compromised Trivy and KICS)

Compromised package: litellm (popular Python LLM integration library)
- Malicious versions: 1.82.7 and 1.82.8
- Published: March 24, 2026
- Attack vector: Likely via litellm's use of Trivy in their CI/CD workflow
- Status: Both backdoored versions removed from PyPI

Three-stage payload (described by Endor Labs researcher Kiran Raj):
1. **Credential harvester**: Sweeps SSH keys, cloud credentials, Kubernetes secrets, cryptocurrency wallets, and .env files
2. **Kubernetes lateral movement toolkit**: Deploys privileged pods to every node in the cluster
3. **Persistent systemd backdoor**: "sysmon.service" — polls "checkmarx[.]zone/raw" for additional binaries

This is a sophisticated supply chain attack leveraging CI/CD pipeline compromise to inject malicious code into a widely used AI/ML development tool.

## 受影響系統

- litellm Python package (versions 1.82.7 and 1.82.8)
- Kubernetes environments
- Developer systems using litellm for LLM integration
- CI/CD pipelines using Trivy for container scanning

## 來源連結

- [TeamPCP Backdoors LiteLLM Versions 1.82.7–1.82.8 Likely via Trivy CI/CD Compromise](https://thehackernews.com/2026/03/teampcp-backdoors-litellm-versions.html)

---
> 萃取時間：2026-03-25 00:00 UTC
> 資料來源：NCSC-FI Daily News ncsc-fi-news

# Trivy Vulnerability Scanner Breach Pushed Infostealer via GitHub Actions

| 項目 | 內容 |
|------|------|
| **日期** | 2026-03-22 |
| **來源** | NCSC-FI (Finland) |
| **分類** | attack_incident |
| **嚴重程度** | High |
| **信心水準** | 高 |

## 摘要

The Trivy vulnerability scanner was compromised in a supply-chain attack by threat actors known as TeamPCP, which distributed credential-stealing malware through official releases and GitHub Actions workflows. This affects organizations that use Trivy in their CI/CD pipelines.

## 事實內容

Threat actors identified as "TeamPCP" executed a supply-chain attack against Trivy, a widely-used open-source security scanner. The attackers compromised the Trivy GitHub repository and poisoned official releases with infostealer malware distributed through GitHub Actions workflows.

Key points:
- Victim: Trivy vulnerability scanner (open-source security tool)
- Threat actor: TeamPCP
- Attack type: Supply-chain compromise
- Malware delivered: Credential-stealing malware (infostealer)
- Delivery method: Official releases and GitHub Actions
- Scope: Organizations using Trivy in CI/CD pipelines at risk

Trivy is a popular security scanner used to:
- Identify vulnerabilities in containers and Kubernetes
- Scan infrastructure as code (IaC) for misconfigurations
- Detect exposed secrets in code repositories
- Cloud infrastructure security scanning

Compromising a security tool that is embedded in CI/CD pipelines provides attackers with privileged access to build environments and potentially secrets.

## 受影響系統

- Organizations using Trivy in CI/CD pipelines
- Kubernetes and container security scanning environments
- GitHub Actions workflows using Trivy

## 來源連結

- [Trivy vulnerability scanner breach pushed infostealer via GitHub Actions](https://www.bleepingcomputer.com/news/security/trivy-vulnerability-scanner-breach-pushed-infostealer-via-github-actions/)

---
> 萃取時間：2026-03-23 01:30 UTC
> 資料來源：NCSC-FI (Finland) ncsc-fi-news

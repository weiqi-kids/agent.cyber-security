# Cyber Security Considerations for Drone Use (ITSAP.00.143)

| 項目 | 內容 |
|------|------|
| **日期** | 2026-01-27 |
| **來源** | Canadian Centre for Cyber Security |
| **分類** | industry_trend |
| **嚴重程度** | 中 |
| **信心水準** | 高 |

## 摘要

Canada's Cyber Centre releases guidance on cybersecurity risks associated with drone (Unmanned Aerial System) use in organizational settings, covering data privacy, communication hijacking, and supply chain risks.

## 事實內容

The Canadian Centre for Cyber Security published ITSAP.00.143, providing cybersecurity considerations for organizations and individuals using drones (Unmanned Aerial Systems / UAS). Drones are mobile vehicle systems that can function with varying degrees of autonomy from human operators.

Key cybersecurity risks covered:
- **Communication interception**: Drone control signals and video feeds are often transmitted wirelessly and may be intercepted or jammed by adversaries
- **GPS spoofing**: Attackers can manipulate GPS signals to redirect drones or cause them to crash
- **Remote takeover**: Vulnerabilities in drone firmware or control applications can allow unauthorized parties to seize control of the aircraft
- **Data privacy**: Drones equipped with cameras and sensors collect large amounts of data that may include sensitive or classified information; improper data handling poses privacy and security risks
- **Supply chain risks**: Many commercial drones are manufactured by foreign companies; concerns exist regarding potential backdoors or data exfiltration to foreign servers (particularly relevant for Chinese-manufactured drones)
- **Network integration risks**: Drones connecting to organizational Wi-Fi or cloud services can serve as entry points for network intrusions

Recommended mitigations:
- Use drones from trusted vendors with transparent data handling practices
- Encrypt drone communications and data at rest
- Implement strict access controls for drone management software
- Conduct security assessments before deploying drones in sensitive environments
- Follow Transport Canada regulations on drone operation in restricted airspace

## 受影響系統

- Drone (UAS) hardware and firmware
- Drone control applications and mobile software
- Organizational networks connected to drone systems
- Sensitive data collected by drone-mounted sensors

## 來源連結

- [Cyber security considerations for drone use (ITSAP.00.143)](https://cyber.gc.ca/en/guidance/cyber-security-considerations-drone-use-itsap00143)

---
> 萃取時間：2026-03-25 00:00 UTC
> 資料來源：Canadian Centre for Cyber Security ca-news

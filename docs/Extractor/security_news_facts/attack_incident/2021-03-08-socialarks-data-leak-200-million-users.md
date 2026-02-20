# Socialarks Data Leak Exposes Over 200 Million Users - Protection Guidelines

| Item | Content |
|------|---------|
| **Date** | 2021-03-08 |
| **Source** | CNCS (Portugal) |
| **Category** | attack_incident |
| **Severity** | High |
| **Confidence** | High |

## Summary

Unprotected ElasticSearch database at Socialarks exposes personal data of 214 million social media users including IP addresses, phone numbers, emails, and names.

## Factual Content

The company's database (ElasticSearch) was unprotected and contained personal information exposed after the attack. This includes IP addresses, phone numbers, email addresses, and full names of at least 214 million users of these social networks. The security flaw in the company's server meant that anyone who had the server's IP address could access the database containing personal information of millions of people.

**Recommendations for users of these social networks:**
- Be suspicious of calls from unknown numbers
- Do not open links or attachments sent from unknown numbers or emails
- Pay attention when verifying if the email sender is known or just similar (e.g., joaosousa@gov.pt is not the same as j0aosousa@gov.pt, nor joaosousa@gov.tt)
- Be wary of instant messages from strangers
- Do not use personal information to construct passwords (e.g., date of birth or phone number)

**Recommendations for information system administrators:**
- Systems should not be publicly available except when strictly necessary
- Always protected with authentication
- Use multi-factor authentication when possible
- Apply security updates periodically

## Affected Systems

- Socialarks ElasticSearch database
- 214 million social media users

## Source Links

- [Socialarks alvo de leak de dados que resulta na exposição de mais de 200 milhões de utilizadores](https://dyn.cncs.gov.pt/pt/detalhe/art/135532/socialarks-alvo-de-leak-de-dados-que-resulta-na-exposicao-de-mais-de-200-milhoes-de-utilizadores-saiba-como-se-proteger-de-situacoes-como-esta)

---
> Extraction Time: 2026-02-20 09:00 UTC
> Data Source: CNCS (Portugal) cncs-pt
> Notes: Original language: Portuguese (CNCS Portugal)

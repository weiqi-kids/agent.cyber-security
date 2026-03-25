# FIRST Challenge 2021 Writeup

| Item | Content |
|------|---------|
| **Date** | 2021-06-30 |
| **Source** | CERT.at (Austria) |
| **Category** | attack_incident |
| **Severity** | High |
| **Confidence** | High |


## Summary
Due to the COVID-19 pandemic the FIRST conference 2021 moved online and so did the annual CTF organized by the FIRST Security Lounge SIG. Thomas...

## Factual Content
Due to the COVID-19 pandemic the FIRST conference 2021 moved online and so did the annual CTF organized by the FIRST Security Lounge SIG. Thomas Pribitzer, Dimitri Robl, and Sebastian Waldbauer from CERT.at participated as a team, scoring the 9. place out of 42 teams. This post is a writeup of the challenges we were able to solve.
The challenges were organized into different categories and new challenges were released each day. However, the writeup will only reflect the categories, not the days they were published.

Network

print 'print'
AAAA
Man or Machine
The Secrets of a Dragon Fly [part 1]
Email Exfil
sudo su

Reverse Engineering

Secret document 1/3
Secret document 2/3
Secret document 3/3
File in the wild (1/2)

Forensics

Russian Dolls (1/2)
Russian Dolls (2/2)
Crhome Matser

Miscellaneous

Just run with Steve J.
my man!
The Bit Maker

Cryptography/Forensics

The Secret

ICS

HMI Pwning - 1
Hiding on the Modbus - 1
Hiding in the Noise - 1

Web

Clear Intentions
Permutation Lock 
Time to REST
Intern Dev Tango

Cryptography

Decode
Decode 2
Decode 3


Network
In total there were seven challenges of which we solved six.
print &lsquo;print&rsquo;
This challenge involved analyzing a PCAP file. The description was:

Custom print, copy, and faxing services! And who said print media is dead?

Looking at the PCAP file, we could quickly locate an interesting HTTP POST request which said:
POST /PDF HTTP/1.1
Content-T

## Source Links
- [FIRST Challenge 2021 Writeup](https://www.cert.at/en/blog/2021/6/first-challenge-2021-writeup)

---
> Extraction time: 2026-03-07 UTC
> Data source: CERT.at (Austria) 

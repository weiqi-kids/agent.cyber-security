| 欄位 | 內容 |
|------|------|
| **標題** | LLMs as Lossy Compression of Information |
| **來源** | CERT.at (Austria) |
| **發布時間** | 2025-01-22T09:52:49Z |
| **信心度** | 中 |

## 摘要

Back when I was studying computer science, one of the interesting bits was the discussion of the inf...

## 事實內容

Back when I was studying computer science, one of the interesting bits was the discussion of the information content in a message which is distinct to the actual number of bits used to transmit the same message. I can remember a definition which involved the sum of logarithms of long-term occurrences versus the transmitted messages. The upshot was, that only if 0s and 1s are equally distributed, then each Bit contains one bit worth of information. The next iteration was compressibility: if there are patterns in the message, then a compression algorithm can reduce the number of bits needed to store the full message, thus the information content in original text does not equal its number of bits. This could be a simple Huffman encoding, or more advanced algorithms like Lempel-Ziv-Welch, but ...

## 受影響系統

- 依內容而定（需參閱完整文章）

## 來源連結

- [CERT.at - LLMs as Lossy Compression of Information](https://www.cert.at/en/blog/2025/1/llms-as-lossy-compression-of-information)

## 萃取時間

2026-02-15T00:00:00+08:00

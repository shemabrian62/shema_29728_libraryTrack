# Smart Library Book Borrowing and Fine Tracking System for a Rwandan Community Library

**Student:** Shema Brian
**Student ID:** 29728
**Course:** INSY 8311 – Database Development with PL/SQL
**Instructor:** Eric Maniraguha
**Academic year:** 2026–2027, Semester I

---

## Problem Statement
A community library in Rwanda uses paper cards to track book borrowing and returns. This causes three main problems:
1. Books are lost because there is no clear record of who has them.
2. Late fines are calculated by hand, which causes mistakes and arguments with members.
3. There is no waiting list, so if a book is out, other members cannot know when it will be available.

## Objectives
**Main objective:** Build an Oracle database with PL/SQL that tracks borrowed books, calculates late fines automatically, and manages waiting lists.

**Specific objectives:**
1. Design normalized tables for members, books, borrowing records, fines, and waiting queues.
2. Use PL/SQL triggers to block members who have 3 or more overdue books.
3. Use PL/SQL functions to calculate fines in RWF based on how many days a book is late.
4. Build a dashboard to show the most borrowed books and unpaid fines.

## Data Source
- **Main dataset:** Book-Crossing Dataset (Kaggle) - real book titles, authors, and publication years (about 278,000 books). Link: https://www.kaggle.com/datasets/ruchi798/bookcrossing-dataset
- **Reference Data:** Member names, Rwandan locations, and fine rates (in RWF) will be created by me, because the public dataset does not have Rwandan library members.

## Innovation
A **Power BI dashboard** connected to the Oracle database. It will show: most borrowed books, members with unpaid fines, and the current waiting list.

## Planned Tables
| Table | Purpose |
|---|---|
| `MEMBER` | Library members (name, phone, address) |
| `BOOK` | Book details (title, author, ISBN) |
| `AUTHOR` | Author details |
| `BORROW_RECORD` | Which member borrowed which book and when |
| `FINE` | Late fines in RWF |
| `WAITING_QUEUE` | Members waiting for a book that is fully borrowed |
| `APP_USER` | Librarian and admin users |
| `AUDIT_LOG` | Every change and denied action |

## Planned PL/SQL Features
| Feature | Where it is used |
|---|---|
| Procedure `borrow_book` | Saves a new borrowing record and checks if the member is allowed to borrow. |
| Function `calculate_fine` | Calculates days late × 100 RWF (or a set rate). |
| Trigger `trg_block_overdue` | Stops a member with 3 overdue books from borrowing a new one. |
| Trigger `trg_auto_fine` | Automatically creates a fine when a book is returned late. |
| Trigger `trg_audit` | Writes every change into `AUDIT_LOG`. |
| Package `library_pkg` | Groups the main procedures and functions. |
| Cursor | Monthly report of most borrowed books. |
| `DBMS_SCHEDULER` job | Runs every night to check for newly overdue books. |

## References
See `docs/research/research_log.md` for the full APA list.

## Phase I - Business Process Modeling

- **Selected process:** Library Book Borrowing and Returning Process.
- **Modeling tool used:** draw.io (diagrams.net)
- **Published diagram link:** [Click here to view the diagram](https://viewer.diagrams.net/?tags=%7B%7D&lightbox=1&highlight=0000ff&edit=_blank&layers=1&nav=1&dark=auto#R%3Cmxfile%3E%3Cdiagram%20name%3D%22Page-1%22%20id%3D%22T_ydXhKDFKVbCHm30Vuq%22%3E7Zxrc5s4F4B%2FDTPth3RA3D%2FGdtx2JnnTibe7m0%2FvYJBtGmy8gHPZX78SEiBuAscGxy6ZNLXFERLnHD06uiHI4%2FXr18Daru58B3oCEJ1XQZ4IAOi6gv7ihDeSoGg0YRm4DkmSsoSZ%2By%2BkiSJN3bkODHOCke97kbvNJ9r%2BZgPtKJdmBYH%2Fkhdb%2BF6%2B1K21hKWEmW155dS%2FXCdakVRDFbP0b9BdrpKSJZFeWVuJME0IV5bjvzBJ8o0gjwPfj8in9esYelh3iV5IvmnN1bRiAdxEFRl%2BhjC4n%2F%2FCOgGiZ82RWWIhWjsYrC3XmViRRZP1kQA0AchI8TL6KMa%2F2j87XL2Rg%2BXSb4J8nbu68PwXe2UFuKQ%2FJoI63iT5ya8a%2F4qzF3ftWRtIst%2FB9RwGReFwN19iP8oEULI6QmJM8VNRMKeCKQnXCnsjRkKtqEX2eyd9QvecRbjGcV0e4D87GOLqj3z%2FCeX%2BzM0OcPabjUMyx1nwf9jboNOYW87n9nz7qToXRDI4qZ0%2Bb915YAWuVZJnVJrJcLVqCDdAMETBmCSJQBiNC2W01vathJVtx4V%2BnxDHsdZb4mVU39z8AOX%2F6j5D9HlOdB35sQsTu%2FMzyyjzH6Tl0AwFtR%2Bm9dlbGME1R%2BVUoF7fSLUjVu4TbpNzK4Sf91HyTEIN%2BJsVoo8y%2Buc%2Fw8DZJRpDCJwKOj8%2FBsD3MFOx9Wy5iBoYg415sY5jheZaI8rx6QFazuemqiso%2BziAVoTrO7p%2FeLj%2F6%2F8PN%2BP7h0lyG3K18UYqutHPrUNvRJ4DtfJoFyY3IlerbtRk9ilinJB2M66%2FCYuid4jI4tUVMtkyIs6NPT8vc1uSmZVkit9nSR7xEYal7HJJXC5VoyRzW5K5K8nUV%2BN%2FfqkWoDE34ORWS9Jq6Rn2KKFKTUpJXNm%2FiFtQzHMHuE4z9j0%2FwJUhwLKesGO6cYdMvHMb%2BAsYhsidLK94F9uzwnACF%2BhjiLsq3GWgAMZFLMPokR0VGg56inEYBf4T4ZFsgLmsaWni1QuJWa7B9jWGSG0RqCY2qkm%2BBAsaC7tQgmYbcL54RwkOtF38pLkiFosFsItFONpcU1s%2FRGWRtD2OkYHQH5nVYU0laescYyOPcQMZz%2BI%2FWMOxPyYaqs%2BPm8g49sP0WbGXpAgHY06IhciycJfFIGuzw10XLx8iPdFqXXQmAbYK2X10Eg2mAeWvV%2Fht4ZmPz9P51c9nZ%2Fsj%2BPXvlZQGqmkAShFI%2BgYmvmUjURqchtFbIrQM%2FB3u86PA2oREdOTvNg4OzyWUDh03%2Bm5jjcVfSff8lWSa4PrGN%2FhhOY67WWIhogtcCtJABF%2BZgml9v0J%2FDaPgDYlYdBSwTJOyQBl9oM%2BWfGVCZ34o3dyFs8H2d6po9IzXiSxzeYQyzDKFraK1R5XxsnIjONtaNr608V9QaIFSSeNIBiUScYXIRUOXa89dYkVGPpbDjS0GUXxfeTqd6jeTND97ZWQC9Pwoh7%2BJmHQx%2FqHpU2vtengs9wDtHfI8FJaRC3ToJin41slQR0q%2FVN2PXLlfLEIY%2FY2uKYW0x1zayNsF1BeoENKIG%2BG6aKkvMLr80%2FJ2cD9DcZsCKDcF1uXrm0%2BuHQxm3c%2BscR38XRAraRVFaNgPVEw4FbVf%2FAcLhF%2BWvr%2F0oLV1wy%2B2v44v2GEsOl2QR0Mfcw%2FXmh0rZnhvKCbJ95LNBWjJFAe9jUx5mEx4AJ3ORnTCIG7MX0sfiUeeYOWv5zvc0THOmndLUHRf6rwFp6S9e4VT0i6%2B5JTAwHb66E7JY02zQbiUkd9BGVCizGDCJhPGTSilLBA%2FHGqAaJRQk6Ylt1HkPGuMLlFTOz1QixkwYKYrzPCNwUWMMiBmQExbxAA8YmQQI5udhjOFacRsuEqnEmtRI79nLFUZcoOyh9KJkAoPpbMhZ%2BqhPMC0sgSXM%2BpRODPY7kzpoukluEgqyMNF6ZMtNWsMjGcn6wy1lFEGyhyXMnvahMsbbeDNwBsubxTTyAFHVzsdMNWsRTLOnaxH1gJHHYBzXODsaRMucPQBOANw%2BAGOqfUJnHjluwIlMJ7zTReu8WApmaWuJgt0lulXP4hW%2FhKvUN9kqaMAL95Bh7oE0uRz%2FCU2Jl5pvca7oQS8roG3yozgxklS5vHAIk6iLmagb792621SohXYSQr1QVDl3qnbMS2IddzUiUaW%2FbSMK8zktuOfpkZQ1Wrgqxt7t%2FhFVunXR1o8avvBG7mmKcn3x1QvxZaMFLWE0Q8YuMgJYIBbPlndVBoolhqayyejzCdsWMbB9wBW0uzq5OQS2C7CiZTzdqKOiUnK5niFWo3RAHpWFN%2BIccUqJsZZkdEtdhV%2F67uo0sydf%2BAEhrpSnrrA0Fi%2BluSL0%2Bj7ysu0J6iVT3bdVsujD%2BQJM%2FqnqjqwQ8CbrVr0B2DoD47SlDVOU1Y77A4SM3N7A3PoDc6gN%2BjShU7dGbALT%2F11Bnp%2BzN8Ed7mwf6MgfyJYgwzW6gDrzuMuWTs1rcn5p75wrQy4%2FoBOdGpes%2FNb%2FfHaNPNTJlIDr1WJJ98hr7mzLQywlQHYnYdGnQK73WyLVLFXfiD2hyN2p150amKzS6C9EVvW8gTWZJVLbEU%2BTF4HBldeVWWefIc9Qu4Mbd3R2bq1vmqJvk6FiNPJ9LqqxYLJRBlNy03rPI4P8LDe3lp87oMy9z%2FSwZALtezHWguU5IqDIWL%2BYIim5icWgFkP4sPXArkn7msZxD0YMqxU7w%2BZZjPw4fKe8yDSsMngPCmiqCWIlHYUFPZjq51CpP61G7UEAQNBjkuQBhvw8fGesx4DPn6rPUoKyC%2BQdHuIjPMunlqkDGc7joyUJiPwmfKecx0DU34rphQOdnSLlOr3wdXRpOJyX3Msk6kynVY57I2hm1PzXEfiLedYirbhQ%2BY9hzl6nFS5UFN%2BLNBUTqokk83J5LOeI02y0NbRnErtKyNradN2QiW%2FNlPVIVqBTd1DrV6ZKPaP5P1gFT5KXxJ2pv0jd7aFbyA%2Bct5znCPZaVrNnMGoFx306HkUpdM3vUQ9te%2BfrUVR25mZwWuPgSK%2Bffgkqji4MZBoIFFrEimadhISNUzk3LWdyBm89bgEaj%2B3U3FIYCDPbzn4qlqLKgU8OcponS5FVVIFxkOsdKslXr6%2BpK2W2a41dtOa%2BMU0hd7OFrWgBjjKXvVk9qZp56Okl3AzWLXeqo17BnNbDDrYNJhr%2BkfbaVdHg1vmWONAg5PQ4Cj7oFvT4NxPGn4wGnQMg7odxIVZXJ1%2FoLokb%2FLlgX6YvCL1dWC7lmszOYtyLuz1HcxpKo1tAjz%2FJ82jZ7CBPsGmXgzXerFqc5hzkldRSKLBI0mjfBOppMKm4r3l9ZOT7TYj293Fkk1t2QSqX6LcKdUqdhh3GK5dDtY6N2kz0tjZuv6QVjzHQKrRGjmS2SCvaIfJ6zn5kwRrahasgUtFmsZpAIWDlCeJ1iq2PnfHtcuZk%2BrHrM1sO8nLYpTClLaUvOqr9qyppB6WoSkgLMo3BXiqsl8AWZI%2FfUA4U35zehbe%2BncSelZs8u6OnuUFxMGsZ0hPrXA2rRGGGtAPy9BEz6J8Iw1N6TD509PzNnvzzN3F0rPt2Os07KzYu97hiPrc3wTTr1Wb0cluvusNnWqyeaLloLoo3zRIVg3jMPmjD6pRUuD7EXuHwNqu7nwHI%2B7mPw%3D%3D%3C%2Fdiagram%3E%3C%2Fmxfile%3E)
- **Supporting explanation document:** [docs/business_process/business_process_explanation.pdf](docs/business_process/business_process_explanation.pdf)

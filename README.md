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

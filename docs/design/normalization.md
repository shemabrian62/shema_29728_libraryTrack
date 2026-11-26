# Normalization Process

We take a raw record from `BX-Books.csv` and normalize it up to Third Normal Form (3NF). 

**Raw Record Example:**
`ISBN: 0195153448, Title: Classical Mythology, Author: Mark P. O. Morford, Year: 2002, Publisher: Oxford University Press`

### 1. Unnormalized Form (UNF)
The raw data sits in one wide table. There are no repeating groups in a single book record, but multiple books could share the same author or publisher, leading to data redundancy.

### 2. First Normal Form (1NF)
**Rule:** Eliminate repeating groups and ensure atomic values.
**Action:** Our data is already in 1NF because each column holds only one value (e.g., only one author, one publisher). 

### 3. Second Normal Form (2NF)
**Rule:** Remove partial dependencies (all non-key columns must depend on the whole primary key).
**Action:** The Primary Key is `ISBN`. All columns (Title, Author, Year, Publisher) depend entirely on the `ISBN`. There are no composite keys in the raw data, so it is already in 2NF.

### 4. Third Normal Form (3NF)
**Rule:** Remove transitive dependencies (non-key columns must not depend on other non-key columns).
**Action:** 
- We see that `Publisher` depends on the book, but a publisher has its own details. We extract this into a `PUBLISHER` table.
- An `Author` can write multiple books, so we extract `AUTHOR` into its own table.
- We create a `BOOK` table that links to them via Foreign Keys.

**Final 3NF Tables for Phase 2:**
1. **PUBLISHER** (publisher_id, publisher_name)
2. **AUTHOR** (author_id, author_name)
3. **BOOK** (isbn, title, year_published, author_id, publisher_id)

*(Note: To make this a complete Library System as per Phase 0, we will also add: `MEMBER`, `BORROW_RECORD`, `FINE`, and `WAITING_QUEUE` tables in the Logical ERD).*

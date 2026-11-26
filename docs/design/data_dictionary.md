# Data Dictionary

| Table | Column | Meaning | Required? | Unique? |
|---|---|---|---|---|
| **AUTHOR** | author_id | Unique ID for the author | Yes | Yes (PK) |
| | author_name | Full name of the author | Yes | No |
| **PUBLISHER** | publisher_id | Unique ID for the publisher | Yes | Yes (PK) |
| | publisher_name | Name of the publisher | Yes | No |
| **BOOK** | isbn | International Standard Book Number | Yes | Yes (PK) |
| | title | Title of the book | Yes | No |
| | year_published | Year the book was published | No | No |
| | author_id | Links to the AUTHOR table | Yes | No (FK) |
| | publisher_id | Links to the PUBLISHER table | Yes | No (FK) |
| **MEMBER** | member_id | Unique ID for the library member | Yes | Yes (PK) |
| | full_name | Member's full name | Yes | No |
| | phone | Member's phone number | Yes | Yes |
| **BORROW_RECORD** | borrow_id | Unique ID for the transaction | Yes | Yes (PK) |
| | member_id | Links to MEMBER | Yes | No (FK) |
| | isbn | Links to BOOK | Yes | No (FK) |
| | borrow_date | Date the book was taken | Yes | No |
| | due_date | Date the book must be returned | Yes | No |
| | return_date | Date the book was actually returned | No | No |
| | status | Borrowed, Returned, Overdue | Yes | No |
| **FINE** | fine_id | Unique ID for the fine | Yes | Yes (PK) |
| | borrow_id | Links to BORROW_RECORD | Yes | No (FK) |
| | amount_rwf | Fine amount in Rwandan Francs | Yes | No |
| | status | Paid or Unpaid | Yes | No |
| **WAITING_QUEUE**| queue_id | Unique ID for the queue entry | Yes | Yes (PK) |
| | isbn | Links to BOOK | Yes | No (FK) |
| | member_id | Links to MEMBER | Yes | No (FK) |

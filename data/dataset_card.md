# Dataset Card

- **Source:** Kaggle - Book-Crossing Dataset (https://www.kaggle.com/datasets/ruchi798/bookcrossing-dataset)
- **File used:** BX-Books.csv
- **Licence:** Educational use / Open Database License.
- **Format:** CSV (Comma Separated Values)
- **Size:** Approximately 270,000 records.
- **Date collected:** 2026-11-12
- **What one record represents:** One record represents a single book, including its ISBN, title, author, publication year, and publisher.

## Data Quality Issues (Reported, not yet cleaned)
- **Missing data:** Many books have "Unknown" or "NULL" for the Publisher and Year of Publication.
- **Data type issues:** Year of Publication is stored as text (e.g., "1998") instead of a number, and some years are invalid (e.g., "0").
- **Spelling variants:** Author names may have different spellings, and Publisher names might have trailing spaces.
- **Duplicates:** Some ISBNs might appear more than once.
*(Note: Cleaning will be performed in Phase IV).*

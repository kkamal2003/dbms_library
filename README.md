# dbms_library  
**Table Creation: The script creates the following tables:**

- BOOKS: Stores information about books, such as their ID, title, and author.
- USERS: Stores information about library users, including their ID, name, and designation (student or staff).
- ISSUES: Manages book issuance details, such as issue ID, book ID, borrower ID, issue date, and expiration date.
- RETURNS: Tracks book return details, including return ID, book ID, borrower ID, issue date, return date, and delay (late return).
- FINE: Records fine information for late book returns, including fine ID, book ID, borrower ID, delay, and fine amount.
- Insert Statements: The script inserts data into the BOOKS, USERS, ISSUES, RETURNS, and FINE tables to populate them with sample information.

**Sequences: The script defines the ISSUE_ID_SEQ sequence to auto-generate unique issue IDs for the ISSUES table.**

**Triggers:**

- ISSUE_TRG: Automatically populates borrower names, borrower designations, and book titles in the ISSUES table upon data insertion.
- ISSUE_EXPIRY: Automatically calculates the expiration date for book issues based on the borrower's designation (student or staff).
- RETURN_ID_TRG: Automatically populates return IDs, borrower IDs, borrower names, issue dates, and deadline dates in the RETURNS table based on corresponding values from the ISSUES table.
- RETURN_DELAY_TRG: Calculates the delay in returning a book and populates the DELAY column in the RETURNS table.
- FINE_TRG: Automatically populates fine IDs, book titles, borrower IDs, borrower names, and delay values in the FINE table based on corresponding values from the RETURNS table.
- FINE_AMT_TRG: Calculates the fine amount based on the delay value and populates the FINE_AMOUNT column in the FINE table.
**Select Statements: The script includes several SELECT statements to display the contents of the users, issues, fine, returns, and books tables.**

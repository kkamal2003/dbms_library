REM   Script: DBMS-project
REM   library management

BEGIN 
    EXECUTE IMMEDIATE 'DROP TABLE BOOKS CASCADE CONSTRAINT PURGE'; 
	EXCEPTION 
    WHEN OTHERS THEN 
    NULL; 
END; 
/

Create table books( 
BOOK_ID VARCHAR2(10 CHAR), 
BOOK_TITLE VARCHAR2(300 CHAR), 
BOOK_AUTHOR VARCHAR2(50 CHAR), 
Constraint PK_BOOKS PRIMARY KEY (BOOK_ID) 
);

BEGIN 
    EXECUTE IMMEDIATE 'DROP TABLE USERS CASCADE CONSTRAINT PURGE'; 
	EXCEPTION 
    WHEN OTHERS THEN 
    NULL; 
END; 
/

Create table users( 
USER_ID VARCHAR2(10 CHAR), 
NAME VARCHAR2(50 CHAR), 
DESIGNATION VARCHAR2(10 CHAR), 
CONSTRAINT PK_USERS PRIMARY KEY (USER_ID) 
);

BEGIN 
    EXECUTE IMMEDIATE 'DROP TABLE ISSUES CASCADE CONSTRAINT PURGE'; 
	EXCEPTION 
    WHEN OTHERS THEN 
    NULL; 
END; 
/

Create table issues( 
Issue_ID	Number(10,0), 
Book_ID	VARCHAR2(10 CHAR), 
Book_Title	Varchar2(100 CHAR), 
Borrower_ID	VARCHAR2(10 CHAR), 
Borrower_Name	Varchar2(100 CHAR), 
Borrower_Designation	Varchar2(50 CHAR), 
Issue_Date	date, 
Date_Expiry	date, 
CONSTRAINT PK_ISSUE PRIMARY KEY (ISSUE_ID) 
);

BEGIN 
    EXECUTE IMMEDIATE 'DROP TABLE RETURNS CASCADE CONSTRAINT PURGE'; 
	EXCEPTION 
    WHEN OTHERS THEN 
    NULL; 
END; 
/

Create table returns( 
Return_ID	Number(10,0), 
Book_ID	VARCHAR2(10 CHAR), 
Borrower_ID	VARCHAR2(10 CHAR), 
Borrower_Name	Varchar2(100 CHAR), 
Issue_date Date, 
Deadline_Date DATE, 
Return_Date	DATE, 
Delay	NUMBER(10,0), 
CONSTRAINT PK_RETURN PRIMARY KEY (RETURN_ID), 
CONSTRAINT FK_RETURN FOREIGN KEY (RETURN_ID) 
REFERENCES ISSUES(ISSUE_ID) 
);

BEGIN 
    EXECUTE IMMEDIATE 'DROP TABLE FINE CASCADE CONSTRAINT PURGE'; 
	EXCEPTION 
    WHEN OTHERS THEN 
    NULL; 
END; 
/

Create table fine( 
Fine_ID	Number(10,0), 
Book_ID VARCHAR2(10 CHAR), 
Book_Title	Varchar2(100 CHAR), 
Borrower_ID	VARCHAR2(10 CHAR), 
Borrower_Name	Varchar2(100 CHAR), 
Delay	NUMBER(19,9), 
Fine_Amount	NUMBER(38,19), 
CONSTRAINT PK_FINE PRIMARY KEY (FINE_ID), 
CONSTRAINT FK_FINE FOREIGN KEY(FINE_ID) 
REFERENCES RETURNS(RETURN_ID) 
);

Insert into Books (Book_ID, Book_Author, Book_Title) values ('B001','Sewell, A.','The adventures of black beauty');

Insert into Books (Book_ID, Book_Author, Book_Title) values ('B002','Hates, S.','The candlewick book of fairy tales');

Insert into Books (Book_ID, Book_Author, Book_Title) values ('B003','Alcott, L.M.','Little women');

Insert into Books (Book_ID, Book_Author, Book_Title) values ('B004','Noonan, D.','The last steam train');

Insert into Books (Book_ID, Book_Author, Book_Title) values ('B005','Hill, A.','The burnt stick');

Insert into Books (Book_ID, Book_Author, Book_Title) values ('B006','Rowe, J.','Hidden treasures');

Insert into Books (Book_ID, Book_Author, Book_Title) values ('B007','O Brien, M.L.','Wunambi');

Insert into Books (Book_ID, Book_Author, Book_Title) values ('B008','Spyri, J.','Heidi');

Insert into Books (Book_ID, Book_Author, Book_Title) values ('B009','Harris, R. and Harp, B.','The dream');

Insert into Books (Book_ID, Book_Author, Book_Title) values ('B010','Bucikingham, S.','Alec and his flying bed');

Insert into Books (Book_ID, Book_Author, Book_Title) values ('B011','Honey, E.','Honey sandwich');

Insert into Books (Book_ID, Book_Author, Book_Title) values ('B012','Bernestain, S. and Bernestain, J.','Get in a fight');

Insert into Books (Book_ID, Book_Author, Book_Title) values ('B013','Adams, J.','Pigs and honey');

Insert into Books (Book_ID, Book_Author, Book_Title) values ('B014','Koplow, L.','Tanya and the tobo man');

Insert into Books (Book_ID, Book_Author, Book_Title) values ('B015','Armitage, R. and Armitage, D.','The light house keepers catastrope');

Insert into Users (USER_ID, NAME, DESIGNATION) values ('STUD_001','Nishant','STUDENT');

Insert into Users (USER_ID, NAME, DESIGNATION) values ('STAF_001','Shubham','STAFF');

Insert into Users (USER_ID, NAME, DESIGNATION) values ('STUD_002','Logan','STUDENT');

Insert into Users (USER_ID, NAME, DESIGNATION) values ('STUD_003','Aryan','STUDENT');

Insert into Users (USER_ID, NAME, DESIGNATION) values ('STUD_004','Paul','STUDENT');

Insert into Users (USER_ID, NAME, DESIGNATION) values ('STUD_005','Adam','STUDENT');

Insert into Users (USER_ID, NAME, DESIGNATION) values ('STAF_002','Lin','STAFF');

Insert into Users (USER_ID, NAME, DESIGNATION) values ('STAF_003','Xu','STAFF');

INSERT INTO issues (Issue_ID, Book_ID, Book_Title, Borrower_ID, Borrower_Name, Borrower_Designation, Issue_Date, Date_Expiry) 
VALUES (1, 'B001', 'The adventures of black beauty', 'STUD_001', 'Nishant', 'STUDENT', '24-jan-23', '3-feb-23');

INSERT INTO issues (Issue_ID, Book_ID, Book_Title, Borrower_ID, Borrower_Name, Borrower_Designation, Issue_Date, Date_Expiry) 
VALUES (2, 'B007', 'Wunambi', 'STAF_001', 'Shubham', 'STAFF', '12-feb-23', '22-feb-23');

INSERT INTO issues (Issue_ID, Book_ID, Book_Title, Borrower_ID, Borrower_Name, Borrower_Designation, Issue_Date, Date_Expiry) 
VALUES (3, 'B015', 'The light house keepers catastrope', 'STAF_003', 'Xu', 'STAFF', '24-mar-23', '3-apr-23');

INSERT INTO issues (Issue_ID, Book_ID, Book_Title, Borrower_ID, Borrower_Name, Borrower_Designation, Issue_Date, Date_Expiry) 
VALUES (4, 'B013', 'Pigs and honey', 'STUD_004', 'Paul', 'STUDENT', '4-mar-23', '14-mar-23');

INSERT INTO issues (Issue_ID, Book_ID, Book_Title, Borrower_ID, Borrower_Name, Borrower_Designation, Issue_Date, Date_Expiry) 
VALUES (5, 'B004', 'The last steam train', 'STUD_002', 'Logan', 'STUDENT', '25-jan-23', '4-feb-23');

INSERT INTO issues (Issue_ID, Book_ID, Book_Title, Borrower_ID, Borrower_Name, Borrower_Designation, Issue_Date, Date_Expiry) 
VALUES (6, 'B006', 'Hidden treasures', 'STUD_005', 'Adam', 'STUDENT', '28-feb-23', '10-mar-23');

INSERT INTO issues (Issue_ID, Book_ID, Book_Title, Borrower_ID, Borrower_Name, Borrower_Designation, Issue_Date, Date_Expiry) 
VALUES (7, 'B009', 'The dream', 'STUD_003', 'Aryan', 'STUDENT', '02-jan-23', '12-jan-23');

INSERT INTO issues (Issue_ID, Book_ID, Book_Title, Borrower_ID, Borrower_Name, Borrower_Designation, Issue_Date, Date_Expiry) 
VALUES (8, 'B012', 'Get in a fight','STAF_002','Lin', 'STAFF', '15-feb-23', '25-feb-23');

INSERT INTO returns (Return_ID, Book_ID, Borrower_ID, Borrower_Name, Issue_date, Deadline_Date, Return_Date, Delay) 
VALUES (1, 'B001', 'STUD_001', 'Nishant', '24-jan-23','3-feb-23','3-feb-23', 0);

INSERT INTO returns (Return_ID, Book_ID, Borrower_ID, Borrower_Name, Issue_date, Deadline_Date, Return_Date, Delay) 
VALUES (2, 'B007', 'STAF_001', 'Shubham',  '12-feb-23', '22-feb-23','26-feb-23', 4);

INSERT INTO returns (Return_ID, Book_ID, Borrower_ID, Borrower_Name, Issue_date, Deadline_Date, Return_Date, Delay) 
VALUES (3, 'B015', 'STAF_003', 'Xu', '24-mar-23','3-apr-23','8-apr-23', 5);

INSERT INTO returns (Return_ID, Book_ID, Borrower_ID, Borrower_Name, Issue_date, Deadline_Date, Return_Date, Delay) 
VALUES (4, 'B013', 'STUD_004', 'Paul', '4-mar-23','14-mar-23','14-mar-23', 0);

INSERT INTO returns (Return_ID, Book_ID, Borrower_ID, Borrower_Name, Issue_date, Deadline_Date, Return_Date, Delay) 
VALUES (5, 'B004', 'STUD_002', 'Logan', '25-jan-23','4-feb-23','6-feb-23', 2);

INSERT INTO returns (Return_ID, Book_ID, Borrower_ID, Borrower_Name, Issue_date, Deadline_Date, Return_Date, Delay) 
VALUES (6, 'B006', 'STUD_005', 'Adam', '28-feb-23','10-mar-23','11-mar-23', 1);

INSERT INTO returns (Return_ID, Book_ID, Borrower_ID, Borrower_Name, Issue_date, Deadline_Date, Return_Date, Delay) 
VALUES (7, 'B009', 'STUD_003', 'Aryan', '02-jan-23','12-jan-23','12-jan-23', 0);

INSERT INTO returns (Return_ID, Book_ID, Borrower_ID, Borrower_Name, Issue_date, Deadline_Date, Return_Date, Delay) 
VALUES (8, 'B012', 'STAF_002', 'Lin', '15-feb-23','25-feb-23','02-mar-23', 5);

INSERT INTO fine (Fine_ID, Book_ID, Book_Title, Borrower_ID, Borrower_Name, Delay, Fine_Amount) 
VALUES (1, 'B001','The adventures of black beauty', 'B001','Nishant', 0, 0);

INSERT INTO fine (Fine_ID, Book_ID, Book_Title, Borrower_ID, Borrower_Name, Delay, Fine_Amount) 
VALUES (2, 'B007','Wunambi', 'B007','Shubham', 4, 5);

INSERT INTO fine (Fine_ID, Book_ID, Book_Title, Borrower_ID, Borrower_Name, Delay, Fine_Amount) 
VALUES (3, 'B015','The light house keepers catastrope', 'B015','Xu', 5, 2.5);

INSERT INTO fine (Fine_ID, Book_ID, Book_Title, Borrower_ID, Borrower_Name, Delay, Fine_Amount) 
VALUES (4, 'B013','Pigs and honey', 'B013', 'Paul', 0, 1.5);

INSERT INTO fine (Fine_ID, Book_ID, Book_Title, Borrower_ID, Borrower_Name, Delay, Fine_Amount) 
VALUES (5, 'B004','The last steam train', 'B004','Logan', 2, 2.5);

INSERT INTO fine (Fine_ID, Book_ID, Book_Title, Borrower_ID, Borrower_Name, Delay, Fine_Amount) 
VALUES (6, 'B006', 'Hidden treasures', 'B006', 'Adam', 1, 1.5);

INSERT INTO fine (Fine_ID, Book_ID, Book_Title, Borrower_ID, Borrower_Name, Delay, Fine_Amount) 
VALUES (7, 'B009','The dream', 'B009','Aryan', 0, 0);

INSERT INTO fine (Fine_ID, Book_ID, Book_Title, Borrower_ID, Borrower_Name, Delay, Fine_Amount) 
VALUES (8, 'B012','Get in a fight', 'B012','Lin', 5, 5);

commit;

BEGIN 
    EXECUTE IMMEDIATE 'DROP SEQUENCE ISSUE_ID_SEQ'; 
    EXCEPTION 
        WHEN OTHERS THEN 
            IF SQLCODE!= -2289 THEN 
            RAISE; 
            END IF; 
END; 
/

CREATE SEQUENCE ISSUE_ID_SEQ 
  MINVALUE 1 
  MAXVALUE 100000 
  START WITH 1 
  INCREMENT BY 1;

CREATE OR REPLACE TRIGGER ISSUE_TRG 
BEFORE INSERT ON ISSUES 
FOR EACH ROW 
DECLARE 
BORROW_NAME VARCHAR2(60); 
BORROW_DESIGN VARCHAR2(60); 
BOOK_NAME VARCHAR2(100); 
BEGIN 
IF :NEW.ISSUE_ID IS NULL THEN 
      SELECT ISSUE_ID_SEQ.NEXTVAL into :NEW.ISSUE_ID from dual; 
END IF; 
IF :NEW.BORROWER_NAME IS NULL THEN 
SELECT NAME INTO BORROW_NAME FROM USERS WHERE USER_ID = :NEW.BORROWER_ID; 
SELECT BORROW_NAME INTO :NEW.BORROWER_NAME FROM DUAL; 
END IF; 
IF :NEW.BORROWER_DESIGNATION IS NULL THEN 
SELECT DESIGNATION INTO BORROW_DESIGN FROM USERS WHERE USER_ID = :NEW.BORROWER_ID; 
SELECT BORROW_DESIGN INTO :NEW.BORROWER_DESIGNATION FROM DUAL; 
END IF; 
IF :NEW.BOOK_TITLE IS NULL THEN 
SELECT BOOK_TITLE INTO BOOK_NAME FROM BOOKS WHERE BOOK_ID = :NEW.BOOK_ID; 
SELECT BOOK_NAME INTO :NEW.BOOK_TITLE FROM DUAL; 
END IF; 
END; 
/

CREATE OR REPLACE TRIGGER ISSUE_EXPIRY 
BEFORE INSERT ON ISSUES 
FOR EACH ROW 
DECLARE 
student_expiration integer := 10; 
staff_expiration integer := 10; 
issuer_designation varchar2(50 CHAR); 
BEGIN 
IF :NEW.DATE_EXPIRY IS NULL THEN 
SELECT designation INTO ISSUER_DESIGNATION FROM USERS WHERE user_id = :new.borrower_id; 
 IF ISSUER_DESIGNATION = 'STUDENT' THEN 
 SELECT (:new.issue_date + student_expiration) into :new.date_expiry from dual; 
 elsif ISSUER_DESIGNATION = 'STAFF' THEN 
 SELECT (:new.issue_date + staff_expiration) into :new.date_expiry from dual; 
 END IF; 
END IF; 
END; 
/

CREATE OR REPLACE TRIGGER RETURN_ID_TRG 
BEFORE INSERT ON RETURNS 
FOR EACH ROW 
DECLARE 
ID INTEGER; 
BEGIN 
IF :NEW.RETURN_ID IS NULL THEN 
SELECT MAX(ISSUE_ID) INTO ID FROM ISSUES where BOOK_ID = :NEW.BOOK_ID; 
SELECT ID INTO :NEW.RETURN_ID FROM DUAL; 
END IF; 
IF :NEW.BORROWER_ID IS NULL THEN 
SELECT MAX(ISSUE_ID) INTO ID FROM ISSUES where BOOK_ID = :NEW.BOOK_ID; 
SELECT BORROWER_ID INTO :NEW.BORROWER_ID FROM ISSUES WHERE ISSUE_ID = ID; 
END IF; 
IF :NEW.BORROWER_NAME IS NULL THEN 
SELECT MAX(ISSUE_ID) INTO ID FROM ISSUES where BOOK_ID = :NEW.BOOK_ID; 
SELECT BORROWER_NAME INTO :NEW.BORROWER_NAME FROM ISSUES WHERE ISSUE_ID = ID; 
END IF; 
IF :NEW.ISSUE_DATE IS NULL THEN 
SELECT MAX(ISSUE_ID) INTO ID FROM ISSUES where BOOK_ID = :NEW.BOOK_ID; 
SELECT ISSUE_DATE INTO :NEW.ISSUE_DATE FROM ISSUES WHERE ISSUE_ID = ID; 
END IF; 
IF :NEW.DEADLINE_DATE IS NULL THEN 
SELECT MAX(ISSUE_ID) INTO ID FROM ISSUES where BOOK_ID = :NEW.BOOK_ID; 
SELECT DATE_EXPIRY INTO :NEW.DEADLINE_DATE FROM ISSUES WHERE ISSUE_ID = ID; 
END IF; 
END; 
/

CREATE OR REPLACE TRIGGER RETURN_DELAY_TRG 
BEFORE INSERT ON RETURNS 
FOR EACH ROW 
DECLARE 
ID INTEGER; 
DEADLINE_DATE DATE; 
date1 date; 
date2 date; 
BEGIN 
IF :NEW.DELAY IS NULL THEN 
SELECT MAX(ISSUE_ID) INTO ID FROM ISSUES where BOOK_ID = :NEW.BOOK_ID; 
SELECT DATE_EXPIRY INTO DEADLINE_DATE FROM ISSUES where ISSUE_ID = ID; 
date1 := to_date(DEADLINE_DATE, 'DD-MM-YYYY'); 
date2 := to_date(:new.return_date,'DD-MM-YYYY'); 
IF date2 - date1 <= 0 THEN 
:NEW.DELAY := 0; 
ELSIF date2 - date1  > 0 THEN 
:new.delay := date2 - date1; 
END IF; 
END IF; 
END; 
/

CREATE OR REPLACE TRIGGER FINE_TRG 
BEFORE INSERT ON FINE 
FOR EACH ROW 
DECLARE 
ID INTEGER; 
BEGIN 
IF :NEW.FINE_ID IS NULL THEN 
SELECT MAX(RETURN_ID) INTO ID FROM RETURNS where BOOK_ID = :NEW.BOOK_ID; 
SELECT RETURN_ID INTO :NEW.FINE_ID FROM RETURNS WHERE RETURN_ID = ID; 
END IF; 
IF :NEW.BOOK_TITLE IS NULL THEN 
SELECT MAX(ISSUE_ID) INTO ID FROM ISSUES where BOOK_ID = :NEW.BOOK_ID; 
SELECT BOOK_TITLE INTO :NEW.BOOK_TITLE FROM ISSUES WHERE ISSUE_ID = ID; 
END IF; 
IF :NEW.BORROWER_ID IS NULL THEN 
SELECT MAX(RETURN_ID) INTO ID FROM RETURNS where BOOK_ID = :NEW.BOOK_ID; 
SELECT BORROWER_ID INTO :NEW.BORROWER_ID FROM RETURNS WHERE RETURN_ID = ID; 
END IF; 
IF :NEW.BORROWER_NAME IS NULL THEN 
SELECT MAX(RETURN_ID) INTO ID FROM RETURNS where BOOK_ID = :NEW.BOOK_ID; 
SELECT BORROWER_NAME INTO :NEW.BORROWER_NAME FROM RETURNS WHERE RETURN_ID = ID; 
END IF; 
IF :NEW.DELAY IS NULL THEN 
SELECT MAX(RETURN_ID) INTO ID FROM RETURNS where BOOK_ID = :NEW.BOOK_ID; 
SELECT DELAY INTO :NEW.DELAY FROM RETURNS WHERE RETURN_ID = ID; 
END IF; 
END; 
/

create or replace trigger fine_amt_trg 
BEFORE INSERT ON FINE 
FOR EACH ROW 
DECLARE 
ID integer; 
FINE_AMT number(38,0); 
DELAY_DAYS integer; 
BEGIN 
IF :NEW.FINE_AMOUNT is NULL THEN 
SELECT MAX(RETURN_ID) INTO ID FROM RETURNS where BOOK_ID = :NEW.BOOK_ID; 
SELECT DELAY*10 INTO :NEW.FINE_AMOUNT FROM RETURNS WHERE RETURN_ID = ID; 
END IF; 
END; 
/

select * from users;
select * from issues;
select* from fine;
select * from returns;
select * from  books;
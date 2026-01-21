# Experiment 1

## Aim
To design and implement a Library Management System database using appropriate tables, primary keys, foreign keys, and constraints, and to perform DML operations along with DCL commands such as role creation, privilege granting, and revoking to ensure database security.

## Objectives
* To gain practical experience in implementing Data Definition Language (DDL), Data Manipulation Language (DML), and Data Control Language (DCL) operations in a real database environment.
* To implement role-based privileges to secure data.

---

## Practical/Experiment Steps
* Created table `BOOKS` to store book details including BOOK_ID, BOOK_NAME, and AUTHOR_NAME.
* Created `LIBRARY_VISITORS` table to manage member information including NAME, AGE, and EMAIL.
* Designed `BOOK_ISSUE` table to link books and visitors for the borrowing process.
* Established Primary Keys for each table to uniquely identify records.
* Applied Constraints to validate that age is greater than 17 and to prevent duplicate emails.
* Utilized `INSERT`, `UPDATE`, and `DELETE` statements for record management.
* Created a new role of Librarian to manage the tables.
* Managed security using `GRANT` and `REVOKE` commands.

---

## Procedure
1. Start the computer system.
2. Open the software (PostgreSQL/pgAdmin) and login.
3. Create or select the database.
4. Write and execute appropriate SQL commands.
5. Verify output and record results with screenshots.

---

## I/O Analysis

### 1. Table Creation: BOOKS
**Input:**
```sql
CREATE TABLE BOOKS(
    BOOK_ID INT PRIMARY KEY,
    BOOK_NAME VARCHAR(20) NOT NULL,
    AUTHOR_NAME VARCHAR(20) NOT NULL,
    BOOK_COUNT INT CHECK(BOOK_COUNT > 0) NOT NULL
);
```

**Output:**
![Books Table Creation](Exp1_Images/1.png)

### 2. DML Operations: Insert and Select
**Input:**
```sql
INSERT INTO BOOKS VALUES(101, 'Harry Potter', 'JK Rowling', 3);
SELECT * FROM BOOKS;
```

**Output:**
![Insert and Select Books](Exp1_Images/2.png)
![Insert and Select Books](Exp1_Images/3.png)

### 3. Table Creation: LIBRARY_VISITORS
**Input:**
```sql
CREATE TABLE LIBRARY_VISITORS(
    USER_ID INT PRIMARY KEY,
    NAME VARCHAR(20) NOT NULL,
    AGE INT CHECK(AGE >= 17) NOT NULL,
    EMAIL VARCHAR(20) NOT NULL UNIQUE
);
```

**Output:**
![Visitors Table](Exp1_Images/4.png)

### 4. Insert and Select: LIBRARY_VISITORS
**Input:**
```sql
INSERT INTO LIBRARY_VISITORS(USER_ID, NAME, AGE, EMAIL)
VALUES(101, 'Vansh Sharma', 18, 'vansh12@gmail.com')
SELECT * FROM LIBRARY_VISITORS
```

**Output:**
![Visitors Table](Exp1_Images/5.png)
![Visitors Table](Exp1_Images/6.png)

### 4. Table Creation: BOOK_ISSUE (Foreign Keys)
**Input:**
```sql
CREATE TABLE BOOK_ISSUE(
    BOOK_ISSUE_ID INT PRIMARY KEY,
    USER_ID INT NOT NULL,
    BOOK_ID INT NOT NULL,
    FOREIGN KEY(USER_ID) REFERENCES LIBRARY_VISITORS(USER_ID),
    FOREIGN KEY(BOOK_ID) REFERENCES BOOKS(BOOK_ID)
);
```

**Output:**
![Book Issue Table](Exp1_Images/7.png)

### 4. Insert and Select: BOOK_ISSUE
**Input:**
```sql
INSERT INTO BOOK_ISSUE VALUES(1001, 101, 101, '2026-01-09')
SELECT * FROM BOOK_ISSUE
```

**Output:**
![Book Issue Table](Exp1_Images/8.png)
![Book Issue Table](Exp1_Images/9.png)


### 5. DCL Commands: Roles and Privileges
**Input:**
```sql
CREATE ROLE LIBRARIAN WITH LOGIN PASSWORD 'mehak1234';
GRANT SELECT, INSERT, DELETE, UPDATE ON BOOKS TO LIBRARIAN;
REVOKE SELECT, INSERT, DELETE, UPDATE ON BOOKS, BOOK_ISSUE, LIBRARY_VISITORS FROM LIBRARIAN;
```

**Output:**
![DCL Operations](Exp1_Images/10.png)
![DCL Operations](Exp1_Images/11.png)

---

## Learning Outcomes
* Gained hands-on experience with PostgreSQL and pgAdmin.
* Mastered writing queries to create, alter, and delete tables.
* Learned to manage database security by creating roles and granting/revoking access.
* Successfully implemented Primary Keys, Foreign Keys, and Check Constraints.

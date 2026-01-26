# Experiment 1

## Aim
To design and implement a Library Management System database using appropriate tables, primary keys, foreign keys, and constraints, and to perform DML operations along with DCL commands such as role creation, privilege granting, and revoking to ensure database security.

## Objectives
To gain practical experience in implementing Data Definition Language (DDL), Data Manipulation Language (DML), and Data Control Language (DCL) operations in a real database environment. This will also include implementing role-based privileges to secure data.

---

## Practical/Experiment Steps
* Schema Architecture: Designed the fundamental structure by creating books and library_visitors tables. Robust data integrity was enforced using constraints such as NOT NULL, UNIQUE, and CHECK (notably restricting visitor registration to ages 18 and above).
* Relational Mapping: Established the book_issue table to serve as a transactional link, utilizing Foreign Keys to connect book records with visitor data.
* Data Seeding: Populated the database with a foundational dataset to validate the schema design and relationship logic.
* Operational Validation: Conducted stress tests on the data by performing updates and deletions to observe how the system handles referential integrity and constraints.
* Access Control Management: Implemented a security layer by creating a specific Librarian role. Access levels were meticulously defined and managed using GRANT and REVOKE commands.

---

## Procedure
1. Authenticated into the database server and established a stable connection.
2. Initialized a dedicated database environment for the Library Management System.
3. Executed CREATE TABLE scripts in a hierarchical order, ensuring parent tables were established before dependent transaction tables.
4. Used INSERT statements to populate the system with diverse sample records for books and visitors.
5. Ran complex SELECT queries to verify cross-table consistency and ensure data was stored accurately.
6. Applied UPDATE and DELETE operations to confirm that the database maintains its rules (constraints) during data changes.
7. Defined the Librarian role and assigned granular permissions for specific database operations.
8. Validated the security model by attempting restricted actions before and after revoking permissions.
9. Compiled the final SQL scripts and captured visual evidence (screenshots) of the successful command executions.

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

### 2. Insert and Select: BOOKS
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

### 4. Table Creation: BOOK_ISSUE
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


### 5. Creating Roles
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
* Gained hands-on experience to work with PostgreSQL and pgAdmin
* Writing queries to create and delete tables
* Learnt to alter tables, view tables, create roles, granting and revoking access to the roles
* Primary and foreign keys implementations and roles


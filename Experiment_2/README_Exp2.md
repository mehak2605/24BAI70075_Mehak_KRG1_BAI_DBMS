# Experiment 2

## Aim
To understand and implement SQL SELECT queries using various clauses such as WHERE, ORDER BY, GROUP BY, and HAVING to retrieve and manipulate data efficiently from relational database tables.

---

## Objectives
* To practice writing SQL SELECT statements.
* To apply filtering conditions using the WHERE clause.
* To sort query results using the ORDER BY clause.
* To group records using the GROUP BY clause.
* To filter grouped data using the HAVING clause.
* To analyze data using aggregate functions like COUNT(), SUM(), AVG(), MIN(), and MAX().


---

## Practical/Experiment Steps
* Schema Definition: Constructed the fundamental EMPLOYEE table structure, defining specific data types for employee IDs, names, departments, salaries, and joining dates.
* Data Population: Seeded the database with sample employee records across various departments (IT, HR, Finance) to create a functional dataset for testing.
* Aggregate Data Analysis: Implemented GROUP BY operations to calculate the average salary for each department using the AVG() aggregate function.
* Conditional Filtering: Applied high-level filtering logic using the HAVING clause to isolate specific records, such as employees with salaries exceeding 20,000.
* Data Sorting & Grouped Constraints: Configured queries to sort department averages in descending order and practiced applying secondary filters to grouped results.

---

## Procedure
1. Logged into the pgAdmin administration tool and established a connection to the PostgreSQL database server.
2. Initialized a new database environment to house the employee management system.
3. Ran the CREATE TABLE command to define the EMPLOYEE schema, ensuring EMP_ID was set as the Primary Key.
4. Executed multiple INSERT statements to populate the table with diverse sample books and visitor profiles—in this case, employee records.
5. Used SELECT queries paired with GROUP BY to verify that data was correctly stored and consistent across the table.
6. Applied HAVING and WHERE clauses to test how the system handles specific data retrieval conditions.
7. Utilized the ORDER BY clause to arrange the output in descending order based on average salaries.
8. Tested and verified the effectiveness of security or logic policies by ensuring queries returned expected results or empty sets when conditions weren't met.
9. Saved the final SQL script and captured screenshots of the execution results for record maintenance.

---

## I/O Analysis

### 1. Table Creation: EMPLOYEE
**Input:**
```sql
CREATE TABLE EMPLOYEE(
EMP_ID NUMERIC PRIMARY KEY,
EMP_NAME VARCHAR(20),
DEPARTMENT VARCHAR(20),
SALARY NUMERIC(10,2),
JOINING_DATE DATE
)
```

**Output:**


![Books Table Creation](Exp2_Images/1.png)

### 2. Data Insertion: EMPLOYEE
**Input:**
```sql
INSERT INTO EMPLOYEE VALUES(1, 'Aman', 'IT', 30000, '2023-05-23');
INSERT INTO EMPLOYEE VALUES(2, 'Sam', 'IT', 25000, '2016-05-23');
INSERT INTO EMPLOYEE VALUES(3, 'Neha', 'HR', 18000, '2025-09-19');
INSERT INTO EMPLOYEE VALUES(4, 'Suman', 'Finance', 20000, '2021-11-06');
INSERT INTO EMPLOYEE VALUES(5, 'Rohan', 'Finance', 24500, '2023-10-23');
INSERT INTO EMPLOYEE VALUES(6, 'Aditi', 'HR', 28000, '2018-04-16');
INSERT INTO EMPLOYEE VALUES(7, 'Aanya', 'IT', 26000, '2022-07-07')

```

**Output:**


![Books Table Creation](Exp2_Images/2.png)

### 3. Getting the average salary of various departments
**Input:**
```sql
SELECT DEPARTMENT, AVG(SALARY)::NUMERIC(10,2) AS AVG_SAL FROM EMPLOYEE
GROUP BY DEPARTMENT

```

**Output:**


![Books Table Creation](Exp2_Images/3.png)

### 4. Getting employees with a salary of more than 20000
**Input:**
```sql
SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE
GROUP BY EMP_ID
HAVING SALARY>20000

```

**Output:**


![Books Table Creation](Exp2_Images/4.png)

### 5. Getting the department with an average salary of more than 30000
**Input:**
```sql
SELECT DEPARTMENT, AVG(SALARY)::NUMERIC(10,2) AS AVG_SAL FROM EMPLOYEE
GROUP BY DEPARTMENT
HAVING AVG(SALARY)>30000


```

**Output:**


![Books Table Creation](Exp2_Images/5.png)

### 6. Arranging the departments in decreasing order of their average salaries
**Input:**
```sql
SELECT DEPARTMENT, AVG(SALARY)::NUMERIC(10,2) AS AVG_SAL FROM EMPLOYEE
GROUP BY DEPARTMENT
ORDER BY AVG(SALARY) DESC

```

**Output:**


![Books Table Creation](Exp2_Images/6.png)

---

## Learning Outcomes
* Learn to filter records using the WHERE clause.
* Group records using GROUP BY.
* Apply conditions on grouped data using HAVING.
* Sort query results using ORDER BY.

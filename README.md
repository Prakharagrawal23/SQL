# Basics SQL Notes: Key Concepts & Examples

---

## 1. Database Operations

### Create Database
```sql
CREATE DATABASE order_db;  -- Avoid reserved keywords like "ORDER"
CREATE DATABASE employee_db;
```

### Switch Database
```sql
USE employee_db;
```

### Delete Database
```sql
DROP DATABASE employee_db;  -- Irreversible action!
```

---

## 2. Table Operations

### Create Table
```sql
CREATE TABLE emp1 (
    ID INT PRIMARY KEY,
    NAME VARCHAR(50) NOT NULL,
    ADDRESS VARCHAR(255),  -- Use longer length for real-world addresses
    SALARY DECIMAL(10, 2),  -- Better for currency than INT
    bonus FLOAT
);
```

### Insert Data
```sql
-- Insert full row
INSERT INTO emp2 VALUES (1, 'Prakhar', 'India', 1000000, 3.5);

-- Insert partial data (specify columns)
INSERT INTO emp2 (id, name, bonus) VALUES (3, 'Rahul', 4.5);
```

### Read Data
```sql
SELECT * FROM emp2;
```

---

## 3. Constraints

### NOT NULL & UNIQUE
```sql
CREATE TABLE emp3 (
    id INT,
    email VARCHAR(128) NOT NULL,
    phone VARCHAR(20) UNIQUE  -- Allows one NULL unless specified otherwise
);
```

### CHECK & DEFAULT
```sql
CREATE TABLE emp4 (
    id INT,
    age INT CHECK (age > 18),
    country VARCHAR(30) DEFAULT 'INDIA'
);
```

### Primary Key
```sql
CREATE TABLE emp6 (
    id INT PRIMARY KEY,
    email VARCHAR(30)
);
```

### Foreign Key
```sql
CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE student (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);
```

---

## 4. Data Manipulation

### Filtering
```sql
SELECT * FROM employee WHERE salary > 70000;
SELECT * FROM employee WHERE location IS NULL;
```

### Sorting
```sql
SELECT * FROM employee ORDER BY salary DESC;  -- High to low
SELECT * FROM employee ORDER BY salary ASC;   -- Low to high
```

### Update Data
```sql
UPDATE employee3 SET location = 'Jhansi' WHERE location = 'rath';
```

### Delete Data
```sql
DELETE FROM employee WHERE id = 4;  -- Delete specific row
TRUNCATE TABLE employee3;  -- Remove all data, keep structure
```

---

## 5. Aggregations & Grouping

### Aggregate Functions
```sql
SELECT MAX(salary) FROM employee4;
SELECT MIN(salary) FROM employee4;
SELECT COUNT(id) AS total_employees FROM employee4;
```

### GROUP BY
```sql
-- Employees per location
SELECT location, COUNT(id) FROM employee4 GROUP BY location;

-- Highest salary per department
SELECT dept, MAX(salary) FROM employee4 GROUP BY dept;
```

### HAVING Clause
```sql
-- Departments with total salary > 1,000,000
SELECT dept, SUM(salary) 
FROM employee4 
GROUP BY dept 
HAVING SUM(salary) > 1000000;
```

---

## 6. Advanced Queries

### LIKE Operator
```sql
SELECT * FROM invoices WHERE description LIKE 'Wireless%';  -- Starts with
SELECT * FROM invoices WHERE description LIKE '%DPI';        -- Ends with
SELECT * FROM invoices WHERE description LIKE '%hub%';       -- Contains
```

### COALESCE (Handle NULLs)
```sql
SELECT name, COALESCE(age, 18) AS age FROM Employees33;  -- Replace NULL age with 18
SELECT id + COALESCE(salary, 0) AS total FROM Employees33;  -- Handle NULL salary
```

---

## 7. Joins

### Inner Join
```sql
SELECT e.*, d.dept_name 
FROM Employees12 e 
INNER JOIN Departments d ON e.dept_id = d.dept_id;
```

### Left/Right/Full Joins
```sql
SELECT e.*, d.dept_name 
FROM Employees12 e 
LEFT JOIN Departments d ON e.dept_id = d.dept_id;
```

### UNION vs UNION ALL
```sql
-- UNION (removes duplicates)
SELECT name FROM Employees12 
UNION 
SELECT dept_name FROM Departments;

-- UNION ALL (keeps duplicates)
SELECT name FROM Employees12 
UNION ALL 
SELECT dept_name FROM Departments;
```

---

## 8. Table Modifications (ALTER)

### Add Column
```sql
ALTER TABLE example1 ADD salary INT;
```

### Modify Column
```sql
ALTER TABLE example1 ALTER COLUMN salary VARCHAR(128);
```

### Drop Column
```sql
ALTER TABLE example1 DROP COLUMN salary;
```

---

## Key Takeaways

- Use `PRIMARY KEY` for unique row identification.
- `GROUP BY` for aggregations; `HAVING` to filter groups.
- `JOIN` to combine data from multiple tables.
- Handle NULLs with `COALESCE` or `IS NULL` checks.
- Always test `DELETE`/`DROP` commands—they’re irreversible!

---

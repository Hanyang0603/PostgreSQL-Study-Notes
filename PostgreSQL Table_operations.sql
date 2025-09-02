-- ============================ SQL Execution Order ============================
FROM
WHERE
GROUP BY
HAVING
SELECT（including CASE）
ORDER BY
LIMIT

-- ============================ Table Operations ============================

-- -------------------- TABLE CREATION & DATA INSERTION --------------------
CREATE TABLE sales (
    region TEXT,
    year   INT,
    amount NUMERIC
);

INSERT INTO sales VALUES
('Asia',   2023, 100),
('Asia',   2024, 200),
('Europe', 2023, 150),
('Europe', 2024, 250);

-- -------------------- DELETE ROWS --------------------
DELETE FROM users
WHERE last_login < '2020-01-01'
RETURNING id, name; -- Return the deleted rows
-- Execution order：FROM-WHERE-DELETE-RETURNING

DELETE FROM users
WHERE id NOT IN (
    SELECT MIN(id)
    FROM users
    GROUP BY email
    HAVING COUNT(*) > 1
);
-- NOTES：
-- DELETE cannot being used with GROUP BY and HAVING
-- Use a subquery in the DELETE statement to identify records to be deleted

DROP TABLE table_name;
-- Standard SQL command to permanently delete a table from a database. 
-- It removes the table structure, all its data, indexes, triggers, and constraints.
-- If the table does not exist, the database server will throw an error and halt the execution of the script. 

DROP TABLE IF EXISTS table_name;
-- Optional conditional clause that modifies the behavior of the DROP TABLE command.
-- "IF" it does not exist, do not throw an error; simply skip this statement and continue executing the rest of the script.
-- -------------------- UPDATE --------------------
UPDATE table_name
SET column1 = value1, column2 = value2, ...
[WHERE condition];
-- Always use WHERE clause
-- Test before updating

-- First check which rows will be updated
SELECT * FROM employees
WHERE department_id = 3;

-- Then execute the update
UPDATE employees
SET salary = salary * 1.15
WHERE department_id = 3;

-- -------------------- HORIZONTAL EXPAND --------------------
-- Join on multiple keys
FROM TABLE_1 
INNER JOIN TABLE_2
ON TABLE_1.FIELD1 = TABLE_2.FIELD2
AND TABLE_1.FIELD3 = TABLE_2.FIELD4  
-- Join on multiple tables
SELECT *
FROM t1
INNER JOIN t2
ON t1.col1 = t2.col2
INNER JOIN t3
ON t1.col1 = t3.col3
-- Execution order：FROM → JOIN 1 → JOIN 2 → SELECT

-- Other JOINs with similar syntax：
LEFT JOIN
RIGHT JOIN
FULL JOIN
CROSS JOIN

-- -------------------- VERTICAL EXPAND --------------------
UNION
-- Merge two or more datasets, automatically removing duplicate rows.
-- NOTES: The number and type of columns must be the same.

UNION ALL 
-- Keep all the rows, including the duplicate rows.
-- NOTES：
-- ORDER BY cannot appear in a SELECT subquery, 
-- only appear at the end of the entire UNION statement.
SELECT *
FROM TABLE_UP
UNION                 
-- or
UNION ALL
SELECT *
FROM TABLE_DOWN;


SELECT column1, column2, ...
FROM table1
INTERSECT
SELECT column1, column2, ...
FROM table2;
-- Find the intersection of two result sets


SELECT column1, column2 FROM table1
EXCEPT
SELECT column1, column2 FROM table2;
-- Returns rows that appear only in the first query and not in the second (difference)
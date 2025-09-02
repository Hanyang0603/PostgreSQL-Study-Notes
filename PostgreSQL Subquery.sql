-- ============================ SQL Subquery ============================
-- -------------------- Simple Subquery  --------------------
SELECT countries.name AS country,  
       (SELECT COUNT(DISTINCT(name))  
        FROM cities 
        WHERE cities.country_code = countries.code) AS cities_num 
FROM countries 
ORDER BY cities_num DESC, country 
LIMIT 9;
-- The subquery runs independently and does not rely on any fields from the main query.
-- It executes only once and returns the result to the main query.

SELECT local_name, sub.lang_num 
FROM countries, 
(SELECT code, COUNT(*) AS lang_num 
FROM languages 
GROUP BY code) AS sub 
WHERE countries.code = sub.code 
ORDER BY lang_num DESC;
-- Implicit JOIN = INNER JOIN (JOIN)
-- Uses the traditional comma-delimited FROM clause syntax

-- -------------------- Correlated Subquery  --------------------
SELECT column1, column2, ...
FROM table1 t1
WHERE EXISTS (
    SELECT 1
    FROM table2 t2
    WHERE t2.col = t1.col
      AND <...>
);
-- EXISTS must be followed by a subquery.
-- If the subquery returns at least one row, then EXISTS evaluates to TRUE.
-- If the subquery returns no rows, then EXISTS evaluates to FALSE.
-- Use SELECT 1, SELECT *, or anything inside the subquery, 
-- because EXISTS only cares about whether rows exist, not about the actual values.
SELECT e1.name, e1.salary, e1.department
FROM employees AS e1
WHERE e1.salary > (
    SELECT AVG(e2.salary)
    FROM employees e2
    WHERE e2.department = e1.department  
);
-- A subquery that references one or more columns from the main query.
-- Used with WHERE clause.
-- Cannot run independently, depends on the main query
-- Executes once for each row processed in the main query
-- Poor performance, requires looping, very inefficient with large data.

-- -------------------- Nested Query  --------------------
SELECT name, department_id
FROM employees
WHERE department_id IN (
    -- Simple subquery (runs once independently)
    SELECT department_id
    FROM departments
    WHERE location = 'New York'
);
-- Includes simple subquery and correlated subquery 
-- Used with WHERE IN EXISTS

-- -------------------- CTEs (Common Table Expressions)  --------------------
WITH cte_name AS( 
SELECT col1, col2 
FROM table)
-- Table declared before the main query
-- Can be used to improve the readability of complex queries
-- Can be referenced multiple times
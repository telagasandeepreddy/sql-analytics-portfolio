-- ============================================================
-- ROOKIE | Lesson 2: Filtering with WHERE
-- Goal: Return only rows that match a condition
-- ============================================================

-- 1. Simple equality filter
SELECT name, salary FROM employees
WHERE status = 'active';

-- 2. Numeric comparisons
SELECT name, salary FROM employees
WHERE salary > 100000;

-- 3. Multiple conditions with AND / OR
SELECT name, salary, dept_id FROM employees
WHERE salary > 90000 AND dept_id = 1;

SELECT name, dept_id FROM employees
WHERE dept_id = 1 OR dept_id = 5;

-- 4. Match a list of values with IN
SELECT name, dept_id FROM employees
WHERE dept_id IN (1, 3, 5);

-- 5. Pattern matching with LIKE
--    %  = any sequence of characters
--    _  = exactly one character
SELECT name FROM employees
WHERE name LIKE 'A%';       -- names starting with A

SELECT name FROM employees
WHERE name LIKE '%a_';      -- names where second-to-last char is 'a'

-- 6. NULL checks
SELECT name, manager_id FROM employees
WHERE manager_id IS NULL;   -- top-level managers (no manager)

-- TRY IT: Find all products in the 'Software' category priced above $1000.

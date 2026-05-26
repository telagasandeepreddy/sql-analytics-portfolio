-- ============================================================
-- ROOKIE | Lesson 1: SELECT Basics
-- Goal: Retrieve data from a single table
-- ============================================================

-- 1. Select ALL columns from a table
SELECT * FROM employees;

-- 2. Select SPECIFIC columns only
SELECT name, salary, hired_on
FROM employees;

-- 3. Give columns friendlier names with aliases (AS)
SELECT
  name        AS employee_name,
  salary      AS annual_salary,
  hired_on    AS start_date
FROM employees;

-- 4. Avoid duplicates with DISTINCT
SELECT DISTINCT status FROM employees;

-- 5. Simple calculations in SELECT
SELECT
  name,
  salary,
  salary / 12 AS monthly_salary
FROM employees;

-- TRY IT: Select just name and email from the products table.

-- ============================================================
-- BEGINNER | Lesson 3: Aggregate Functions
-- COUNT · SUM · AVG · MIN · MAX
-- ============================================================

-- 1. COUNT rows
SELECT COUNT(*) AS total_employees FROM employees;
SELECT COUNT(*) AS active_employees FROM employees WHERE status = 'active';

-- 2. SUM
SELECT SUM(salary) AS total_payroll FROM employees;

-- 3. AVG
SELECT ROUND(AVG(salary), 2) AS avg_salary FROM employees;

-- 4. MIN / MAX
SELECT MIN(salary) AS lowest, MAX(salary) AS highest FROM employees;

-- 5. Combine them
SELECT
  COUNT(*)              AS headcount,
  ROUND(AVG(salary),0) AS avg_salary,
  MIN(salary)           AS min_salary,
  MAX(salary)           AS max_salary,
  SUM(salary)           AS total_payroll
FROM employees
WHERE status = 'active';

-- TRY IT: What is the total revenue if you multiply quantity * unit_price
--         for every sale? (Join sales + products)

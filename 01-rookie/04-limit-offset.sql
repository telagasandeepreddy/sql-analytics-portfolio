-- ============================================================
-- ROOKIE | Lesson 4: LIMIT & OFFSET (Pagination)
-- ============================================================

-- 1. Get only the first 5 rows
SELECT name, salary FROM employees
ORDER BY salary DESC
LIMIT 5;

-- 2. Skip the first 5 and get the next 5 (page 2)
SELECT name, salary FROM employees
ORDER BY salary DESC
LIMIT 5 OFFSET 5;

-- PRACTICAL EXAMPLE: Top 3 highest-paid employees
SELECT name, salary
FROM employees
ORDER BY salary DESC
LIMIT 3;

-- TRY IT: Find the 3 least expensive products (excluding Services category).

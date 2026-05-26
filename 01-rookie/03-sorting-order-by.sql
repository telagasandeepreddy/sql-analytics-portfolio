-- ============================================================
-- ROOKIE | Lesson 3: Sorting Results with ORDER BY
-- ============================================================

-- 1. Sort ascending (default)
SELECT name, salary FROM employees
ORDER BY salary;

-- 2. Sort descending
SELECT name, salary FROM employees
ORDER BY salary DESC;

-- 3. Sort by multiple columns
SELECT name, dept_id, salary FROM employees
ORDER BY dept_id ASC, salary DESC;

-- 4. Sort by column alias
SELECT name, salary / 12 AS monthly_pay
FROM employees
ORDER BY monthly_pay DESC;

-- TRY IT: List all products ordered by unit_price from most to least expensive.

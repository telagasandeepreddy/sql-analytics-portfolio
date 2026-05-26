-- ============================================================
-- INTERMEDIATE | Lesson 1: Subqueries
-- Goal: Use a query inside another query
-- ============================================================

-- 1. Scalar subquery: employees earning above-average salary
SELECT name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees)
ORDER BY salary DESC;

-- 2. Subquery in FROM (derived table / inline view)
SELECT dept_name, avg_sal
FROM (
  SELECT d.name AS dept_name, ROUND(AVG(e.salary), 0) AS avg_sal
  FROM employees e
  JOIN departments d ON e.dept_id = d.id
  GROUP BY d.name
) AS dept_avg
WHERE avg_sal > 90000;

-- 3. Correlated subquery: find each employee's rank in their dept
SELECT
  name, dept_id, salary,
  (SELECT COUNT(*) FROM employees e2
   WHERE e2.dept_id = e1.dept_id AND e2.salary > e1.salary) + 1 AS dept_rank
FROM employees e1
ORDER BY dept_id, dept_rank;

-- TRY IT: Find all products whose unit_price is above the average
--         unit_price for their category.

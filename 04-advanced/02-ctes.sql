-- ============================================================
-- ADVANCED | Lesson 2: Common Table Expressions (CTEs)
-- Goal: Named subqueries that make complex queries readable
-- Syntax: WITH cte_name AS (SELECT ...) SELECT ... FROM cte_name
-- ============================================================

-- 1. Basic CTE
WITH high_earners AS (
  SELECT name, salary, dept_id
  FROM employees
  WHERE salary > 100000
)
SELECT h.name, d.name AS department, h.salary
FROM high_earners h
JOIN departments d ON h.dept_id = d.id;

-- 2. Multiple CTEs chained
WITH
dept_avg AS (
  SELECT dept_id, ROUND(AVG(salary), 0) AS avg_sal
  FROM employees GROUP BY dept_id
),
above_avg AS (
  SELECT e.name, e.salary, d.avg_sal, e.dept_id
  FROM employees e
  JOIN dept_avg d ON e.dept_id = d.dept_id
  WHERE e.salary > d.avg_sal
)
SELECT a.name, a.salary, a.avg_sal AS dept_avg, dep.name AS department
FROM above_avg a
JOIN departments dep ON a.dept_id = dep.id
ORDER BY a.salary DESC;

-- 3. Recursive CTE: walk the management hierarchy
WITH RECURSIVE org_chart AS (
  -- Base case: top-level (no manager)
  SELECT id, name, manager_id, 0 AS level, name AS path
  FROM employees WHERE manager_id IS NULL

  UNION ALL

  -- Recursive: join to their direct reports
  SELECT e.id, e.name, e.manager_id, o.level + 1,
         o.path || ' -> ' || e.name
  FROM employees e
  JOIN org_chart o ON e.manager_id = o.id
)
SELECT level, name, path FROM org_chart ORDER BY path;

-- TRY IT: Use a CTE to find, per month, the top-earning product category.

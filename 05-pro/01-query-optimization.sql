-- ============================================================
-- PRO | Lesson 1: Query Optimization
-- Goal: Write queries that scale to millions of rows
-- ============================================================

-- ❌ SLOW: SELECT * returns all columns, even unused ones
SELECT * FROM sales WHERE region = 'East';

-- ✅ FAST: Select only what you need
SELECT id, sale_date, quantity FROM sales WHERE region = 'East';

-- ❌ SLOW: Function on indexed column defeats the index
SELECT * FROM employees WHERE YEAR(hired_on) = 2021;

-- ✅ FAST: Use a range instead
SELECT * FROM employees
WHERE hired_on >= '2021-01-01' AND hired_on < '2022-01-01';

-- ❌ SLOW: OR across columns can prevent index use
SELECT * FROM employees WHERE dept_id = 1 OR manager_id = 1;

-- ✅ FASTER: UNION ALL (each branch uses its own index)
SELECT * FROM employees WHERE dept_id = 1
UNION ALL
SELECT * FROM employees WHERE manager_id = 1 AND dept_id != 1;

-- ❌ SLOW: Correlated subquery runs once per row
SELECT name,
  (SELECT name FROM departments WHERE id = e.dept_id) AS dept
FROM employees e;

-- ✅ FAST: JOIN instead
SELECT e.name, d.name AS dept
FROM employees e
JOIN departments d ON e.dept_id = d.id;

-- ❌ SLOW: LIKE with leading wildcard can't use index
SELECT * FROM employees WHERE name LIKE '%Chen';

-- ✅ BETTER: Full-text search indexes, or trailing-wildcard only
SELECT * FROM employees WHERE name LIKE 'Chen%';

-- PRO TIP: Always benchmark with EXPLAIN ANALYZE before & after changes.

-- ============================================================
-- BEGINNER | Lesson 4: GROUP BY & HAVING
-- Goal: Aggregate per group and filter those groups
-- ============================================================

-- 1. Headcount per department
SELECT
  d.name          AS department,
  COUNT(e.id)     AS headcount,
  ROUND(AVG(e.salary), 0) AS avg_salary
FROM employees e
JOIN departments d ON e.dept_id = d.id
GROUP BY d.name
ORDER BY headcount DESC;

-- 2. HAVING filters AFTER grouping (WHERE filters BEFORE)
--    Find departments with average salary above $90,000
SELECT
  d.name,
  ROUND(AVG(e.salary), 0) AS avg_salary
FROM employees e
JOIN departments d ON e.dept_id = d.id
GROUP BY d.name
HAVING AVG(e.salary) > 90000
ORDER BY avg_salary DESC;

-- 3. Sales revenue by region
SELECT
  region,
  COUNT(*)                                   AS num_sales,
  SUM(s.quantity * p.unit_price)             AS gross_revenue,
  ROUND(AVG(s.quantity * p.unit_price), 2)   AS avg_deal_size
FROM sales s
JOIN products p ON s.product_id = p.id
GROUP BY region;

-- TRY IT: Which product categories generated the most total revenue?
--         Show categories with revenue above $10,000 only.

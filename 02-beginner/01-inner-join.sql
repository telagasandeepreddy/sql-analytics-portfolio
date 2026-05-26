-- ============================================================
-- BEGINNER | Lesson 1: INNER JOIN
-- Goal: Combine rows from two tables where they match
-- ============================================================

-- 1. Basic INNER JOIN: employees with their department name
SELECT
  e.name          AS employee,
  d.name          AS department,
  e.salary
FROM employees e
INNER JOIN departments d ON e.dept_id = d.id;

-- 2. Filter on the joined result
SELECT
  e.name, d.name AS department, e.salary
FROM employees e
INNER JOIN departments d ON e.dept_id = d.id
WHERE d.name = 'Engineering'
ORDER BY e.salary DESC;

-- 3. Three-table join: sales -> employees -> departments
SELECT
  s.sale_date,
  e.name      AS salesperson,
  d.name      AS department,
  p.name      AS product,
  s.quantity
FROM sales s
INNER JOIN employees   e ON s.employee_id = e.id
INNER JOIN departments d ON e.dept_id     = d.id
INNER JOIN products    p ON s.product_id  = p.id
ORDER BY s.sale_date;

-- TRY IT: List all sales with the product name and region, sorted by sale_date.

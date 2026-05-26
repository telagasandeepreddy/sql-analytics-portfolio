-- ============================================================
-- INTERMEDIATE | Lesson 3: Views
-- Goal: Save a query as a reusable virtual table
-- ============================================================

-- 1. Create a view for enriched sales data
CREATE OR REPLACE VIEW v_sales_detail AS
SELECT
  s.id          AS sale_id,
  s.sale_date,
  s.region,
  e.name        AS employee_name,
  d.name        AS department,
  p.name        AS product_name,
  p.category,
  s.quantity,
  p.unit_price,
  s.discount_pct,
  ROUND(s.quantity * p.unit_price * (1 - s.discount_pct/100), 2) AS revenue,
  ROUND(s.quantity * (p.unit_price - p.cost) * (1 - s.discount_pct/100), 2) AS profit
FROM sales s
JOIN employees   e ON s.employee_id = e.id
JOIN departments d ON e.dept_id     = d.id
JOIN products    p ON s.product_id  = p.id;

-- 2. Now query the view like a normal table
SELECT * FROM v_sales_detail WHERE region = 'East';

-- 3. Aggregate on top of a view
SELECT
  employee_name,
  COUNT(*) AS deals,
  SUM(revenue) AS total_revenue,
  ROUND(AVG(profit / NULLIF(revenue,0)) * 100, 1) AS avg_margin_pct
FROM v_sales_detail
GROUP BY employee_name
ORDER BY total_revenue DESC;

-- TRY IT: Create a view v_dept_summary showing department name,
--         headcount, avg salary, and total payroll.

-- ============================================================
--  SOLUTIONS
--  ⚠️  Try the exercises first!
-- ============================================================

-- [ROOKIE-1]
SELECT name, salary FROM employees
WHERE salary BETWEEN 80000 AND 100000
ORDER BY salary DESC;

-- [ROOKIE-2]
SELECT name, category, unit_price FROM products
WHERE category IN ('Hardware', 'Cloud')
ORDER BY unit_price DESC;

-- [BEGINNER-1]
SELECT d.name, COUNT(e.id) AS headcount, ROUND(AVG(e.salary),0) AS avg_salary
FROM employees e JOIN departments d ON e.dept_id = d.id
GROUP BY d.name HAVING COUNT(e.id) > 2
ORDER BY headcount DESC;

-- [BEGINNER-2]
SELECT
  e.name AS employee, p.name AS product, s.quantity,
  ROUND(s.quantity * p.unit_price * (1 - s.discount_pct/100), 2) AS revenue
FROM sales s
JOIN employees e ON s.employee_id = e.id
JOIN products  p ON s.product_id  = p.id
ORDER BY revenue DESC;

-- [INTERMEDIATE-1]
WITH ranked AS (
  SELECT e.name, d.name AS dept, e.salary,
         ROW_NUMBER() OVER (PARTITION BY e.dept_id ORDER BY e.salary DESC) AS rn
  FROM employees e JOIN departments d ON e.dept_id = d.id
)
SELECT dept, name, salary FROM ranked WHERE rn = 1;

-- [INTERMEDIATE-2]
SELECT
  CASE
    WHEN DATE_PART('year', AGE(CURRENT_DATE, hired_on)) >= 6 THEN 'Veteran'
    WHEN DATE_PART('year', AGE(CURRENT_DATE, hired_on)) >= 3 THEN 'Experienced'
    ELSE 'New'
  END AS tenure_band,
  COUNT(*) AS count
FROM employees
GROUP BY 1 ORDER BY count DESC;

-- [ADVANCED-1]
SELECT sale_date, employee_name, product_name, revenue,
  ROUND(100.0 * revenue / SUM(revenue) OVER (), 2) AS pct_of_total
FROM v_sales_detail ORDER BY revenue DESC;

-- [ADVANCED-2]
WITH monthly AS (
  SELECT DATE_TRUNC('month', sale_date) AS month, SUM(revenue) AS total
  FROM v_sales_detail GROUP BY 1
),
best_month AS (
  SELECT month FROM monthly ORDER BY total DESC LIMIT 1
)
SELECT v.* FROM v_sales_detail v, best_month b
WHERE DATE_TRUNC('month', v.sale_date) = b.month;

-- [PRO-1]
SELECT e.name, s.sale_date, v.revenue,
  SUM(v.revenue) OVER (
    PARTITION BY e.id
    ORDER BY s.sale_date
    ROWS BETWEEN 29 PRECEDING AND CURRENT ROW
  ) AS trailing_30d_revenue
FROM sales s
JOIN employees e ON s.employee_id = e.id
JOIN v_sales_detail v ON s.id = v.sale_id
WHERE e.dept_id = 2
ORDER BY e.name, s.sale_date;

-- [PRO-2]
SELECT p.name, p.category, p.stock, p.unit_price,
  p.stock * p.unit_price AS revenue_at_risk
FROM products p
LEFT JOIN sales s ON s.product_id = p.id
WHERE s.id IS NULL
ORDER BY revenue_at_risk DESC;

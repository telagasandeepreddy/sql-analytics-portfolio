-- ============================================================
-- PRO | Lesson 4: Advanced Analytics Patterns
-- Goal: Real-world data analysis techniques used in production
-- ============================================================

-- 1. COHORT ANALYSIS: group users by their first activity month
WITH first_sale AS (
  SELECT employee_id, MIN(DATE_TRUNC('month', sale_date)) AS cohort_month
  FROM sales GROUP BY employee_id
),
monthly_activity AS (
  SELECT s.employee_id, DATE_TRUNC('month', s.sale_date) AS activity_month
  FROM sales s GROUP BY s.employee_id, DATE_TRUNC('month', s.sale_date)
)
SELECT
  f.cohort_month,
  EXTRACT(MONTH FROM AGE(m.activity_month, f.cohort_month)) AS months_since_start,
  COUNT(DISTINCT m.employee_id) AS active_sellers
FROM first_sale f
JOIN monthly_activity m ON f.employee_id = m.employee_id
GROUP BY 1, 2
ORDER BY 1, 2;

-- 2. FUNNEL ANALYSIS: steps in a pipeline
WITH stage_counts AS (
  SELECT
    COUNT(DISTINCT CASE WHEN quantity >= 1 THEN id END) AS had_sale,
    COUNT(DISTINCT CASE WHEN quantity >= 3 THEN id END) AS multi_unit,
    COUNT(DISTINCT CASE WHEN discount_pct = 0 THEN id END) AS full_price
  FROM sales
)
SELECT
  'Sales with any quantity'   AS stage, had_sale   AS count FROM stage_counts
UNION ALL SELECT 'Multi-unit sales (3+)', multi_unit FROM stage_counts
UNION ALL SELECT 'Full-price (no discount)', full_price FROM stage_counts;

-- 3. PERCENTILES & DISTRIBUTION
SELECT
  PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY salary) AS p25,
  PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY salary) AS median,
  PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY salary) AS p75,
  PERCENTILE_CONT(0.90) WITHIN GROUP (ORDER BY salary) AS p90,
  PERCENTILE_CONT(0.99) WITHIN GROUP (ORDER BY salary) AS p99
FROM employees;

-- 4. YEAR-OVER-YEAR COMPARISON with LAG
WITH monthly AS (
  SELECT
    DATE_TRUNC('month', sale_date) AS month,
    SUM(quantity * unit_price)     AS revenue
  FROM sales s JOIN products p ON s.product_id = p.id
  GROUP BY 1
)
SELECT
  month,
  revenue,
  LAG(revenue, 12) OVER (ORDER BY month) AS same_month_last_year,
  ROUND(100.0 * (revenue - LAG(revenue, 12) OVER (ORDER BY month))
        / NULLIF(LAG(revenue, 12) OVER (ORDER BY month), 0), 1) AS yoy_pct
FROM monthly ORDER BY month;

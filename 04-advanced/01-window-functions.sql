-- ============================================================
-- ADVANCED | Lesson 1: Window Functions
-- Goal: Aggregate WITHOUT collapsing rows
-- Syntax: function() OVER (PARTITION BY ... ORDER BY ...)
-- ============================================================

-- 1. ROW_NUMBER: rank employees by salary within each dept
SELECT
  name, dept_id, salary,
  ROW_NUMBER() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS rank_in_dept
FROM employees;

-- 2. RANK vs DENSE_RANK (handles ties differently)
SELECT
  name, salary,
  RANK()       OVER (ORDER BY salary DESC) AS rank_gaps,     -- 1,2,2,4
  DENSE_RANK() OVER (ORDER BY salary DESC) AS rank_no_gaps   -- 1,2,2,3
FROM employees;

-- 3. Running total of revenue over time
SELECT
  sale_date, revenue,
  SUM(revenue) OVER (ORDER BY sale_date
                     ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total
FROM v_sales_detail
ORDER BY sale_date;

-- 4. LAG/LEAD: compare to previous/next row
SELECT
  sale_date,
  revenue,
  LAG(revenue)  OVER (ORDER BY sale_date) AS prev_sale_revenue,
  revenue - LAG(revenue) OVER (ORDER BY sale_date) AS delta
FROM v_sales_detail
ORDER BY sale_date;

-- 5. Moving average (30-day window)
SELECT
  sale_date,
  revenue,
  ROUND(AVG(revenue) OVER (
    ORDER BY sale_date
    ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
  ), 2) AS moving_avg_3
FROM v_sales_detail
ORDER BY sale_date;

-- TRY IT: Find the top-1 selling employee per region by total revenue.

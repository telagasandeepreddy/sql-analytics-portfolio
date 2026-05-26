-- ============================================================
-- ADVANCED | Lesson 4: Stored Procedures & Functions
-- Goal: Reusable server-side logic (PostgreSQL syntax)
-- ============================================================

-- 1. Simple function: calculate revenue for a sale
CREATE OR REPLACE FUNCTION calc_revenue(qty INT, price DECIMAL, disc DECIMAL)
RETURNS DECIMAL AS
$$
  SELECT ROUND(qty * price * (1 - disc / 100), 2);
$$ LANGUAGE sql;

-- Usage:
SELECT calc_revenue(5, 2999.00, 10.0);  -- 5 units at $2999 with 10% off

-- 2. Stored procedure: give a department a raise
CREATE OR REPLACE PROCEDURE give_dept_raise(p_dept_id INT, p_pct DECIMAL)
LANGUAGE plpgsql AS
$$
BEGIN
  UPDATE employees
  SET salary = ROUND(salary * (1 + p_pct / 100), 2)
  WHERE dept_id = p_dept_id AND status = 'active';

  RAISE NOTICE 'Raise of %% applied to dept %', p_pct, p_dept_id;
END;
$$;

-- Usage:
CALL give_dept_raise(5, 8.0);  -- 8% raise to Data Analytics team

-- 3. Function returning a table
CREATE OR REPLACE FUNCTION top_sellers(n INT)
RETURNS TABLE(employee_name TEXT, total_revenue DECIMAL) AS
$$
  SELECT employee_name, SUM(revenue) AS total_revenue
  FROM v_sales_detail
  GROUP BY employee_name
  ORDER BY total_revenue DESC
  LIMIT n;
$$ LANGUAGE sql;

-- Usage:
SELECT * FROM top_sellers(3);

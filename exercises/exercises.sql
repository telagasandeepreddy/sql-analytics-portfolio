-- ============================================================
--  EXERCISES — All Levels
--  Try each one before peeking at solutions/solutions.sql
-- ============================================================

-- [ROOKIE-1] List the name and salary of all employees
--            earning between $80,000 and $100,000.

-- [ROOKIE-2] Show all products in the 'Hardware' or 'Cloud'
--            categories, sorted by unit_price descending.

-- [BEGINNER-1] Show each department's name, number of employees,
--              and average salary. Only include departments
--              with more than 2 employees.

-- [BEGINNER-2] List every sale with the employee name, product name,
--              and calculated revenue (quantity * unit_price * (1 - discount_pct/100)).
--              Sort by revenue descending.

-- [INTERMEDIATE-1] Find the highest-paid employee in each department
--                  (show department name, employee name, and salary).

-- [INTERMEDIATE-2] Using a CASE expression, label each employee's
--                  tenure as: 'Veteran' (6+ years), 'Experienced' (3-5),
--                  or 'New' (< 3 years). Count each label.

-- [ADVANCED-1] Using a window function, show each sale's revenue AND
--              its percentage of total revenue across all sales.

-- [ADVANCED-2] Write a CTE that finds the month with the highest
--              total revenue, then shows all sales from that month.

-- [PRO-1] Write a query that computes each employee's
--         30-day trailing revenue, only for employees in Sales.

-- [PRO-2] Identify any products that have never been sold.
--         Then compute how much revenue is "at risk" if they
--         are discontinued (stock * unit_price).

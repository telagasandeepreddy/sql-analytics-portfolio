-- ============================================================
-- BEGINNER | Lesson 2: LEFT JOIN & RIGHT JOIN
-- Goal: Include rows even when there's no match
-- ============================================================

-- LEFT JOIN: all employees, even those with no sales
SELECT
  e.name,
  COUNT(s.id) AS total_sales
FROM employees e
LEFT JOIN sales s ON s.employee_id = e.id
GROUP BY e.name
ORDER BY total_sales DESC;

-- Find employees who have NEVER made a sale
SELECT e.name, e.dept_id
FROM employees e
LEFT JOIN sales s ON s.employee_id = e.id
WHERE s.id IS NULL;

-- TRY IT: List all products and how many times they've been sold.
--         Include products that have never been sold (show 0).

-- ============================================================
-- INTERMEDIATE | Lesson 2: CASE WHEN
-- Goal: Conditional logic inside SQL
-- ============================================================

-- 1. Salary bands
SELECT
  name,
  salary,
  CASE
    WHEN salary >= 130000 THEN 'Senior'
    WHEN salary >= 90000  THEN 'Mid-level'
    ELSE                       'Junior'
  END AS band
FROM employees
ORDER BY salary DESC;

-- 2. Pivot: count employees per department per band
SELECT
  d.name AS department,
  COUNT(CASE WHEN e.salary >= 130000 THEN 1 END) AS senior,
  COUNT(CASE WHEN e.salary BETWEEN 90000 AND 129999 THEN 1 END) AS mid,
  COUNT(CASE WHEN e.salary < 90000 THEN 1 END) AS junior
FROM employees e
JOIN departments d ON e.dept_id = d.id
GROUP BY d.name;

-- TRY IT: Label each sale as 'Large' (revenue >= $5000),
--         'Medium' ($1000–$4999), or 'Small' (< $1000).

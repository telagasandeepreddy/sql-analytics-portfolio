-- ============================================================
-- INTERMEDIATE | Lesson 4: Indexes
-- Goal: Speed up queries on large tables
-- ============================================================

-- Why indexes? Without them, the DB scans every row (O(n)).
-- With a B-tree index, it can jump directly (O(log n)).

-- 1. Single-column index
CREATE INDEX idx_employees_dept ON employees(dept_id);

-- 2. Composite index (order matters: put equality cols first)
CREATE INDEX idx_sales_date_region ON sales(sale_date, region);

-- 3. Unique index (also enforces uniqueness)
CREATE UNIQUE INDEX idx_employees_email ON employees(email);

-- 4. Check what indexes exist (PostgreSQL)
SELECT indexname, indexdef
FROM pg_indexes
WHERE tablename = 'employees';

-- 5. Drop an index
DROP INDEX IF EXISTS idx_employees_dept;

-- RULES OF THUMB:
--   Index columns used in WHERE, JOIN ON, ORDER BY
--   Don't over-index — each index slows INSERT/UPDATE/DELETE
--   Composite index (a, b) helps queries on (a) and (a,b), NOT (b) alone

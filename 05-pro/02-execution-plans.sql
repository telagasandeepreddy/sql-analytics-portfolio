-- ============================================================
-- PRO | Lesson 2: Reading Execution Plans
-- Goal: Understand what the database is actually doing
-- ============================================================

-- EXPLAIN shows the query plan WITHOUT executing
EXPLAIN
SELECT e.name, d.name AS dept, e.salary
FROM employees e
JOIN departments d ON e.dept_id = d.id
WHERE e.salary > 100000;

-- EXPLAIN ANALYZE runs the query and shows actual timings
EXPLAIN ANALYZE
SELECT e.name, d.name AS dept, e.salary
FROM employees e
JOIN departments d ON e.dept_id = d.id
WHERE e.salary > 100000;

-- KEY TERMS TO LOOK FOR:
--
-- Seq Scan     → full table scan, no index used
-- Index Scan   → using a B-tree index (good for selective queries)
-- Index Only Scan → reads only the index, not the table (fastest!)
-- Hash Join    → good for large unsorted sets
-- Nested Loop  → good when one side is small
-- Merge Join   → good for pre-sorted data
-- Sort         → expensive, try to avoid with proper indexing
-- cost=X..Y    → X = startup cost, Y = total cost (planner estimates)
-- rows=N       → estimated row count (check against actual rows=N)
-- actual time  → real milliseconds spent

-- WORKFLOW:
-- 1. Run EXPLAIN ANALYZE on your slow query
-- 2. Find the most expensive node (highest cost or actual time)
-- 3. Look for Seq Scans on large tables — add an index
-- 4. Look for large row-count mismatches — run ANALYZE to update stats
-- 5. Rewrite if join order or method is suboptimal

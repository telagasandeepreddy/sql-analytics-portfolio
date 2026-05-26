-- ============================================================
-- ADVANCED | Lesson 3: Transactions & ACID
-- Goal: Ensure data integrity across multiple statements
-- ACID: Atomic · Consistent · Isolated · Durable
-- ============================================================

-- 1. Basic transaction
BEGIN;

  UPDATE employees SET salary = salary * 1.10 WHERE dept_id = 5;
  INSERT INTO sales(id, employee_id, product_id, quantity, sale_date, region)
  VALUES (26, 8, 1, 1, CURRENT_DATE, 'Remote');

COMMIT;  -- both changes applied together

-- 2. Rollback on error
BEGIN;

  UPDATE employees SET salary = -999 WHERE id = 1;  -- oops!
  -- Detect the problem and undo everything
ROLLBACK;

-- 3. Savepoints (partial rollback)
BEGIN;

  UPDATE employees SET salary = salary + 5000 WHERE id = 4;
  SAVEPOINT after_raise;

  DELETE FROM employees WHERE id = 20;  -- maybe too drastic?
  ROLLBACK TO SAVEPOINT after_raise;    -- undo only the delete

COMMIT;  -- only the raise is committed

-- KEY ISOLATION LEVELS (set before BEGIN):
-- READ UNCOMMITTED — can see dirty reads
-- READ COMMITTED   — default in most DBs; sees committed data
-- REPEATABLE READ  — same query returns same rows in a transaction
-- SERIALIZABLE     — strictest; transactions run as if sequential

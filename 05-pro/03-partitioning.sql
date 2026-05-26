-- ============================================================
-- PRO | Lesson 3: Table Partitioning
-- Goal: Split large tables into smaller, manageable chunks
--       so queries touch only the relevant partition
-- ============================================================

-- Range partitioning on sale_date (PostgreSQL syntax)
CREATE TABLE sales_partitioned (
  id           INT,
  employee_id  INT,
  product_id   INT,
  quantity     INT,
  sale_date    DATE NOT NULL,
  region       VARCHAR(50),
  discount_pct DECIMAL(5,2)
) PARTITION BY RANGE (sale_date);

-- Create yearly partitions
CREATE TABLE sales_2023 PARTITION OF sales_partitioned
  FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE sales_2024 PARTITION OF sales_partitioned
  FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE sales_2025 PARTITION OF sales_partitioned
  FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

-- Index each partition independently
CREATE INDEX ON sales_2024 (sale_date, region);

-- Queries automatically "prune" to the right partition
-- This scans ONLY sales_2024, not the full table:
SELECT * FROM sales_partitioned
WHERE sale_date BETWEEN '2024-01-01' AND '2024-12-31';

-- List partition (good for region, category, status)
CREATE TABLE products_by_category (
  id         INT,
  name       VARCHAR(150),
  category   VARCHAR(100),
  unit_price DECIMAL(10,2)
) PARTITION BY LIST (category);

CREATE TABLE products_software  PARTITION OF products_by_category
  FOR VALUES IN ('Software');

CREATE TABLE products_hardware  PARTITION OF products_by_category
  FOR VALUES IN ('Hardware');

CREATE TABLE products_services  PARTITION OF products_by_category
  FOR VALUES IN ('Services', 'Cloud');

-- WHEN TO PARTITION:
-- Table is 100M+ rows and queries always filter by the partition key
-- You want to drop old data quickly (DROP PARTITION is instant)
-- Archive strategies: move cold partitions to cheaper storage

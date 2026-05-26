-- ============================================================
--  SAMPLE DATABASE: Analytics Portfolio
--  Compatible with: PostgreSQL, MySQL 8+, SQLite
-- ============================================================

DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS departments;

CREATE TABLE departments (
  id        INT PRIMARY KEY,
  name      VARCHAR(100) NOT NULL,
  budget    DECIMAL(12,2),
  location  VARCHAR(100)
);

INSERT INTO departments VALUES
  (1, 'Engineering',   1200000.00, 'San Francisco'),
  (2, 'Sales',          850000.00, 'New York'),
  (3, 'Marketing',      600000.00, 'Chicago'),
  (4, 'HR',             400000.00, 'Austin'),
  (5, 'Data Analytics', 750000.00, 'Remote');

CREATE TABLE employees (
  id          INT PRIMARY KEY,
  name        VARCHAR(100) NOT NULL,
  email       VARCHAR(150),
  dept_id     INT,
  manager_id  INT,
  salary      DECIMAL(10,2),
  hired_on    DATE,
  status      VARCHAR(20) DEFAULT 'active'
);

INSERT INTO employees VALUES
  (1,  'Alice Chen',    'alice@co.com',   1, NULL, 135000, '2018-03-15', 'active'),
  (2,  'Bob Martinez',  'bob@co.com',     2, NULL, 120000, '2017-07-01', 'active'),
  (3,  'Carol Kim',     'carol@co.com',   5, NULL, 140000, '2019-01-10', 'active'),
  (4,  'David Okafor',  'david@co.com',   1,    1,  95000, '2020-06-22', 'active'),
  (5,  'Eva Singh',     'eva@co.com',     1,    1,  98000, '2020-09-05', 'active'),
  (6,  'Frank Li',      'frank@co.com',   2,    2,  82000, '2021-02-14', 'active'),
  (7,  'Grace Nwosu',   'grace@co.com',   2,    2,  79000, '2021-05-30', 'active'),
  (8,  'Hiro Tanaka',   'hiro@co.com',    5,    3,  91000, '2021-08-01', 'active'),
  (9,  'Iris Patel',    'iris@co.com',    3, NULL, 110000, '2019-11-18', 'active'),
  (10, 'Jake Brown',    'jake@co.com',    4, NULL,  88000, '2018-05-20', 'active'),
  (11, 'Karen Wu',      'karen@co.com',   5,    3,  87000, '2022-01-03', 'active'),
  (12, 'Leo Rossi',     'leo@co.com',     1,    1,  93000, '2022-03-15', 'active'),
  (13, 'Mia Johnson',   'mia@co.com',     3,    9,  75000, '2022-07-11', 'active'),
  (14, 'Nate Williams', 'nate@co.com',    2,    2,  77000, '2022-09-01', 'active'),
  (15, 'Olivia Scott',  'olivia@co.com',  4,   10,  68000, '2023-01-16', 'active'),
  (16, 'Paul Adams',    'paul@co.com',    1,    1,  89000, '2019-04-08', 'inactive'),
  (17, 'Quinn Davis',   'quinn@co.com',   5,    3,  94000, '2020-12-01', 'active'),
  (18, 'Rosa Torres',   'rosa@co.com',    3,    9,  72000, '2021-06-14', 'active'),
  (19, 'Sam Wilson',    'sam@co.com',     2,    2,  81000, '2023-03-20', 'active'),
  (20, 'Tina Nguyen',   'tina@co.com',    4,   10,  71000, '2023-05-01', 'active');

CREATE TABLE products (
  id          INT PRIMARY KEY,
  name        VARCHAR(150) NOT NULL,
  category    VARCHAR(100),
  unit_price  DECIMAL(10,2),
  cost        DECIMAL(10,2),
  stock       INT
);

INSERT INTO products VALUES
  (1,  'Analytics Pro License', 'Software', 2999.00,  800.00, 500),
  (2,  'Data Pipeline Tool',    'Software', 1499.00,  400.00, 300),
  (3,  'BI Dashboard Suite',    'Software', 3999.00,  950.00, 200),
  (4,  'ML Model Trainer',      'Software', 4999.00, 1200.00, 150),
  (5,  'SQL Editor Pro',        'Software',  499.00,  100.00,1000),
  (6,  'Server Node 16-core',   'Hardware', 5500.00, 3200.00,  80),
  (7,  'NVMe Storage 4TB',      'Hardware',  899.00,  420.00, 200),
  (8,  'GPU Compute Card',      'Hardware', 3200.00, 1800.00,  60),
  (9,  'Consulting per day',    'Services', 2000.00,  700.00, 999),
  (10, 'Training Workshop',     'Services', 1500.00,  500.00, 999),
  (11, 'Data Audit Report',     'Services', 3500.00, 1000.00, 999),
  (12, 'Cloud Storage 1TB mo',  'Cloud',     199.00,   40.00, 999),
  (13, 'Managed DB monthly',    'Cloud',     599.00,  150.00, 999),
  (14, 'Streaming Ingest mo',   'Cloud',     399.00,   90.00, 999);

CREATE TABLE sales (
  id           INT PRIMARY KEY,
  employee_id  INT,
  product_id   INT,
  quantity     INT,
  sale_date    DATE,
  region       VARCHAR(50),
  discount_pct DECIMAL(5,2) DEFAULT 0
);

INSERT INTO sales VALUES
  (1,  6,  1,  2, '2024-01-05', 'East',  0.00),
  (2,  7,  5, 10, '2024-01-08', 'East',  5.00),
  (3,  6,  9,  3, '2024-01-12', 'East',  0.00),
  (4, 14,  2,  1, '2024-01-15', 'West',  0.00),
  (5,  7,  3,  2, '2024-01-20', 'East', 10.00),
  (6, 19,  6,  1, '2024-02-03', 'West',  0.00),
  (7,  6, 10,  5, '2024-02-07', 'East',  0.00),
  (8, 14,  1,  1, '2024-02-14', 'West',  5.00),
  (9,  7, 12, 12, '2024-02-18', 'East',  0.00),
  (10,19,  4,  1, '2024-02-22', 'West',  0.00),
  (11, 6,  7,  4, '2024-03-01', 'East',  0.00),
  (12,14,  3,  1, '2024-03-10', 'West', 15.00),
  (13, 7, 11,  2, '2024-03-15', 'East',  0.00),
  (14,19,  8,  1, '2024-03-22', 'West',  5.00),
  (15, 6, 13,  6, '2024-04-01', 'East',  0.00),
  (16,14,  5, 20, '2024-04-08', 'West', 10.00),
  (17, 7,  9,  4, '2024-04-15', 'East',  0.00),
  (18,19,  2,  2, '2024-04-20', 'West',  0.00),
  (19, 6,  1,  3, '2024-05-02', 'East',  0.00),
  (20,14, 14,  8, '2024-05-10', 'West',  0.00),
  (21, 7,  6,  1, '2024-05-18', 'East', 10.00),
  (22,19,  3,  2, '2024-05-25', 'West',  5.00),
  (23, 6, 10,  3, '2024-06-04', 'East',  0.00),
  (24,14,  1,  4, '2024-06-12', 'West',  0.00),
  (25, 7,  4,  1, '2024-06-20', 'East',  0.00);

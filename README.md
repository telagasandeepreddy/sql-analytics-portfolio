# 📊 SQL & Data Analytics Learning Portfolio

A structured curriculum taking you from zero SQL knowledge to production-level data analytics skills. Each level builds on the last, using a consistent dataset so you can focus on learning — not setup.

## 🗂️ Structure

| Level | Folder | Topics |
|-------|--------|--------|
| 🟢 Rookie | `01-rookie/` | SELECT, WHERE, ORDER BY, LIMIT |
| 🔵 Beginner | `02-beginner/` | JOINs, Aggregates, GROUP BY |
| 🟡 Intermediate | `03-intermediate/` | Subqueries, Views, Indexes, CASE |
| 🟠 Advanced | `04-advanced/` | Window Functions, CTEs, Stored Procedures |
| 🔴 Pro | `05-pro/` | Query Optimization, Execution Plans, Partitioning |

## 🚀 Getting Started

1. **Clone the repo**
   ```bash
   git clone https://github.com/yourname/sql-analytics-portfolio.git
   cd sql-analytics-portfolio
   ```

2. **Load the sample database** (works with PostgreSQL, MySQL, or SQLite)
   ```bash
   # PostgreSQL
   psql -U postgres -f datasets/sample_db.sql

   # SQLite
   sqlite3 analytics.db < datasets/sample_db.sql
   ```

3. **Start at your level** — open a `.sql` file and run it against the sample DB.

## 📁 Dataset

All tutorials use the `datasets/sample_db.sql` schema:
- `employees` — 50 employees across departments
- `departments` — 5 departments
- `sales` — 200 sales transactions
- `products` — 30 products with categories

## 🏷️ Git Tags by Level

```bash
git checkout v1-rookie      # Start from scratch
git checkout v2-beginner    # Skip to JOINs
git checkout v3-intermediate
git checkout v4-advanced
git checkout v5-pro
```

## 📝 Exercises

Each level has exercises in `exercises/` with solutions in `exercises/solutions/`.

---
*Built as a data analytics learning portfolio. Star ⭐ if it helped you!*

---
Connect with me >> https://www.linkedin.com/in/sandyreddybi/

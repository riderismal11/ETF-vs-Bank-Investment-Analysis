# SQL Financial Analysis – Supabase (PostgreSQL) Implementation

## Overview

This section contains the relational database design and SQL-based financial analysis used to evaluate investment performance between:

- VTI ETF
- SMH ETF
- U.S. Bank Certificates of Deposit (CDs)

The database covers annual data from 2006 to 2026 and includes a structured $10,000 capital simulation.

---

## Development Environment

This project was developed and executed using Supabase, a cloud-based backend platform built on PostgreSQL.

All tables, queries, and analytical functions were implemented and tested directly within the Supabase SQL Editor environment.

---

## Database Structure

Four core tables were created:

1️⃣ cd_banks  
2️⃣ vti_annual_performance  
3️⃣ smh_annual_performance  
4️⃣ investment_comparison  

The investment_comparison table integrates year-by-year return percentages and accumulated capital simulations.

---

## Analytical Queries Implemented

### Investment Growth Simulation

Using window functions:

- LAG()
- SUM() OVER()

The queries calculate:

- Annual capital
- Yearly profit
- Cumulative gain

---

### Annual Return Winner

Using CASE logic and multi-table joins:

- Compares VTI, SMH, and CD annual returns
- Converts percentage strings to numeric values
- Identifies the top-performing instrument each year

---

### Best and Worst Performing Years

Using RANK() window functions:

- Identifies highest annual return year
- Identifies lowest annual return year
- Highlights volatility patterns

---

## Compatibility Notice

This implementation uses advanced SQL features such as:

- Window functions (LAG, SUM OVER, RANK)
- Explicit type casting
- Conditional logic (CASE)

These features are fully supported in PostgreSQL and most modern relational database systems (e.g., SQL Server, Oracle, MySQL 8.0+).

Older SQL engines or legacy versions may require minor syntax adjustments.

---

## AI-Assisted Development

AI tools were used to streamline query refinement and documentation structuring. All database design, financial logic, and analytical validation were independently developed and reviewed.

---

## Skills Demonstrated

- Relational database design  
- Advanced SQL window functions  
- Conditional logic (CASE statements)  
- Multi-table joins  
- Data transformation and type casting  
- Time-series financial analysis  
- Structured performance benchmarking  

---

## Technical Impact

This SQL implementation demonstrates the ability to build scalable, automated financial analysis within a cloud-based PostgreSQL environment.

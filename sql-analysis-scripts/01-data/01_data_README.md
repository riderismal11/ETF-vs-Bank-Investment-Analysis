# 📂 01 data — Database Schema & Seed Data

This folder contains the foundational SQL script that builds the entire relational database used in this project. It must be executed **first** before running any other script in this repository.

---

## File

### `Investment_Performance_Comparison_2006-2026.sql`

**Purpose:** Creates and populates all 4 tables that form the data model for this analysis.

**Execution order:** Run this script once in Supabase before any analysis queries.

---

## Tables Created

### `cd_banks`
Stores the current advertised annual CD rates for the top 10 U.S. banks. Used to compute the 3.92% average rate applied as the fixed CD benchmark across all 21 years.

| Column | Type | Description |
|---|---|---|
| `bank_name` | TEXT | Name of the bank |
| `annual_rate` | NUMERIC(6,4) | Annual CD rate as decimal (0.0505 = 5.05%) |

### `vti_annual_performance`
Annual open/close prices and return percentage for VTI (Vanguard Total Stock Market ETF) from 2006 to 2026.

| Column | Type | Description |
|---|---|---|
| `year` | INTEGER | Calendar year (PRIMARY KEY) |
| `open_price` | NUMERIC(10,2) | ETF opening price at start of year (USD) |
| `close_price` | NUMERIC(10,2) | ETF closing price at end of year (USD) |
| `annual_pct` | TEXT | Annual return as formatted string: `'15.51%'` |

### `smh_annual_performance`
Annual open/close prices and return percentage for SMH (VanEck Semiconductor ETF) from 2006 to 2026. Same structure as `vti_annual_performance`.

### `investment_comparison`
Year-by-year side-by-side performance of all 3 instruments plus the compounded capital value of a $10,000 initial investment in each.

| Column | Type | Description |
|---|---|---|
| `Year` | INTEGER | Calendar year (PRIMARY KEY) |
| `VTI(ETF) % of Performance` | TEXT | VTI annual return string |
| `SMH(ETF) % of Performance` | TEXT | SMH annual return string |
| `CD Average Return (%)` | TEXT | Fixed `'3.92%'` for all years |
| `10k investment example VTI` | NUMERIC(12,2) | Compounded VTI capital (USD) |
| `10k investment example SMH` | NUMERIC(12,2) | Compounded SMH capital (USD) |
| `10k investment example CD` | NUMERIC(12,2) | Compounded CD capital (USD) |

---

## Key Assumptions

| Assumption | Value | Notes |
|---|---|---|
| Initial investment | $10,000 | Standard benchmark |
| CD rate | 3.92% fixed | Mean of top 10 U.S. bank rates — does not reflect historical variability |
| Period | 2006–2026 | 21 years; 2026 is YTD (partial year) |
| Fees / taxes | Not applied | Gross performance comparison only |

---

## Design Notes

- `annual_pct` is stored as **TEXT** (e.g., `'15.51%'`) to match the original Excel source format. Queries that require numeric comparison must cast using `REPLACE(annual_pct, '%', '')::NUMERIC`.
- Column names in `investment_comparison` use quoted identifiers with spaces (e.g., `"10k investment example VTI"`) to preserve Excel column naming. Always wrap these in double quotes in queries.
- No indexes are defined beyond PRIMARY KEY. For larger datasets, adding an index on `year` would improve window function performance.

---

## How to Run

1. Open your Supabase project → SQL Editor
2. Paste the full contents of `Investment_Performance_Comparison_2006-2026.sql`
3. Click **Run**
4. Verify the 4 tables appear in the Table Editor

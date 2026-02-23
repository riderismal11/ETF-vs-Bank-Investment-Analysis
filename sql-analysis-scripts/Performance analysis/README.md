#📂 Performance Analysis — Annual Rankings & Winner Comparison

This folder contains the SQL scripts that perform comparative performance analysis across all three instruments: identifying the best and worst years for each ETF, and determining which instrument delivered the highest return each year from 2006 to 2026.

**Prerequisite:** The `01 data` script must be executed before running any script in this folder.

---

## Files

### `ETF_Annual_Best_and_Worst_Years.sql`
**Purpose:** Identifies the single best and worst performing year for each ETF (VTI and SMH) across the full 2006–2026 period.

**Method:** Uses `RANK()` window function applied to annual returns. Assigns rank 1 to the highest return year (best) and rank 1 to the lowest return year (worst) in separate window partitions.

**Tables used:** `vti_annual_performance`, `smh_annual_performance`

**Expected results:**

| ETF | Category | Year | Return |
|---|---|---|---|
| VTI | Best Year | 2013 | +31.33% |
| VTI | Worst Year | 2008 | -37.38% |
| SMH | Best Year | 2009 | +97.84% |
| SMH | Worst Year | 2008 | -58.00% |

**Key insight:** Both ETFs hit their worst year in 2008, confirming high correlation during systemic market stress. SMH's 2008 loss (-58%) was 54% deeper than VTI's (-37%), illustrating the amplified downside risk of concentrated sector exposure.

---

### `Annual_Return_Winner_by_Year.sql`
**Purpose:** For each year from 2006 to 2026, determines which instrument — VTI, SMH, or CD — delivered the highest annual return.

**Method:** Three-table JOIN on `year`, followed by a `CASE` statement that casts all TEXT percentage values to NUMERIC and compares them. CD wins by default in tie or near-zero scenarios.

**Tables used:** `vti_annual_performance`, `smh_annual_performance`, `investment_comparison`

**Output columns:** `year`, `vti_return`, `smh_return`, `cd_return`, `winner`

**Expected pattern:**

| Winner | Years | Context |
|---|---|---|
| CD | 2008, 2011, 2015, 2022 | Bear/flat years — both ETFs negative or near zero |
| VTI | 2006, 2007 | Early period broad market leadership |
| SMH | Most remaining years | Semiconductor sector outperformance in bull markets |

**Key insight:** CD only wins in years where both ETFs are negative or nearly flat. SMH wins the majority of positive-return years due to its higher beta. However, the years CD wins correspond exactly to the highest-stress market events — validating its role as a capital preservation instrument, not a growth vehicle.

---

## Technical Notes

**TEXT to NUMERIC casting:** Both scripts require `REPLACE(annual_pct, '%', '')::NUMERIC` because annual returns are stored as TEXT strings (e.g., `'15.51%'`). This is a known schema limitation documented in `01 data/README.md`.

**RANK() vs DENSE_RANK():** These scripts use `RANK()`. If two years had identical returns, both would receive rank 1 and both would appear in the results. `DENSE_RANK()` would behave identically in this case since no ties exist in this dataset.

**Winner tie handling:** The `CASE` statement in `Annual_Return_Winner_by_Year.sql` defaults to `'CD'` when no instrument clearly wins. This is a conservative assumption — in practice, ties between ETFs do not occur in this dataset.

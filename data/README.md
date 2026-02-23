# /data — Source Data Documentation

This folder contains the raw and processed datasets used across all layers of this project: Excel modeling, SQL analysis (Supabase), and visualization.

---

## Files Overview

### `smh_annual_returns.csv`
Annual price and return data for **SMH (VanEck Semiconductor ETF)** from 2006 to 2026.

| Column | Type | Description |
|---|---|---|
| `year` | INTEGER | Calendar year |
| `open_usd` | FLOAT | Opening price at start of year (USD) |
| `close_usd` | FLOAT | Closing price at end of year (USD) |
| `annual_return_pct` | FLOAT | Annual return as percentage (e.g., 15.51 = 15.51%) |
| `notes` | TEXT | "YTD" for partial year (2026); blank otherwise |

**Source:** [Investing.com — SMH Historical Data](https://www.investing.com/etfs/vaneck-vectors-semiconductor-etf-historical-data)

---

### `vti_annual_returns.csv`
Annual price and return data for **VTI (Vanguard Total Stock Market ETF)** from 2006 to 2026.

| Column | Type | Description |
|---|---|---|
| `year` | INTEGER | Calendar year |
| `open_usd` | FLOAT | Opening price at start of year (USD) |
| `close_usd` | FLOAT | Closing price at end of year (USD) |
| `annual_return_pct` | FLOAT | Annual return as percentage |
| `notes` | TEXT | "YTD" for partial year (2026); blank otherwise |

**Source:** [Investing.com — VTI Historical Data](https://www.investing.com/etfs/vanguard-total-stock-market-etf-historical-data)

---

### `cd_annual_rates.csv`
Annual CD (Certificate of Deposit) rate applied uniformly across the 2006–2026 period.

| Column | Type | Description |
|---|---|---|
| `year` | INTEGER | Calendar year |
| `annual_rate_pct` | FLOAT | Annual rate as percentage (3.92 = 3.92%) |
| `rate_type` | TEXT | "fixed_average" — single average applied across all years |
| `notes` | TEXT | Source description on first row; "YTD" for 2026 |

**Methodology Note:** The CD rate of **3.92%** represents the simple arithmetic mean of current advertised annual rates from the top 10 U.S. banks in this dataset (see `bank_cd_rates_snapshot.csv`). This rate is applied as a fixed constant across all 21 years as a conservative baseline for comparison. It does **not** reflect the actual historical variability of CD rates (which ranged from ~0.1% in 2012–2021 to ~5%+ in 2023–2024). This is an acknowledged analytical simplification.

---

### `bank_cd_rates_snapshot.csv`
Point-in-time snapshot of advertised CD rates from top U.S. banks, used to compute the 3.92% average.

| Column | Type | Description |
|---|---|---|
| `bank` | TEXT | Bank name |
| `annual_rate_pct` | FLOAT | Advertised annual CD rate (%) |
| `data_type` | TEXT | "current_snapshot" or "computed_mean" |

**Source:** Manually researched from publicly advertised bank rates. Data collected for project baseline establishment.

---

### `compound_growth_comparison.csv`
Pre-computed compound capital growth of a **$10,000 initial investment** in each instrument from 2006 to 2026. This is the core derived dataset used in charts and SQL analysis.

| Column | Type | Description |
|---|---|---|
| `year` | INTEGER | Calendar year |
| `vti_return_pct` | FLOAT | VTI annual return (%) that year |
| `smh_return_pct` | FLOAT | SMH annual return (%) that year |
| `cd_return_pct` | FLOAT | CD annual rate (%) — fixed 3.92% |
| `vti_capital_usd` | FLOAT | Compounded VTI portfolio value (USD) |
| `smh_capital_usd` | FLOAT | Compounded SMH portfolio value (USD) |
| `cd_capital_usd` | FLOAT | Compounded CD portfolio value (USD) |

**Compound Logic:** Each year's capital = prior year capital × (1 + annual_return).
Initial investment: **$10,000** (2006 base). No fees, taxes, or dividend reinvestment adjustments applied.

---

## Key Analytical Assumptions

| Assumption | Value | Rationale |
|---|---|---|
| Initial investment | $10,000 | Standard benchmark for comparison clarity |
| Analysis period | 2006–2026 | 20-year horizon captures full market cycles including 2008 crisis, COVID crash, and semiconductor boom |
| CD rate | 3.92% (fixed) | Average of top 10 U.S. bank rates; acknowledged simplification |
| Dividends | Not adjusted | ETF prices reflect price return only, not total return |
| Fees/taxes | Excluded | Gross performance comparison; real net returns would be lower |
| 2026 data | YTD (partial year) | Included for completeness; should be excluded from annualized metrics |

---

## Data Limitations

- **CD rate is not historically variable.** Real CD rates were near 0% from 2010–2021. Using 3.92% uniformly **overestimates** CD performance during that period, making ETFs' relative outperformance even more significant than shown.
- **ETF prices are unadjusted** for dividends. Total return (price + dividends) would be slightly higher for both VTI and SMH.
- **2026 is a partial year (YTD)** and should be treated as an incomplete data point in any annualized calculation.
- **SMH underwent a reconstitution** in 2020 (changed from Market Vectors to VanEck, with updated holdings). Pre/post comparability is approximate.

---

## Reproducibility

All data can be independently verified:
- ETF prices: [Investing.com](https://www.investing.com) → Historical Data for VTI / SMH
- CD rates: [FDIC BankFind](https://banks.data.fdic.gov) and individual bank websites
- Federal Reserve historical rates: [FRED — St. Louis Fed](https://fred.stlouisfed.org/series/MMNRNJ)

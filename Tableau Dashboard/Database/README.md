# Database

This folder contains the source data files used to build the Tableau Public dashboard for the ETF vs. Bank Investment Analysis project.

---

## Files

### compound_growth_comparison.csv
The primary data file used in all 4 Tableau visualizations. Contains annual return percentages and cumulative capital values for all three instruments from 2006 to 2026.

| Column | Description |
|---|---|
| Year | Calendar year (2006-2026) |
| Vti Return Pct | VTI annual return percentage |
| Smh Return Pct | SMH annual return percentage |
| Cd Return Pct | CD annual return percentage |
| Vti Capital Usd | VTI cumulative capital value ($10,000 initial) |
| Smh Capital Usd | SMH cumulative capital value ($10,000 initial) |
| Cd Capital Usd | CD cumulative capital value ($10,000 initial) |

---

### vti_annual_returns.csv
Annual return data for VTI (Vanguard Total U.S. Market ETF) including open and close prices and annual return percentage from 2006 to 2026.

---

### smh_annual_returns.csv
Annual return data for SMH (VanEck Semiconductor ETF) including open and close prices and annual return percentage from 2006 to 2026.

---

### cd_annual_rates.csv
Annual CD rate data from U.S. banks from 2006 to 2026. Rates sourced from FDIC historical data and major bank published rates.

---

## Data Notes

- 2026 data is year-to-date (partial year)
- CD rate is fixed at 3.92% average — this overstates real CD performance during 2010-2021 when rates averaged 0.1-0.5%
- All capital values assume $10,000 initial investment with full reinvestment each year
- No dividends or tax considerations are included in the calculations

---

## Data Source

Raw data sourced from Investing.com historical price data and manually researched U.S. bank CD rates. Full methodology documented in the main project [01-data](../../01-data/README.md) folder.

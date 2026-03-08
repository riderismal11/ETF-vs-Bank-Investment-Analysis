# Dashboard

Interactive Power BI dashboard for the ETF vs Traditional Banking Investment Analysis project (2006–2026).

## File

| File | Description |
|---|---|
| `Dashboard.pbix` | Power BI Desktop file — requires Power BI Desktop to open |

## Download Power BI Desktop

If you don't have Power BI Desktop installed:
1. Go to https://powerbi.microsoft.com/desktop
2. Download and install for free
3. Open `Dashboard.pbix`

## Dashboard Structure

| Page | Description |
|---|---|
| Executive Overview | Compound growth curves, annual returns, KPI cards, year slicer |
| Instrument Deep Dive | Per-instrument analysis with interactive slicer |
| Risk vs Return | Scatter plot, volatility metrics, drawdown analysis |

## Data Sources

The dashboard connects to the CSV files located in the `/data/` folder:
- `compound_growth_comparison.csv`
- `vti_annual_returns.csv`
- `smh_annual_returns.csv`
- `cd_annual_rates.csv`

## Preview

Screenshots of all 3 pages are available in the `/dashboard-preview/` folder.

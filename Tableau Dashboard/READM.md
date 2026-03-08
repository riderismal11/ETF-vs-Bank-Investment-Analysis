# Tableau Dashboard

This folder contains the Tableau Public interactive dashboard for the ETF vs. Bank Investment Analysis project, along with the source data files and dashboard preview.

---

## Live Dashboard

🔗 [View Interactive Dashboard on Tableau Public](https://public.tableau.com/views/ETFvs_BankInvestmentAnalysisTableauDashboard/Dashboard)

---

## Dashboard Preview

![ETF vs. Bank Investment Analysis Tableau Dashboard](Tableau%20Dashboard-preview/ETF_vs_Bank_Investment_Analysis_Tableau_Dashboard.png)

---

## Visualizations

### 1. Annual Return Distribution by Instrument (2006-2026)
Box plot showing the statistical distribution of annual returns for each instrument across 20 years. Box width represents the interquartile range (IQR) — the range where 50% of annual returns fall. Wider box means higher volatility. Dots represent outlier years outside the expected range.

| Instrument | Min Return | Max Return | Volatility |
|---|---|---|---|
| CD | ~3.9% | ~3.9% | Near zero |
| VTI | -37.38% | +28.7% | Moderate |
| SMH | -58.00% | +97.8% | Extreme |

### 2. Annual Returns Heatmap (2006-2026)
Color-coded matrix showing annual return percentages by instrument and year. Red cells indicate negative returns, blue cells indicate positive returns. Intensity of color reflects magnitude of return.

Key observations:
- 2008 financial crisis visible as deep red across SMH and VTI
- CD row is consistently light blue with no variation
- SMH shows highest color contrast, reflecting extreme year-to-year swings

### 3. Final Capital Treemap (2026)
Proportional visualization of final capital value after a $10,000 investment held from 2006 to 2026. Box size is proportional to final capital value.

| Instrument | Final Capital |
|---|---|
| SMH | $222,833 |
| VTI | $60,325 |
| CD | $22,422 |

### 4. Cumulative Growth Line Chart (2006-2026)
Independent growth trajectories of all 3 instruments showing how $10,000 grew over 20 years. SMH diverges exponentially from VTI and CD after 2016, driven by the semiconductor boom and AI investment cycle.

---

## Folder Structure

```
Tableau Dashboard/
│
├── 📂 Database/                       ← Source data files used in Tableau
│   ├── compound_growth_comparison.csv
│   ├── vti_annual_returns.csv
│   ├── smh_annual_returns.csv
│   ├── cd_annual_rates.csv
│   └── README.md
├── 📂 Tableau Dashboard-preview/      ← Screenshot of dashboard
│   └── ETF_vs_Bank_Investment_Analysis_Tableau_Dashboard.png
│   
│
├── ETF vs. Bank Investment Analysis Tableau Dashboard.twbx
└── README.md
```

---

## Tools Used

| Tool | Usage |
|---|---|
| Tableau Public | Dashboard creation and publishing |
| CSV files | Source data for all 4 visualizations |

---

## Data Source

All data used in this dashboard comes from the `Database` folder. The primary file is `compound_growth_comparison.csv` which contains annual return percentages and capital values for all three instruments from 2006 to 2026.

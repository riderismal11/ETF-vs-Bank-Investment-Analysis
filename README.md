# ETF vs Traditional Banking Investment Analysis (2006–2026)

> **An end-to-end data analytics project** combining SQL database design, Excel financial modeling, Power BI dashboarding, and Tableau visualization to answer a real-world investment decision: *Where should a retail investor put $10,000 for maximum long-term growth?*

---

## Overview

This project presents a structured financial analysis comparing long-term investment performance between:

- **VTI** (Vanguard Total U.S. Market ETF)
- **SMH** (VanEck Semiconductor ETF)
- **U.S. Bank Certificates of Deposit (CDs)**

The study evaluates which strategy delivers stronger long-term capital growth using historical annual returns from 2006 to 2026.

---

## Business Problem

A retail investor with $10,000 and a 20-year horizon faces a fundamental decision: **passive ETF investing vs. traditional bank instruments**. This project quantifies that decision using 20 years of historical data, evaluating not just returns but risk, volatility, and capital preservation across multiple market cycles including the 2008 Financial Crisis, COVID-19, and the 2022 rate hike environment.

**Core question:** Does the higher volatility of ETFs justify their return premium over guaranteed bank instruments?

This project analyzes:
- Annual returns
- Compound growth
- Volatility exposure
- Performance leadership by year
- Best and worst performing years
- Cumulative capital appreciation

---

## Key Findings (2006–2026, $10,000 Initial Investment)

| Instrument | Final Capital | Total Return | Avg Annual Return | Std Deviation | Max Drawdown | Negative Years |
|---|---|---|---|---|---|---|
| SMH (Semiconductor ETF) | ~$222,832 | +2,128% | 22.24% | 34.1% | -58.00% (2008) | 6 of 20 |
| VTI (Total Market ETF) | ~$60,324 | +503% | 10.85% | 18.2% | -37.38% (2008) | 5 of 20 |
| CD (Bank Average) | ~$22,422 | +124% | 3.92% | 0% | 0% | 0 of 20 |

> **Note:** 2026 is year-to-date (partial year). CD rate fixed at 3.92% — overstates real CD performance during 2010–2021 when rates averaged 0.1–0.5%.

---

## Business Recommendations

Based on 20 years of data across three full market cycles:

**Conservative investor (low risk tolerance, short horizon < 5 years):** CDs provide capital certainty with zero drawdown risk. However, at 3.92% average, they barely outpace inflation. Suitable only as a short-term buffer, not a long-term wealth-building strategy.

**Moderate investor (medium risk tolerance, horizon 10–20 years):** VTI is the optimal risk-adjusted choice. It delivered 4x the CD return (+503% vs +124%) with manageable drawdowns that fully recovered within 3–4 years in both 2008 and 2022.

**Aggressive investor (high risk tolerance, horizon > 15 years):** SMH generated 17x more wealth than CDs and 3.7x more than VTI — but required holding through a -58% loss in 2008 and waiting until 2012 just to recover the original $10,000.

**Bottom line:** For a retail investor who cannot monitor markets daily, VTI provides the best balance of growth and risk. SMH's outperformance is real but concentration risk is severe. CDs should be treated as cash management, not investment strategy.

---

## Power BI Dashboard Preview

### Executive Overview
![Executive Overview](Power%20BI%20Dashboard/Power%20BI%20Dashboard-preview/Executive%20Overview.png)

### Instrument Deep Dive
![Instrument Deep Dive](Power%20BI%20Dashboard/Power%20BI%20Dashboard-preview/Instrument%20Deep%20Dive.png)

### Risk vs Return
![Risk vs Return](Power%20BI%20Dashboard/Power%20BI%20Dashboard-preview/Risk%20vs%20Return.png)

📥 [Download Power BI Dashboard](Power%20BI%20Dashboard/Dashboard.pbix)

---

## Tableau Dashboard Preview

![ETF vs. Bank Investment Analysis Tableau Dashboard](Tableau%20Dashboard/Tableau%20Dashboard-preview/ETF_vs_Bank_Investment_Analysis_Tableau_Dashboard.png)

🔗 [View Interactive Tableau Dashboard](https://public.tableau.com/views/ETFvs_BankInvestmentAnalysisTableauDashboard/Dashboard)

### Visualizations Included
- **Annual Return Distribution Box Plot** — statistical distribution of annual returns showing CD's near-zero variance vs SMH's extreme volatility range (-58% to +97%)
- **Annual Returns Heatmap** — color-coded matrix (red = negative, blue = positive) showing return patterns by year and instrument across all 20 years
- **Final Capital Treemap** — proportional visualization of final capital by instrument in 2026: SMH $222,833 vs VTI $60,325 vs CD $22,422
- **Cumulative Growth Line Chart** — independent growth trajectories of all 3 instruments showing SMH's exponential divergence from VTI and CD after 2016

---

## Analytical Approach

This project is built across five integrated layers — demonstrating a complete data analytics workflow from raw data to business decision:

**1. Data Layer** — Raw annual return data sourced from Investing.com and manually researched bank rates, structured as clean CSVs with full methodology documentation.

**2. SQL Layer (Supabase / PostgreSQL)** — Relational database design with 4 normalized tables. Advanced queries using window functions (`LAG`, `RANK`, `SUM OVER`), CTEs, multi-table JOINs, and conditional logic to automate all financial calculations.

**3. Excel Layer** — Financial modeling with compound growth simulations, annual performance tracking, and comparative analysis across all three instruments.

**4. Power BI Layer** — Interactive 3-page dashboard with dynamic year filtering, instrument deep-dive analysis, and risk vs return visualization.

**5. Tableau Layer** — Interactive public dashboard with 4 complementary visualizations including heatmap, box plot, treemap, and cumulative growth chart.

---

## Power BI Dashboard

| Page | Key Visuals | Purpose |
|---|---|---|
| Executive Overview | Line chart, clustered column chart, KPI cards, year slicer | High-level 20-year performance comparison |
| Instrument Deep Dive | Interactive slicer (VTI/SMH/CD), capital growth line, yearly gain/loss bars, data table | Per-instrument detailed analysis |
| Risk vs Return | Scatter plot, volatility cards, positive vs negative years chart | Risk-adjusted performance evaluation |

---

## Repository Structure

```
ETF-vs-Bank-Investment-Analysis/
│
├── 📂 01-data/                          ← Source datasets & methodology docs
│   ├── vti_annual_returns.csv
│   ├── smh_annual_returns.csv
│   ├── cd_annual_rates.csv
│   ├── bank_cd_rates_snapshot.csv
│   ├── compound_growth_comparison.csv
│   └── README.md
│
├── 📂 Excel Analysis/                   ← Financial modeling & visualizations
│   ├── Investment Performance Comparison.xlsx
│   ├── Performance Certificates of Deposit USA Banks.xlsx
│   ├── SMH(ETF) Performance.xlsx
│   ├── VTI(ETF) Performance.xlsx
│   └── README.md
│
├── 📂 Power BI Dashboard/               ← Power BI file & previews
│   ├── 📂 Power BI Dashboard-preview/   ← Screenshots of all 3 dashboard pages
│   │   ├── Executive Overview.png
│   │   ├── Instrument Deep Dive.png
│   │   ├── Risk vs Return.png
│   │   └── README.md
│   ├── Dashboard.pbix
│   └── README.md
│
├── 📂 SQL Analysis Scripts/             ← PostgreSQL queries (Supabase)
│   ├── 📂 01 data/
│   │   ├── Investment_Performance_Comparison_2006-2026.sql
│   │   └── README.md
│   ├── 📂 Investment Examples/
│   │   ├── VTI_10k_Investment_Annual_and_Cumulative_Gains.sql
│   │   ├── SMH_10k_investment_Yearly_and_cumulative_gains.sql
│   │   ├── CD_10k_Investment_Yearly_and_Cumulative_Gains.sql
│   │   └── README.md
│   └── 📂 Performance Analysis/
│       ├── ETF_Annual_Best_and_Worst_Years.sql
│       ├── Annual_Return_Winner_by_Year.sql
│       └── README.md
│
├── 📂 Tableau Dashboard/                ← Tableau interactive dashboard
│   ├── 📂 Database/                     ← Source data files used in Tableau
│   │   ├── compound_growth_comparison.csv
│   │   ├── vti_annual_returns.csv
│   │   ├── smh_annual_returns.csv
│   │   └── cd_annual_rates.csv
│   ├── 📂 Tableau Dashboard-preview/    ← Screenshot of Tableau dashboard
│   │   ├── ETF_vs_Bank_Investment_Analysis_Tableau_Dashboard.png
│   │   └── README.md
│   ├── ETF vs. Bank Investment Analysis Tableau Dashboard.twbx
│   └── README.md
│
└── README.md
```

---

## Technical Stack

| Tool | Usage |
|---|---|
| PostgreSQL (Supabase) | Database design, window functions, CTEs, multi-table JOINs |
| Excel | Financial modeling, compound growth simulation, charting |
| Power BI | Interactive 3-page dashboard, DAX measures, dynamic filtering |
| Tableau | Public interactive dashboard, heatmap, box plot, treemap |
| SQL | Data transformation, ranking, time-series analysis |
| CSV / Git | Data versioning and reproducibility |

---

## SQL Skills Demonstrated

- Relational database design (4 normalized tables)
- Window functions: `LAG()`, `RANK()`, `SUM() OVER`
- Common Table Expressions (CTEs)
- Multi-table JOINs
- `CASE` conditional logic
- Type casting and string manipulation (`REPLACE`, `::NUMERIC`)
- Currency formatting with `TO_CHAR`

---

## Use of Artificial Intelligence Tools

This project was developed with the support of multiple AI tools used as productivity and research assistants — to accelerate query structuring, validate financial modeling logic, refine database design, and improve documentation clarity.

All financial modeling, database architecture, analytical logic, and validation were designed, structured, and verified independently. AI tools were used as support resources to enhance efficiency and workflow speed — not as substitutes for analytical decision-making.

---

## Academic Context

**B.S. in Information Systems and Business Analytics**
Concentration: Cloud Computing | Minor: Cybersecurity

Associate Degree in Business Administration (completed)

---

## About This Project

This project was built to demonstrate a complete, production-quality data analytics workflow applicable to roles in:

- **Data Analysis** — end-to-end pipeline from raw data to business insight
- **Business Intelligence** — multi-layer reporting with SQL + Excel + Power BI + Tableau
- **Financial Data Analysis** — real financial instruments, risk metrics, investment modeling
- **Reporting & BI** — structured, reproducible, and visually communicable analysis
- **Business Analysis** — data-driven decision framework with actionable recommendations

---

## Connect

- 🔗 [LinkedIn](https://www.linkedin.com/in/rider-novas)
- 💻 [Portfolio](https://riderismal11.github.io/portfolio/)
- 📧 riderismal11@gmail.com

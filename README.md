# ETF vs Traditional Banking Investment Analysis (2006–2026)

## Overview

This project presents a structured financial analysis comparing long-term investment performance between:

- VTI (Vanguard Total U.S. Market ETF)
- SMH (VanEck Semiconductor ETF)
- U.S. Bank Certificates of Deposit (CDs)

The study evaluates which strategy delivers stronger long-term capital growth using historical annual returns from 2006 to 2026.

---

## Core Question

If $10,000 had been invested in 2006, how would each strategy have performed over 20 years?

This project analyzes:

- Annual returns
- Compound growth
- Volatility exposure
- Performance leadership by year
- Best and worst performing years
- Cumulative capital appreciation

---

## Key Findings (2006–2026, $10,000 initial investment)

| Instrument | Final Capital | Total Return | Risk Profile |
|---|---|---|---|
| SMH (Semiconductor ETF) | ~$222,832 | +2,128% | High — worst year: -58% (2008) |
| VTI (Total Market ETF) | ~$60,324 | +503% | Moderate — worst year: -37% (2008) |
| CD (Bank Average) | ~$22,422 | +124% | None — positive every single year |

> **Note:** 2026 data is year-to-date (partial year) and not annualized. CD rate fixed at 3.92% (current bank average) applied uniformly — this overstates CD performance during 2010–2021 when real rates were near 0%.

---

## Analytical Approach

This project combines four integrated analytical layers:

**Excel** — Financial data was structured, modeled, and visualized using charts and comparison tools to enable rapid performance analysis and trend identification.

**SQL (Supabase / PostgreSQL)** — Structured queries were implemented to automate capital growth calculations, identify annual winners, and rank best/worst performing years using window functions and conditional logic.

**Power BI** — An interactive dashboard is currently in development to consolidate all findings into a single, recruiter-ready visual report with dynamic filtering by year across three pages: Executive Overview, Instrument Deep Dive, and Risk vs Return Analysis.

**Data** — All raw source data is version-controlled in this repository as structured CSV files for full reproducibility.

---

## Power BI Dashboard (In Development)

An interactive Power BI dashboard is being built to provide a consolidated view of all investment metrics.

### Dashboard Structure

| Page | Purpose |
|---|---|
| Executive Overview | Compound growth curves, annual returns comparison, KPI cards |
| Instrument Deep Dive | Per-instrument analysis with interactive slicer (VTI / SMH / CD) |
| Risk vs Return | Scatter plot, volatility metrics, drawdown analysis |

### Visuals Planned

| Visual | Type | Page |
|---|---|---|
| Compound Growth of $10,000 | Line Chart | Executive Overview |
| Annual Return % by Year | Clustered Column Chart | Executive Overview |
| Final Capital KPIs | Card Visuals | Executive Overview |
| Capital Growth by Instrument | Line Chart | Instrument Deep Dive |
| Yearly Gain/Loss in $ | Column Chart | Instrument Deep Dive |
| Risk vs Return | Scatter Plot | Risk vs Return |
| Drawdown & Volatility Metrics | Cards | Risk vs Return |

**Data source:** `/data/` folder CSVs in this repository — ensuring full consistency between Excel, SQL, and Power BI layers.

---

## Repository Structure

```
ETF-vs-Bank-Investment-Analysis/
│
├── 📂 data/
│   ├── vti_annual_returns.csv
│   ├── smh_annual_returns.csv
│   ├── cd_annual_rates.csv
│   ├── bank_cd_rates_snapshot.csv
│   ├── compound_growth_comparison.csv
│   └── README.md
│
├── 📂 Excel Analysis/
│
├── 📂 sql-analysis-scripts/
│   ├── 📂 01 data/
│   │   └── Investment_Performance_Comparison_2006-2026.sql
│   ├── 📂 Investment Examples/
│   │   ├── VTI_10k_Investment_Annual_and_Cumulative_Gains.sql
│   │   ├── SMH_10k_investment_Yearly_and_cumulative_gains.sql
│   │   └── CD_10k_Investment_Yearly_and_Cumulative_Gains.sql
│   └── 📂 Performance Analysis/
│       ├── ETF_Annual_Best_and_Worst_Years.sql
│       └── Annual_Return_Winner_by_Year.sql
│
└── README.md
```

---

## Use of Artificial Intelligence Tools

This project was developed with the support of multiple AI tools used as productivity and research assistants.

AI was leveraged to:

- Accelerate query structuring
- Validate financial modeling logic
- Refine database design
- Improve documentation clarity

All financial modeling, database architecture, analytical logic, and validation were designed, structured, and verified independently. AI tools were used as support resources to enhance efficiency and workflow speed — not as substitutes for analytical decision-making.

---

## Skills Demonstrated

- Financial performance modeling
- Investment growth simulation
- Excel data visualization (charts, trend analysis, comparison visuals)
- Time-series financial analysis
- SQL window functions (LAG, SUM, RANK)
- Conditional logic with CASE statements
- Multi-table joins
- Data transformation and pipeline design
- Power BI dashboard development (in progress)
- Risk vs return evaluation
- Business-focused analytical thinking

---

## Academic Context

Developed as part of my professional portfolio in:

**B.S. in Information Systems and Business Analytics**
Concentration: Cloud Computing | Minor: Cybersecurity

Associate Degree in Business Administration (completed)

---

## Purpose

This project demonstrates the ability to combine financial modeling, database analytics, and visual reporting techniques to produce structured, scalable, and data-driven investment insights across multiple analytical platforms.

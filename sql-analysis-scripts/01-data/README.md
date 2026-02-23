01 data — Database Schema & Seed Data
This folder contains the foundational SQL script that builds the entire relational database used in this project. It must be executed first before running any other script in this repository.

File
Investment_Performance_Comparison_2006-2026.sql
Purpose: Creates and populates all 4 tables that form the data model for this analysis.
Execution order: Run this script once in Supabase before any analysis queries.

Tables Created
cd_banks
Stores the current advertised annual CD rates for the top 10 U.S. banks. Used to compute the 3.92% average rate applied as the fixed CD benchmark across all 21 years.
ColumnTypeDescriptionbank_nameTEXTName of the bankannual_rateNUMERIC(6,4)Annual CD rate as decimal (0.0505 = 5.05%)
vti_annual_performance
Annual open/close prices and return percentage for VTI (Vanguard Total Stock Market ETF) from 2006 to 2026.
ColumnTypeDescriptionyearINTEGERCalendar year (PRIMARY KEY)open_priceNUMERIC(10,2)ETF opening price at start of year (USD)close_priceNUMERIC(10,2)ETF closing price at end of year (USD)annual_pctTEXTAnnual return as formatted string: '15.51%'
smh_annual_performance
Annual open/close prices and return percentage for SMH (VanEck Semiconductor ETF) from 2006 to 2026. Same structure as vti_annual_performance.
investment_comparison
Year-by-year side-by-side performance of all 3 instruments plus the compounded capital value of a $10,000 initial investment in each.
ColumnTypeDescriptionYearINTEGERCalendar year (PRIMARY KEY)VTI(ETF) % of PerformanceTEXTVTI annual return stringSMH(ETF) % of PerformanceTEXTSMH annual return stringCD Average Return (%)TEXTFixed '3.92%' for all years10k investment example VTINUMERIC(12,2)Compounded VTI capital (USD)10k investment example SMHNUMERIC(12,2)Compounded SMH capital (USD)10k investment example CDNUMERIC(12,2)Compounded CD capital (USD)

Key Assumptions
AssumptionValueNotesInitial investment$10,000Standard benchmarkCD rate3.92% fixedMean of top 10 U.S. bank rates — does not reflect historical variabilityPeriod2006–202621 years; 2026 is YTD (partial year)Fees / taxesNot appliedGross performance comparison only

Design Notes

annual_pct is stored as TEXT (e.g., '15.51%') to match the original Excel source format. Queries that require numeric comparison must cast using REPLACE(annual_pct, '%', '')::NUMERIC.
Column names in investment_comparison use quoted identifiers with spaces (e.g., "10k investment example VTI") to preserve Excel column naming. Always wrap these in double quotes in queries.
No indexes are defined beyond PRIMARY KEY. For larger datasets, adding an index on year would improve window function performance.


How to Run

Open your Supabase project → SQL Editor
Paste the full contents of Investment_Performance_Comparison_2006-2026.sql
Click Run
Verify the 4 tables appear in the Table Editor

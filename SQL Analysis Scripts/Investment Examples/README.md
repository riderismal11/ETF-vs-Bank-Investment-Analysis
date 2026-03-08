# 📂 Investment Examples — $10,000 Compound Growth Simulations

This folder contains the SQL scripts that simulate the year-by-year and cumulative performance of a **$10,000 initial investment** in each of the three instruments analyzed in this project.

**Prerequisite:** The `01 data` script must be executed before running any script in this folder.

---

## Files

| File | Instrument | Final Capital (2026) | Total Return |
|---|---|---|---|
| `VTI_10k_Investment_Annual_and_Cumulative_Gains.sql` | VTI (Total Market ETF) | ~$60,324 | +503% |
| `SMH_10k_investment_Yearly_and_cumulative_gains.sql` | SMH (Semiconductor ETF) | ~$222,832 | +2,128% |
| `CD_10k_Investment_Yearly_and_Cumulative_Gains.sql` | CD (Bank Average) | ~$22,422 | +124% |

---

## How Each Script Works

All three scripts follow the same analytical pattern:

**Step 1 — CTE `yearly_gain`**
Uses the `LAG()` window function to calculate the dollar gain or loss for each individual year by subtracting the prior year's capital from the current year's capital.

```sql
capital - LAG(capital, 1, 10000::NUMERIC) OVER (ORDER BY "Year") AS yearly_profit
```

The `LAG()` default value of `10000` handles the base year (2006) correctly — since there is no prior row, it treats $10,000 as the implicit starting capital.

**Step 2 — Main SELECT**
Formats the output as currency strings and adds a running cumulative gain using `SUM() OVER (ORDER BY Year)`.

---

## Output Columns

| Column | Description |
|---|---|
| `Year` | Calendar year |
| `capital` | Total portfolio value at end of that year (USD) |
| `yearly_gain` | Dollar gain or loss in that specific year |
| `cumulative_gain` | Running total profit from 2006 through that year |

---

## Key Results by Instrument

### VTI — Vanguard Total Stock Market ETF
- Steady long-term growth with two major drawdowns (2008: -37%, 2022: -20%)
- Recovered from both crashes and reached ~$60,324 by 2026
- Demonstrates the resilience of diversified index investing over 20 years

### SMH — VanEck Semiconductor ETF
- Most volatile instrument in the dataset
- Capital dropped to ~$3,840 in 2008 (-62% from starting $10,000)
- Did not recover original $10,000 until ~2012
- Explosive growth from 2017 onward driven by AI and semiconductor supercycle
- Final capital of ~$222,832 is approximately **3.7x VTI** and **10x CD**

### CD — Bank Certificate of Deposit
- Fixed 3.92% annual rate applied uniformly across all 21 years
- No negative years — capital increases every single year without exception
- Final capital of ~$22,422 reflects the trade-off: certainty over growth
- Real CD performance during 2010–2021 would be significantly lower (rates near 0.1–0.5%)

---

## Design Note

All three scripts are structurally identical — only the column name changes between them (`"10k investment example VTI"`, `SMH`, `CD`). This is an intentional design choice to keep each script self-contained and readable independently. A consolidated version combining all three instruments in a single query is available in the `📂 Performance Analysis` folder.

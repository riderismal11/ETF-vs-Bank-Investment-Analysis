-- ================================================================
--  VTI — $10,000 INVESTMENT: YEARLY AND CUMULATIVE GAINS
--  Purpose: Track the year-by-year capital value and profit/loss
--           of a $10,000 investment in VTI from 2006 to 2026,
--           plus the running cumulative gain over the full period.
--
--  Method:
--    1. CTE (yearly_gain): Uses LAG() window function to calculate
--       the dollar gain/loss for each individual year by subtracting
--       the prior year's capital from the current year's capital.
--       LAG default of 10000 handles the first year (2006) correctly,
--       treating the starting capital as the implicit "year 0" value.
--
--    2. Main SELECT: Adds a running cumulative sum of yearly gains
--       using SUM() OVER (ORDER BY Year), formatted as currency.
--
--  Capital values sourced from investment_comparison table, which
--  stores pre-computed compound growth values matching Excel model.
--
--  Tables used: investment_comparison
--  Environment: PostgreSQL (Supabase)
-- ================================================================

WITH yearly_gain AS (
    SELECT
        "Year",
        "10k investment example VTI"                                    AS capital,

        -- Yearly gain = current capital minus previous year's capital.
        -- LAG(..., 1, 10000::NUMERIC) sets the default to $10,000 for
        -- year 2006 (no prior row), so 2006 gain = 11551 - 10000 = $1,551.
        "10k investment example VTI"
            - LAG("10k investment example VTI", 1, 10000::NUMERIC)
              OVER (ORDER BY "Year")                                     AS yearly_profit

    FROM investment_comparison
)

SELECT
    "Year",

    -- Format capital as currency string for readability
    '$' || TO_CHAR(capital,       'FM999,999.00') AS capital,

    -- Dollar gain or loss in that specific year
    '$' || TO_CHAR(yearly_profit, 'FM999,999.00') AS yearly_gain,

    -- Running total profit from 2006 through each year
    -- Negative in early years if cumulative losses exceed gains
    '$' || TO_CHAR(
        SUM(yearly_profit) OVER (ORDER BY "Year"),
        'FM999,999.00'
    )                                             AS cumulative_gain

FROM yearly_gain
ORDER BY "Year";

-- ================================================================
-- EXPECTED FINAL ROW (2026):
--   Capital:          ~$60,324
--   Cumulative Gain:  ~$50,324 on original $10,000 investment
--   Total Return:     ~503% over 20 years
--
-- KEY CONTEXT: VTI's compounded growth reflects broad U.S. market
-- performance including two major crashes (2008: -37%, 2022: -20%)
-- from which it recovered fully. This demonstrates the resilience
-- of diversified index investing over long time horizons.
-- ================================================================

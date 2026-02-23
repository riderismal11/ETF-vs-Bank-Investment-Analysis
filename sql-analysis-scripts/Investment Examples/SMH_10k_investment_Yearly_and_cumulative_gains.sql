-- ================================================================
--  SMH — $10,000 INVESTMENT: YEARLY AND CUMULATIVE GAINS
--  Purpose: Track the year-by-year capital value and profit/loss
--           of a $10,000 investment in SMH from 2006 to 2026,
--           plus the running cumulative gain over the full period.
--
--  Method: Identical pattern to VTI script. CTE calculates yearly
--          dollar gain using LAG() with $10,000 default for base year.
--          Main query adds running cumulative gain via SUM() OVER.
--
--  SMH Context: VanEck Semiconductor ETF — concentrated sector fund.
--  Higher volatility than VTI means larger yearly swings in both
--  directions. The cumulative gain trajectory will show deep losses
--  in 2008-2009 before recovering and dramatically outpacing VTI
--  from 2017 onward, driven by the AI/semiconductor supercycle.
--
--  Tables used: investment_comparison
--  Environment: PostgreSQL (Supabase)
-- ================================================================

WITH yearly_gain AS (
    SELECT
        "Year",
        "10k investment example SMH"                                    AS capital,

        -- Yearly gain = current capital minus previous year's capital.
        -- LAG default 10000::NUMERIC correctly anchors 2006 as base year.
        "10k investment example SMH"
            - LAG("10k investment example SMH", 1, 10000::NUMERIC)
              OVER (ORDER BY "Year")                                     AS yearly_profit

    FROM investment_comparison
)

SELECT
    "Year",
    '$' || TO_CHAR(capital,       'FM999,999.00') AS capital,
    '$' || TO_CHAR(yearly_profit, 'FM999,999.00') AS yearly_gain,
    '$' || TO_CHAR(
        SUM(yearly_profit) OVER (ORDER BY "Year"),
        'FM999,999.00'
    )                                             AS cumulative_gain

FROM yearly_gain
ORDER BY "Year";

-- ================================================================
-- EXPECTED FINAL ROW (2026):
--   Capital:          ~$222,832
--   Cumulative Gain:  ~$212,832 on original $10,000 investment
--   Total Return:     ~2,128% over 20 years
--
-- NOTABLE PATTERN:
--   2008: Capital drops to ~$3,840 (-62% from starting $10,000)
--   2009: Recovers to ~$7,598 — still below break-even
--   2012: First time cumulative gain turns positive (~$596)
--   2023+: Explosive growth driven by AI semiconductor demand
--
-- KEY INSIGHT: SMH's final capital (~$222K) is approximately 3.7x
-- VTI's (~$60K), but achieved with dramatically higher drawdown
-- risk. An investor in SMH had to endure a -62% loss in 2008 and
-- wait until ~2012 just to recover their original $10,000.
-- ================================================================

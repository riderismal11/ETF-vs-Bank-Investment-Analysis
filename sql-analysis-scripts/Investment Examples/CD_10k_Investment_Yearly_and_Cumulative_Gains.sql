-- ================================================================
--  CD — $10,000 INVESTMENT: YEARLY AND CUMULATIVE GAINS
--  Purpose: Track the year-by-year capital value and profit/loss
--           of a $10,000 investment in a bank CD from 2006 to 2026,
--           using the fixed 3.92% annual rate benchmark.
--
--  Method: Same LAG() + SUM() OVER pattern as VTI and SMH scripts.
--          Because the CD rate is fixed at 3.92% every year, both
--          yearly_profit and cumulative_gain increase monotonically
--          (no negative years). This produces a smooth upward curve
--          that contrasts sharply with ETF volatility profiles.
--
--  CD Rate Assumption: 3.92% fixed (arithmetic mean of top 10 U.S.
--  bank rates). This overestimates real CD performance during
--  2010–2021 when average rates were near 0.1–0.5%. Real CD returns
--  over this period would be significantly lower, making ETFs'
--  relative outperformance even more pronounced than shown.
--
--  Tables used: investment_comparison
--  Environment: PostgreSQL (Supabase)
-- ================================================================

WITH yearly_gain AS (
    SELECT
        "Year",
        "10k investment example CD"                                     AS capital,

        -- Yearly gain = current capital minus prior year capital.
        -- With fixed 3.92% rate, this increases every year (no negative values).
        -- Formula equivalent: capital × 0.0392 per year.
        "10k investment example CD"
            - LAG("10k investment example CD", 1, 10000::NUMERIC)
              OVER (ORDER BY "Year")                                     AS yearly_profit

    FROM investment_comparison
)

SELECT
    "Year",
    '$' || TO_CHAR(capital,       'FM999,999.00') AS capital,
    '$' || TO_CHAR(yearly_profit, 'FM999,999.00') AS yearly_gain,

    -- Cumulative gain grows steadily every year with no drawdowns
    '$' || TO_CHAR(
        SUM(yearly_profit) OVER (ORDER BY "Year"),
        'FM999,999.00'
    )                                             AS cumulative_gain

FROM yearly_gain
ORDER BY "Year";

-- ================================================================
-- EXPECTED FINAL ROW (2026):
--   Capital:          ~$22,422
--   Cumulative Gain:  ~$12,422 on original $10,000 investment
--   Total Return:     ~124% over 20 years
--
-- COMPARISON SUMMARY (final capital on $10,000 invested in 2006):
--   SMH: ~$222,832  (+2,128%) — highest return, highest risk
--   VTI: ~ $60,324  (+  503%) — strong return, moderate risk
--   CD:  ~ $22,422  (+  124%) — lowest return, zero market risk
--
-- KEY INSIGHT: The CD's value is not growth — it is certainty.
-- Every year in this dataset, CD capital increased without exception.
-- For risk-averse investors or short time horizons, this predictability
-- has real value that raw return figures do not capture.
-- ================================================================

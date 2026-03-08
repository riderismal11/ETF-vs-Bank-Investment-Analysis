-- ================================================================
--  ANNUAL RETURN WINNER BY YEAR
--  Purpose: For each year (2006–2026), determine which investment
--           instrument delivered the highest annual return:
--           VTI (broad market ETF), SMH (semiconductor ETF), or CD.
--
--  Method: Three-table JOIN on year, followed by a CASE statement
--          that compares all three returns numerically and assigns
--          the winner. Ties default to 'CD' (conservative assumption).
--
--  Use case: Reveals which instrument led performance year by year,
--            enabling identification of market regime patterns
--            (e.g., ETFs dominate bull markets; CDs provide stability
--            in bear years like 2008, 2022).
--
--  Tables used: vti_annual_performance, smh_annual_performance,
--               investment_comparison
--  Environment: PostgreSQL (Supabase)
-- ================================================================

SELECT
    v.year,
    v.annual_pct                        AS vti_return,
    s.annual_pct                        AS smh_return,
    c."CD Average Return (%)"           AS cd_return,

    -- Determine winner by casting TEXT percentages to NUMERIC for comparison.
    -- VTI wins if its return exceeds both SMH and CD.
    -- SMH wins if its return exceeds both VTI and CD.
    -- CD wins in all other cases (including ties or bear years for both ETFs).
    CASE
        WHEN REPLACE(v.annual_pct, '%', '')::NUMERIC
           > REPLACE(s.annual_pct, '%', '')::NUMERIC
         AND REPLACE(v.annual_pct, '%', '')::NUMERIC
           > REPLACE(c."CD Average Return (%)", '%', '')::NUMERIC
        THEN 'VTI'

        WHEN REPLACE(s.annual_pct, '%', '')::NUMERIC
           > REPLACE(v.annual_pct, '%', '')::NUMERIC
         AND REPLACE(s.annual_pct, '%', '')::NUMERIC
           > REPLACE(c."CD Average Return (%)", '%', '')::NUMERIC
        THEN 'SMH'

        ELSE 'CD'
        -- CD wins when both ETFs return less than 3.92%
        -- This occurs in years like 2008 (-37%/-58%), 2022 (-20%/-35%)
    END AS winner

FROM vti_annual_performance  v
JOIN smh_annual_performance  s ON v.year = s.year
JOIN investment_comparison   c ON v.year = c."Year"

ORDER BY v.year;

-- ================================================================
-- EXPECTED PATTERN:
--   CD wins:  2008, 2011, 2015, 2022 (bear/flat years for equities)
--   VTI wins: Years with broad market leadership (e.g., 2013)
--   SMH wins: Most bull market years due to semiconductor sector
--             outperformance (e.g., 2009, 2017, 2019, 2020, 2021,
--             2023, 2025)
--
-- KEY INSIGHT: CD only wins in years where both ETFs are negative
-- or nearly flat. SMH wins the majority of positive-return years
-- due to its higher beta. However, the years CD wins correspond
-- exactly to the highest-stress market events, validating its role
-- as a capital preservation instrument — not a growth vehicle.
-- ================================================================

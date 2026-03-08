-- ================================================================
--  ETF ANNUAL BEST AND WORST YEARS
--  Purpose: Identify the single best and worst performing year
--           for each ETF (VTI and SMH) across the 2006–2026 period.
--
--  Method: RANK() window function applied to annual returns.
--          Returns rank=1 for highest return (best year) and
--          rank=1 for lowest return (worst year) separately.
--
--  Use case: Provides immediate context on maximum upside and
--            maximum downside risk for each instrument — key
--            inputs for any risk vs return evaluation.
--
--  Tables used: vti_annual_performance, smh_annual_performance
--  Environment: PostgreSQL (Supabase)
-- ================================================================

WITH vti_ranked AS (
    SELECT
        year,
        annual_pct,
        -- Rank years from highest to lowest return (best_rank = 1 is best year)
        RANK() OVER (ORDER BY REPLACE(annual_pct, '%', '')::NUMERIC DESC) AS best_rank,
        -- Rank years from lowest to highest return (worst_rank = 1 is worst year)
        RANK() OVER (ORDER BY REPLACE(annual_pct, '%', '')::NUMERIC ASC)  AS worst_rank
    FROM vti_annual_performance
    -- Note: REPLACE + ::NUMERIC cast is required because annual_pct is stored
    -- as TEXT (e.g., '15.51%'). If column were NUMERIC, cast would be unnecessary.
),
smh_ranked AS (
    SELECT
        year,
        annual_pct,
        RANK() OVER (ORDER BY REPLACE(annual_pct, '%', '')::NUMERIC DESC) AS best_rank,
        RANK() OVER (ORDER BY REPLACE(annual_pct, '%', '')::NUMERIC ASC)  AS worst_rank
    FROM smh_annual_performance
)

-- Combine best and worst years for both ETFs into a single result set
SELECT 'VTI' AS etf, 'Best Year'  AS category, year, annual_pct FROM vti_ranked WHERE best_rank  = 1
UNION ALL
SELECT 'VTI',        'Worst Year',              year, annual_pct FROM vti_ranked WHERE worst_rank = 1
UNION ALL
SELECT 'SMH',        'Best Year',               year, annual_pct FROM smh_ranked WHERE best_rank  = 1
UNION ALL
SELECT 'SMH',        'Worst Year',              year, annual_pct FROM smh_ranked WHERE worst_rank = 1

ORDER BY etf, category;

-- ================================================================
-- EXPECTED RESULTS (based on 2006–2026 dataset):
--   VTI Best Year:  2013 (+31.33%) — post-QE broad market rally
--   VTI Worst Year: 2008 (-37.38%) — Global Financial Crisis
--   SMH Best Year:  2009 (+97.84%) — semiconductor recovery from crash low
--   SMH Worst Year: 2008 (-58.00%) — semiconductor demand collapse
--
-- KEY INSIGHT: Both ETFs hit worst year in 2008, confirming high
-- correlation during systemic market stress events. SMH's 2008 loss
-- (-58%) was 54% deeper than VTI's (-37%), illustrating the
-- amplified downside risk of concentrated sector exposure.
-- ================================================================

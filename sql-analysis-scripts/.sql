WITH vti_ranked AS (
    SELECT year, annual_pct,
        RANK() OVER (ORDER BY REPLACE(annual_pct,'%','')::NUMERIC DESC) AS best_rank,
        RANK() OVER (ORDER BY REPLACE(annual_pct,'%','')::NUMERIC ASC)  AS worst_rank
    FROM vti_annual_performance
),
smh_ranked AS (
    SELECT year, annual_pct,
        RANK() OVER (ORDER BY REPLACE(annual_pct,'%','')::NUMERIC DESC) AS best_rank,
        RANK() OVER (ORDER BY REPLACE(annual_pct,'%','')::NUMERIC ASC)  AS worst_rank
    FROM smh_annual_performance
)
SELECT 'VTI' AS etf, 'Best Year'  AS type, year, annual_pct FROM vti_ranked WHERE best_rank  = 1
UNION ALL
SELECT 'VTI',        'Worst Year',          year, annual_pct FROM vti_ranked WHERE worst_rank = 1
UNION ALL
SELECT 'SMH',        'Best Year',           year, annual_pct FROM smh_ranked WHERE best_rank  = 1
UNION ALL
SELECT 'SMH',        'Worst Year',          year, annual_pct FROM smh_ranked WHERE worst_rank = 1
ORDER BY etf, type;

SELECT
    v.year,
    v.annual_pct                                                AS vti_return,
    s.annual_pct                                                AS smh_return,
    c."CD Average Return (%)"                                   AS cd_return,
    CASE
        WHEN REPLACE(v.annual_pct,'%','')::NUMERIC
           > REPLACE(s.annual_pct,'%','')::NUMERIC
         AND REPLACE(v.annual_pct,'%','')::NUMERIC
           > REPLACE(c."CD Average Return (%)",'%','')::NUMERIC THEN 'VTI'
        WHEN REPLACE(s.annual_pct,'%','')::NUMERIC
           > REPLACE(v.annual_pct,'%','')::NUMERIC
         AND REPLACE(s.annual_pct,'%','')::NUMERIC
           > REPLACE(c."CD Average Return (%)",'%','')::NUMERIC THEN 'SMH'
        ELSE                                                         'CD'
    END                                                         AS winner
FROM vti_annual_performance  v
JOIN smh_annual_performance  s ON v.year = s.year
JOIN investment_comparison   c ON v.year = c."Year"
ORDER BY v.year;

-- CD
WITH yearly_gain AS (
    SELECT
        "Year",
        "10k investment example CD"                                AS capital,
        "10k investment example CD"
            - LAG("10k investment example CD", 1, 10000::NUMERIC)
              OVER (ORDER BY "Year")                                AS yearly_profit
    FROM investment_comparison
)
SELECT
    "Year",
    '$' || TO_CHAR(capital,      'FM999,999.00') AS capital,
    '$' || TO_CHAR(yearly_profit,'FM999,999.00') AS yearly_gain,
    '$' || TO_CHAR(
        SUM(yearly_profit) OVER (ORDER BY "Year"),
        'FM999,999.00'
    )                                            AS cumulative_gain
FROM yearly_gain
ORDER BY "Year";

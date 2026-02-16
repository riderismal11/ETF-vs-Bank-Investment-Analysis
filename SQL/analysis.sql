-- Analysis report comparing ETFs and Bank investments

-- This SQL script generates comparison reports for ETF and Bank investment performance, allowing users to analyze the differences between both investment types.

-- Selecting average returns for ETFs
SELECT AVG(return) AS avg_etf_return
FROM etfs;

-- Selecting average returns for Bank investments
SELECT AVG(return) AS avg_bank_return
FROM bank_investments;

-- Generating a comparison report
SELECT
    (SELECT AVG(return) FROM etfs) AS avg_etf_return,
    (SELECT AVG(return) FROM bank_investments) AS avg_bank_return,
    (SELECT AVG(return) FROM etfs) - (SELECT AVG(return) FROM bank_investments) AS difference
WHERE (SELECT AVG(return) FROM etfs) - (SELECT AVG(return) FROM bank_investments) IS NOT NULL;
-- Analytical Queries for Investment Comparison

-- 1. Compare the average return of ETFs vs Banks
SELECT 
    AVG(etf_return) AS average_etf_return,
    AVG(bank_return) AS average_bank_return
FROM investments;

-- 2. Calculate the total investments in ETFs vs Banks
SELECT 
    SUM(etf_investment) AS total_etf_investment,
    SUM(bank_investment) AS total_bank_investment
FROM investments;

-- 3. Count the number of investment options available in ETFs vs Banks
SELECT 
    COUNT(DISTINCT etf_name) AS number_of_etf_options,
    COUNT(DISTINCT bank_name) AS number_of_bank_options
FROM investments;

-- 4. Identify the top performing ETF
SELECT 
    etf_name,
    MAX(etf_return) AS highest_return
FROM investments
GROUP BY etf_name
ORDER BY highest_return DESC
LIMIT 1;

-- 5. Identify the top performing Bank investment
SELECT 
    bank_name,
    MAX(bank_return) AS highest_return
FROM investments
GROUP BY bank_name
ORDER BY highest_return DESC
LIMIT 1;
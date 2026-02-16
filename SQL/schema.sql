-- ETF vs Bank Investment Analysis Database Schema
-- Created for comparative analysis of investment returns

-- Table for ETF data
CREATE TABLE IF NOT EXISTS etf_investments (
    etf_id INT PRIMARY KEY AUTO_INCREMENT,
    etf_name VARCHAR(100) NOT NULL,
    ticker_symbol VARCHAR(10) NOT NULL UNIQUE,
    creation_date DATE NOT NULL,
    expense_ratio DECIMAL(5, 3),
    fund_size DECIMAL(15, 2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table for Bank Investment data
CREATE TABLE IF NOT EXISTS bank_investments (
    bank_id INT PRIMARY KEY AUTO_INCREMENT,
    bank_name VARCHAR(100) NOT NULL,
    investment_type VARCHAR(50),
    interest_rate DECIMAL(5, 3),
    minimum_investment DECIMAL(12, 2),
    maturity_period INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table for ETF Performance Records
CREATE TABLE IF NOT EXISTS etf_performance (
    performance_id INT PRIMARY KEY AUTO_INCREMENT,
    etf_id INT NOT NULL,
    performance_date DATE NOT NULL,
    opening_price DECIMAL(10, 4),
    closing_price DECIMAL(10, 4),
    daily_return DECIMAL(8, 4),
    volume BIGINT,
    FOREIGN KEY (etf_id) REFERENCES etf_investments(etf_id),
    UNIQUE KEY unique_etf_date (etf_id, performance_date)
);

-- Table for Bank Investment Performance
CREATE TABLE IF NOT EXISTS bank_performance (
    bank_perf_id INT PRIMARY KEY AUTO_INCREMENT,
    bank_id INT NOT NULL,
    investment_date DATE NOT NULL,
    principal_amount DECIMAL(12, 2),
    interest_earned DECIMAL(12, 2),
    total_value DECIMAL(12, 2),
    FOREIGN KEY (bank_id) REFERENCES bank_investments(bank_id),
    UNIQUE KEY unique_bank_date (bank_id, investment_date)
);

-- Table for Comparison Analysis
CREATE TABLE IF NOT EXISTS investment_comparison (
    comparison_id INT PRIMARY KEY AUTO_INCREMENT,
    etf_id INT NOT NULL,
    bank_id INT NOT NULL,
    analysis_date DATE NOT NULL,
    etf_return_percentage DECIMAL(8, 4),
    bank_return_percentage DECIMAL(8, 4),
    difference DECIMAL(8, 4),
    FOREIGN KEY (etf_id) REFERENCES etf_investments(etf_id),
    FOREIGN KEY (bank_id) REFERENCES bank_investments(bank_id),
    UNIQUE KEY unique_comparison (etf_id, bank_id, analysis_date)
);

-- Create indexes for better query performance
CREATE INDEX idx_etf_ticker ON etf_investments(ticker_symbol);
CREATE INDEX idx_bank_name ON bank_investments(bank_name);
CREATE INDEX idx_etf_perf_date ON etf_performance(performance_date);
CREATE INDEX idx_bank_perf_date ON bank_performance(investment_date);
CREATE INDEX idx_comparison_date ON investment_comparison(analysis_date);
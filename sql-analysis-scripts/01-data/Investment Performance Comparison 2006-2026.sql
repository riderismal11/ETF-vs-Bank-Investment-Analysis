-- ================================================================
-- Based on your Excel files:
-- · Performance Certificates of Deposit USA Banks
-- · VTI ETF Performance
-- · SMH ETF Performance
-- · Investment Performance Comparison

-- Base investment example: $10,000
-- Period: 2006–2026 (21 years)
-- Average fixed CD rate: 3.92%
-- ================================================================


-- ================================================================
-- TABLA 1: cd_banks
-- Replica: hoja "Best US Banks Performance"
-- Los mejores bancos de CD en USA y su tasa anual
-- ================================================================
CREATE TABLE cd_banks (
    bank_name    TEXT    NOT NULL,
    annual_rate  NUMERIC(6,4) NOT NULL    -- 0.0505 = 5.05%
);

INSERT INTO cd_banks (bank_name, annual_rate) VALUES
    ('BMO Alto',                0.0505),
    ('Marcus by Goldman Sachs', 0.0450),
    ('SoFi',                    0.0450),
    ('Ally Bank',               0.0440),
    ('Capital One 360',         0.0430),
    ('American Express Bank',   0.0425),
    ('Discover Bank',           0.0420),
    ('Citibank',                0.0350),
    ('JPMorgan Chase',          0.0250),
    ('Wells Fargo',             0.0200);


-- ================================================================
-- TABLA 2: vti_annual_performance
-- Replica: hoja "VTI Evolución Anual de Precios"
-- Precio de apertura, cierre y rendimiento anual del ETF VTI
-- ================================================================
CREATE TABLE vti_annual_performance (
    year         INTEGER      NOT NULL,
    open_price   NUMERIC(10,2),          -- precio de apertura en $
    close_price  NUMERIC(10,2),          -- precio de cierre en $
    annual_pct   TEXT NOT NULL            -- rendimiento anual: '15.51%'
);

INSERT INTO vti_annual_performance (year, open_price, close_price, annual_pct) VALUES
    (2006, 55.03, 63.45, '15.51%'),
    (2007, 63.80, 66.38, '4.62%'),
    (2008, 66.82, 41.57, '-37.38%'),
    (2009, 42.66, 52.42, '26.10%'),
    (2010, 53.07, 60.34, '15.11%'),
    (2011, 61.42, 60.27, '-0.12%'),
    (2012, 61.27, 68.64, '13.88%'),
    (2013, 70.38, 90.14, '31.33%'),
    (2014, 91.95, 99.70, '10.60%'),
    (2015, 106.00, 98.52, '-1.18%'),
    (2016, 104.38, 108.87, '10.51%'),
    (2017, 110.45, 129.92, '19.33%'),
    (2018, 137.52, 122.76, '-5.51%'),
    (2019, 120.30, 158.00, '28.71%'),
    (2020, 163.76, 188.56, '19.34%'),
    (2021, 191.03, 233.55, '23.86%'),
    (2022, 240.50, 187.06, '-19.91%'),
    (2023, 188.59, 232.01, '24.03%'),
    (2024, 232.06, 266.01, '14.65%'),
    (2025, 266.30, 335.27, '26.04%'),
    (2026, 337.15, 336.65, '-1.15%');


-- ================================================================
-- TABLA 3: smh_annual_performance
-- Replica: hoja "SMH Evolución Anual de Precios"
-- Precio de apertura, cierre y rendimiento anual del ETF SMH
-- ================================================================
CREATE TABLE smh_annual_performance (
    year         INTEGER      NOT NULL,
    open_price   NUMERIC(10,2),
    close_price  NUMERIC(10,2),
    annual_pct   TEXT NOT NULL
);

INSERT INTO smh_annual_performance (year, open_price, close_price, annual_pct) VALUES
    (2006, 36.20, 34.50, '-4.70%'),
    (2007, 34.50, 33.10, '-4.05%'),
    (2008, 33.10, 13.90, '-58.00%'),
    (2009, 13.90, 27.50, '97.84%'),
    (2010, 27.50, 34.20, '24.36%'),
    (2011, 34.20, 31.50, '-7.89%'),
    (2012, 31.50, 38.35, '21.75%'),
    (2013, 38.35, 44.41, '15.80%'),
    (2014, 44.41, 55.45, '24.86%'),
    (2015, 55.45, 53.64, '-3.26%'),
    (2016, 53.64, 72.03, '34.28%'),
    (2017, 72.03, 105.77, '46.84%'),
    (2018, 105.77, 87.14, '-17.61%'),
    (2019, 87.89, 143.41, '64.57%'),
    (2020, 142.00, 219.52, '53.07%'),
    (2021, 221.43, 309.81, '41.13%'),
    (2022, 309.83, 201.75, '-34.88%'),
    (2023, 106.84, 175.75, '74.23%'),
    (2024, 175.76, 236.74, '34.70%'),
    (2025, 240.24, 360.13, '52.12%'),
    (2026, 368.96, 403.25, '11.97%');


-- ================================================================
-- TABLA 4: investment_comparison
-- Replica: hoja "Performance Comparison"
-- Comparación directa año a año de los 3 instrumentos +
-- capital acumulado desde $10,000 (igual que tus columnas E, F, G)
-- ================================================================
CREATE TABLE investment_comparison (
    "Year"                       INTEGER      NOT NULL,
    "VTI(ETF) % of Performance"  TEXT,
    "SMH(ETF) % of Performance"  TEXT,
    "CD Average Return (%)"      TEXT,
    "10k investment example VTI" NUMERIC(12,2),
    "10k investment example SMH" NUMERIC(12,2),
    "10k investment example CD"  NUMERIC(12,2)
);

INSERT INTO investment_comparison
    ("Year", "VTI(ETF) % of Performance", "SMH(ETF) % of Performance", "CD Average Return (%)", "10k investment example VTI", "10k investment example SMH", "10k investment example CD")
VALUES
    (2006, '15.51%', '-4.70%', '3.92%', 11551.00, 9530.00, 10392.00),
    (2007, '4.62%', '-4.05%', '3.92%', 12084.66, 9144.04, 10799.37),
    (2008, '-37.38%', '-58.00%', '3.92%', 7567.41, 3840.49, 11222.70),
    (2009, '26.10%', '97.84%', '3.92%', 9542.51, 7598.03, 11662.63),
    (2010, '15.11%', '24.36%', '3.92%', 10984.38, 9448.92, 12119.81),
    (2011, '-0.12%', '-7.89%', '3.92%', 10971.20, 8703.40, 12594.90),
    (2012, '13.88%', '21.75%', '3.92%', 12494.00, 10596.39, 13088.62),
    (2013, '31.33%', '15.80%', '3.92%', 16408.37, 12270.61, 13601.70),
    (2014, '10.60%', '24.86%', '3.92%', 18147.66, 15321.09, 14134.88),
    (2015, '-1.18%', '-3.26%', '3.92%', 17933.51, 14821.62, 14688.97),
    (2016, '10.51%', '34.28%', '3.92%', 19818.33, 19902.47, 15264.78),
    (2017, '19.33%', '46.84%', '3.92%', 23649.21, 29224.79, 15863.16),
    (2018, '-5.51%', '-17.61%', '3.92%', 22346.14, 24078.31, 16484.99),
    (2019, '28.71%', '64.57%', '3.92%', 28761.71, 39625.67, 17131.21),
    (2020, '19.34%', '53.07%', '3.92%', 34324.23, 60655.01, 17802.75),
    (2021, '23.86%', '41.13%', '3.92%', 42513.99, 85602.41, 18500.62),
    (2022, '-19.91%', '-34.88%', '3.92%', 34049.46, 55744.29, 19225.84),
    (2023, '24.03%', '74.23%', '3.92%', 42231.54, 97123.28, 19979.49),
    (2024, '14.65%', '34.70%', '3.92%', 48418.46, 130825.06, 20762.69),
    (2025, '26.04%', '52.12%', '3.92%', 61026.63, 199011.08, 21576.59),
    (2026, '-1.15%', '11.97%', '3.92%', 60324.82, 222832.71, 22422.39);

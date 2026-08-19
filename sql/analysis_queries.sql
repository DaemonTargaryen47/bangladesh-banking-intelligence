-- Bangladesh Banking Intelligence Dashboard
-- Portfolio Case Study | Synthetic Data
-- Compatible with SQLite (minor syntax changes may be needed in SQL Server/MySQL)

-- 1. Latest-year bank scorecard
SELECT
    bank,
    total_assets_crore,
    deposits_crore,
    loans_crore,
    net_profit_crore,
    npl_ratio_pct,
    roa_pct,
    roe_pct,
    capital_adequacy_pct,
    cost_to_income_pct,
    loan_to_deposit_pct
FROM bank_financials
WHERE year = (SELECT MAX(year) FROM bank_financials)
ORDER BY total_assets_crore DESC;

-- 2. Year-over-year asset growth
WITH x AS (
    SELECT *,
           LAG(total_assets_crore) OVER (PARTITION BY bank ORDER BY year) AS prev_assets
    FROM bank_financials
)
SELECT bank, year, total_assets_crore,
       ROUND((total_assets_crore / prev_assets - 1) * 100, 2) AS asset_growth_pct
FROM x
WHERE prev_assets IS NOT NULL
ORDER BY year, asset_growth_pct DESC;

-- 3. Profitability vs risk matrix
SELECT
    bank,
    year,
    roa_pct,
    roe_pct,
    npl_ratio_pct,
    cost_to_income_pct
FROM bank_financials
WHERE year = (SELECT MAX(year) FROM bank_financials)
ORDER BY roa_pct DESC;

-- 4. Banks with elevated asset-quality risk
SELECT bank, year, npl_ratio_pct, capital_adequacy_pct, loan_to_deposit_pct
FROM bank_financials
WHERE year = (SELECT MAX(year) FROM bank_financials)
  AND npl_ratio_pct >= 7
ORDER BY npl_ratio_pct DESC;

-- 5. Digital adoption growth
WITH x AS (
    SELECT *,
           LAG(digital_users) OVER (PARTITION BY bank ORDER BY year) AS prev_users
    FROM bank_financials
)
SELECT bank, year, digital_users,
       ROUND((digital_users * 1.0 / prev_users - 1) * 100, 2) AS digital_user_growth_pct
FROM x
WHERE prev_users IS NOT NULL
ORDER BY year DESC, digital_user_growth_pct DESC;

-- 6. Efficiency leaders
SELECT bank, year, cost_to_income_pct, profit_per_employee_bdt
FROM bank_financials
WHERE year = (SELECT MAX(year) FROM bank_financials)
ORDER BY cost_to_income_pct ASC;

-- 7. Portfolio-level trends
SELECT
    year,
    ROUND(SUM(total_assets_crore), 2) AS total_assets_crore,
    ROUND(SUM(deposits_crore), 2) AS total_deposits_crore,
    ROUND(SUM(loans_crore), 2) AS total_loans_crore,
    ROUND(SUM(net_profit_crore), 2) AS total_profit_crore,
    ROUND(AVG(npl_ratio_pct), 2) AS avg_npl_pct,
    ROUND(AVG(roa_pct), 2) AS avg_roa_pct,
    ROUND(AVG(cost_to_income_pct), 2) AS avg_cost_income_pct
FROM bank_financials
GROUP BY year
ORDER BY year;

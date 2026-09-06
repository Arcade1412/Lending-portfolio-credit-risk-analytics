-- =====================================================
-- Loan Risk Analytics
-- Data Validation Checks
-- =====================================================

USE loan_risk_analytics;

-- Total records
SELECT COUNT(*) AS total_loans
FROM loan_data;

-- Loan ID uniqueness
SELECT
    COUNT(*) AS total_rows,
    COUNT(DISTINCT loan_id) AS unique_loan_ids
FROM loan_data;

-- Missing values check
SELECT
    SUM(CASE WHEN loan_id IS NULL THEN 1 ELSE 0 END) AS missing_loan_id,
    SUM(CASE WHEN annual_income IS NULL THEN 1 ELSE 0 END) AS missing_income,
    SUM(CASE WHEN loan_status IS NULL THEN 1 ELSE 0 END) AS missing_status
FROM loan_data;

-- Loan Status Distribution
SELECT
    loan_status,
    COUNT(*) AS total_loans,
    ROUND(COUNT(*) * 100.0 /
          (SELECT COUNT(*) FROM loan_data),2) AS pct_share
FROM loan_data
GROUP BY loan_status
ORDER BY total_loans DESC;

-- Grade Distribution
SELECT
    grade,
    COUNT(*) AS total_loans
FROM loan_data
GROUP BY grade
ORDER BY total_loans DESC;
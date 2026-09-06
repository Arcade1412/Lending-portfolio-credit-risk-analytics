USE loan_risk_analytics;

-- =====================================================
-- PORTFOLIO SUMMARY VIEW
-- =====================================================

CREATE OR REPLACE VIEW vw_portfolio_summary AS
SELECT
    COUNT(*) AS total_loans,
    SUM(loan_amount) AS total_portfolio_value,
    AVG(loan_amount) AS avg_loan_amount,
    SUM(balance) AS total_outstanding_balance,
    SUM(paid_interest) AS total_interest_income,
    SUM(paid_principal) AS total_principal_paid
FROM loan_data;

-- =====================================================
-- LOAN STATUS SUMMARY VIEW
-- =====================================================

CREATE OR REPLACE VIEW vw_loan_status_summary AS
SELECT
    loan_status,
    COUNT(*) AS total_loans,
    ROUND(
        COUNT(*) * 100.0 /
        (SELECT COUNT(*) FROM loan_data),
        2
    ) AS portfolio_share_pct
FROM loan_data
GROUP BY loan_status;

-- =====================================================
-- GRADE RISK SUMMARY VIEW
-- =====================================================

CREATE OR REPLACE VIEW vw_grade_risk_summary AS
SELECT
    grade,
    COUNT(*) AS total_loans,
    SUM(CASE
            WHEN loan_status IN ('Late (16-30 days)','Late (31-120 days)','Charged Off')
            THEN 1 ELSE 0
        END) AS risky_loans,
    ROUND(
        100.0 *
        SUM(CASE
                WHEN loan_status IN ('Late (16-30 days)','Late (31-120 days)','Charged Off')
                THEN 1 ELSE 0
            END) / COUNT(*),
        2
    ) AS risk_rate_pct
FROM loan_data
GROUP BY grade;

-- =====================================================
-- INCOME RISK SUMMARY VIEW
-- =====================================================

CREATE OR REPLACE VIEW vw_income_risk_summary AS
SELECT
    income_band,
    COUNT(*) AS total_loans,
    SUM(CASE
            WHEN loan_status IN ('Late (16-30 days)','Late (31-120 days)','Charged Off')
            THEN 1 ELSE 0
        END) AS risky_loans,
    ROUND(
        100.0 *
        SUM(CASE
                WHEN loan_status IN ('Late (16-30 days)','Late (31-120 days)','Charged Off')
                THEN 1 ELSE 0
            END) / COUNT(*),
        2
    ) AS risk_rate_pct
FROM loan_data
GROUP BY income_band;

-- =====================================================
-- HOMEOWNERSHIP RISK SUMMARY VIEW
-- =====================================================

CREATE OR REPLACE VIEW vw_homeownership_risk_summary AS
SELECT
    homeownership,
    COUNT(*) AS total_loans,
    SUM(CASE
            WHEN loan_status IN ('Late (16-30 days)','Late (31-120 days)','Charged Off')
            THEN 1 ELSE 0
        END) AS risky_loans,
    ROUND(
        100.0 *
        SUM(CASE
                WHEN loan_status IN ('Late (16-30 days)','Late (31-120 days)','Charged Off')
                THEN 1 ELSE 0
            END) / COUNT(*),
        2
    ) AS risk_rate_pct
FROM loan_data
GROUP BY homeownership;

-- =====================================================
-- LOAN AMOUNT RISK SUMMARY VIEW
-- =====================================================

CREATE OR REPLACE VIEW vw_loan_amount_risk_summary AS
SELECT
    loan_amount_band,
    COUNT(*) AS total_loans,
    SUM(CASE
            WHEN loan_status IN ('Late (16-30 days)','Late (31-120 days)','Charged Off')
            THEN 1 ELSE 0
        END) AS risky_loans,
    ROUND(
        100.0 *
        SUM(CASE
                WHEN loan_status IN ('Late (16-30 days)','Late (31-120 days)','Charged Off')
                THEN 1 ELSE 0
            END) / COUNT(*),
        2
    ) AS risk_rate_pct
FROM loan_data
GROUP BY loan_amount_band;

-- =====================================================
-- EMPLOYMENT RISK SUMMARY VIEW
-- =====================================================

CREATE OR REPLACE VIEW vw_employment_risk_summary AS
SELECT
    emp_length,
    COUNT(*) AS total_loans,
    SUM(CASE
            WHEN loan_status IN ('Late (16-30 days)','Late (31-120 days)','Charged Off')
            THEN 1 ELSE 0
        END) AS risky_loans,
    ROUND(
        100.0 *
        SUM(CASE
                WHEN loan_status IN ('Late (16-30 days)','Late (31-120 days)','Charged Off')
                THEN 1 ELSE 0
            END) / COUNT(*),
        2
    ) AS risk_rate_pct
FROM loan_data
GROUP BY emp_length;

-- =====================================================
-- CREDIT UTILIZATION RISK SUMMARY VIEW
-- =====================================================

CREATE OR REPLACE VIEW vw_credit_utilization_risk_summary AS
SELECT
    credit_utilization_band,
    COUNT(*) AS total_loans,
    SUM(CASE
            WHEN loan_status IN ('Late (16-30 days)','Late (31-120 days)','Charged Off')
            THEN 1 ELSE 0
        END) AS risky_loans,
    ROUND(
        100.0 *
        SUM(CASE
                WHEN loan_status IN ('Late (16-30 days)','Late (31-120 days)','Charged Off')
                THEN 1 ELSE 0
            END) / COUNT(*),
        2
    ) AS risk_rate_pct
FROM loan_data
GROUP BY credit_utilization_band;

-- =====================================================
-- VERIFY ALL VIEWS
-- =====================================================

SHOW FULL TABLES
WHERE TABLE_TYPE = 'VIEW';
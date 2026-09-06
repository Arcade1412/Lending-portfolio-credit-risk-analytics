-- =====================================================
-- Loan Risk Analytics
-- Risk Analysis Queries
-- =====================================================

USE loan_risk_analytics;

-- Portfolio Summary
SELECT
    COUNT(*) AS total_loans,
    SUM(loan_amount) AS total_loan_amount,
    AVG(int_rate) AS avg_interest_rate,
    AVG(debt_to_income) AS avg_dti
FROM loan_data;

-- Risk by Grade
SELECT
    grade,
    COUNT(*) AS total_loans,
    SUM(CASE
            WHEN loan_status IN
            ('Charged Off',
             'Late (31-120 days)',
             'Late (16-30 days)')
            THEN 1
            ELSE 0
        END) AS risky_loans,
    ROUND(
        SUM(CASE
                WHEN loan_status IN
                ('Charged Off',
                 'Late (31-120 days)',
                 'Late (16-30 days)')
                THEN 1
                ELSE 0
            END) * 100.0 / COUNT(*),2
    ) AS risk_rate_pct
FROM loan_data
GROUP BY grade
ORDER BY risk_rate_pct DESC;

-- Risk by Income Band
SELECT
    income_band,
    COUNT(*) AS total_loans,
    SUM(CASE
            WHEN loan_status IN
            ('Charged Off',
             'Late (31-120 days)',
             'Late (16-30 days)')
            THEN 1
            ELSE 0
        END) AS risky_loans
FROM loan_data
GROUP BY income_band;

-- Risk by Home Ownership
SELECT
    homeownership,
    COUNT(*) AS total_loans,
    SUM(CASE
            WHEN loan_status IN
            ('Charged Off',
             'Late (31-120 days)',
             'Late (16-30 days)')
            THEN 1
            ELSE 0
        END) AS risky_loans
FROM loan_data
GROUP BY homeownership;

-- Risk by Employment Length
SELECT
    emp_length,
    COUNT(*) AS total_loans,
    SUM(CASE
            WHEN loan_status IN
            ('Charged Off',
             'Late (31-120 days)',
             'Late (16-30 days)')
            THEN 1
            ELSE 0
        END) AS risky_loans
FROM loan_data
GROUP BY emp_length
ORDER BY risky_loans DESC;

-- Risk by Loan Amount Band
SELECT
    loan_amount_band,
    COUNT(*) AS total_loans,
    SUM(CASE
            WHEN loan_status IN
            ('Charged Off',
             'Late (31-120 days)',
             'Late (16-30 days)')
            THEN 1
            ELSE 0
        END) AS risky_loans
FROM loan_data
GROUP BY loan_amount_band;

-- Risk by Credit Utilization
SELECT
    credit_utilization_band,
    COUNT(*) AS total_loans,
    SUM(CASE
            WHEN loan_status IN
            ('Charged Off',
             'Late (31-120 days)',
             'Late (16-30 days)')
            THEN 1
            ELSE 0
        END) AS risky_loans
FROM loan_data
GROUP BY credit_utilization_band;
USE loan_risk_analytics;

-- =====================================================
-- ADVANCED RISK ANALYSIS
-- =====================================================

-- =====================================================
-- 1. RISK BY LOAN PURPOSE
-- =====================================================

SELECT
    loan_purpose,
    COUNT(*) AS total_loans,
    SUM(
        CASE
            WHEN loan_status IN (
                'Charged Off',
                'Late (31-120 days)',
                'Late (16-30 days)'
            )
            THEN 1 ELSE 0
        END
    ) AS risky_loans,
    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN loan_status IN (
                    'Charged Off',
                    'Late (31-120 days)',
                    'Late (16-30 days)'
                )
                THEN 1 ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS risk_rate_pct
FROM loan_data
GROUP BY loan_purpose
HAVING COUNT(*) >= 50
ORDER BY risk_rate_pct DESC;


-- =====================================================
-- 2. RISK BY SUB GRADE
-- =====================================================

SELECT
    sub_grade,
    COUNT(*) AS total_loans,
    SUM(
        CASE
            WHEN loan_status IN (
                'Charged Off',
                'Late (31-120 days)',
                'Late (16-30 days)'
            )
            THEN 1 ELSE 0
        END
    ) AS risky_loans,
    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN loan_status IN (
                    'Charged Off',
                    'Late (31-120 days)',
                    'Late (16-30 days)'
                )
                THEN 1 ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS risk_rate_pct
FROM loan_data
GROUP BY sub_grade
HAVING COUNT(*) >= 30
ORDER BY risk_rate_pct DESC;


-- =====================================================
-- 3. RISK BY VERIFICATION STATUS
-- =====================================================

SELECT
    verified_income,
    COUNT(*) AS total_loans,
    SUM(
        CASE
            WHEN loan_status IN (
                'Charged Off',
                'Late (31-120 days)',
                'Late (16-30 days)'
            )
            THEN 1 ELSE 0
        END
    ) AS risky_loans,
    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN loan_status IN (
                    'Charged Off',
                    'Late (31-120 days)',
                    'Late (16-30 days)'
                )
                THEN 1 ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS risk_rate_pct
FROM loan_data
GROUP BY verified_income
ORDER BY risk_rate_pct DESC;


-- =====================================================
-- 4. RISK BY APPLICATION TYPE
-- =====================================================

SELECT
    application_type,
    COUNT(*) AS total_loans,
    SUM(
        CASE
            WHEN loan_status IN (
                'Charged Off',
                'Late (31-120 days)',
                'Late (16-30 days)'
            )
            THEN 1 ELSE 0
        END
    ) AS risky_loans,
    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN loan_status IN (
                    'Charged Off',
                    'Late (31-120 days)',
                    'Late (16-30 days)'
                )
                THEN 1 ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS risk_rate_pct
FROM loan_data
GROUP BY application_type
ORDER BY risk_rate_pct DESC;


-- =====================================================
-- 5. RISK BY STATE
-- =====================================================

SELECT
    state,
    COUNT(*) AS total_loans,
    SUM(
        CASE
            WHEN loan_status IN (
                'Charged Off',
                'Late (31-120 days)',
                'Late (16-30 days)'
            )
            THEN 1 ELSE 0
        END
    ) AS risky_loans,
    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN loan_status IN (
                    'Charged Off',
                    'Late (31-120 days)',
                    'Late (16-30 days)'
                )
                THEN 1 ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS risk_rate_pct
FROM loan_data
GROUP BY state
HAVING COUNT(*) >= 50
ORDER BY risk_rate_pct DESC;


-- =====================================================
-- 6. TOP RISK BORROWER SEGMENTS
-- =====================================================

SELECT
    grade,
    income_band,
    homeownership,
    COUNT(*) AS total_loans,
    SUM(
        CASE
            WHEN loan_status IN (
                'Charged Off',
                'Late (31-120 days)',
                'Late (16-30 days)'
            )
            THEN 1 ELSE 0
        END
    ) AS risky_loans,
    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN loan_status IN (
                    'Charged Off',
                    'Late (31-120 days)',
                    'Late (16-30 days)'
                )
                THEN 1 ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS risk_rate_pct
FROM loan_data
GROUP BY
    grade,
    income_band,
    homeownership
HAVING COUNT(*) >= 30
ORDER BY risk_rate_pct DESC
LIMIT 15;
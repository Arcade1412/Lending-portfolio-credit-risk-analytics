# Feature Engineering Documentation

## Objective

The objective of feature engineering was to transform raw lending data into business-friendly analytical dimensions that can be used for portfolio analysis, risk assessment, borrower segmentation, and dashboard development.

---

## Features Created

### 1. Income Band

Purpose:
Segment borrowers based on annual income.

Categories:
- Low Income
- Middle Income
- High Income
- Very High Income

Business Use:
Helps identify which income groups contribute most to lending volume and risk.

---

### 2. Loan Amount Band

Purpose:
Categorize loans by size.

Categories:
- Small Loan
- Medium Loan
- Large Loan
- Very Large Loan

Business Use:
Used to analyze portfolio exposure by loan size.

---

### 3. Risk Segment

Purpose:
Convert loan grades into simplified business risk categories.

Mapping:
- A-B → Low Risk
- C-D → Medium Risk
- E-G → High Risk

Business Use:
Allows management to evaluate portfolio risk distribution quickly.

---

### 4. Credit Utilization Percentage

Formula:

Total Credit Utilized / Total Credit Limit

Portfolio Average:
40.31%

Business Use:
Measures borrower leverage and potential credit stress.

---

### 5. Credit Utilization Band

Categories:
- Low Utilization
- Moderate Utilization
- High Utilization
- Very High Utilization

Business Use:
Identifies borrowers with elevated credit exposure.

---

### 6. Delinquency Flag

Categories:
- Good Standing
- Has Delinquency History

Distribution:
- Good Standing: 8,312
- Has Delinquency History: 1,664

Business Use:
Separates healthy borrowers from potentially risky borrowers.

---

### 7. Repayment Ratio

Formula:

Paid Total / Loan Amount

Portfolio Average:
16.06%

Business Use:
Measures repayment progress across the portfolio.

---

### 8. Repayment Band

Categories:
- Early Stage
- Partial Repayment
- Advanced Repayment
- Fully Recovered

Distribution:
- Early Stage: 9,387
- Partial Repayment: 77
- Advanced Repayment: 64
- Fully Recovered: 448

Business Use:
Tracks repayment maturity across loans.

---

## Outcome

The raw dataset was transformed into a business-ready analytical dataset suitable for SQL analysis and Power BI dashboard development.

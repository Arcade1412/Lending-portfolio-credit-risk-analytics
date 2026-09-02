# Data Cleaning Summary

## Cleaning Actions Performed

### Removed Non-Business Column

| Column |
|----------|
| Unnamed: 0 |

Reason:
Auto-generated index column with no analytical value.

---

### Removed Invalid Records

Condition:

annual_income = 0

Records Removed:

24

Reason:

Annual income is a key variable for affordability and lending analysis. Records with zero income represented only 0.24% of the portfolio and were removed to improve analytical reliability.

---

### Missing Value Treatment

| Column | Action |
|----------|----------|
| emp_title | Replaced blanks with "Unknown" |

Reason:

Retained portfolio records while preserving employment category analysis.

---

## Cleaning Result

- Original Records: 10,000
- Records Removed: 24
- Final Records: 9,976

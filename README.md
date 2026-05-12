# RideIQ — Uber Product Analytics

> Simulating a Senior Product Analyst role at Uber — analyzing 200,000+ rides across New York City to diagnose 3 critical business problems using SQL, Python, and Power BI.

![Python](https://img.shields.io/badge/Python-3.10-blue?style=flat-square&logo=python) ![SQL](https://img.shields.io/badge/SQL-PostgreSQL-336791?style=flat-square&logo=postgresql) ![PowerBI](https://img.shields.io/badge/Power%20BI-Dashboard-F2C811?style=flat-square&logo=powerbi) ![Status](https://img.shields.io/badge/Status-Complete-brightgreen?style=flat-square)

---

## The Problem

Uber's New York operations show a concerning pattern — **8 in 10 riders never return after their first month**. Meanwhile, 28% of booked rides never complete, and surge pricing may be driving away demand rather than maximizing revenue.

This project investigates all three problems end-to-end — from raw data to business recommendations.

---

## Business Problems & Impact

| # | Problem | Metric | Business Impact |
|---|---------|--------|----------------|
| 1 | Rider retention drop | D7: 34%, D30: 19% | ₹2.16Cr/month CAC waste |
| 2 | Cancellation funnel leakage | 28% rides cancelled | ₹2.3Cr/month GMV loss |
| 3 | Surge pricing kills demand | 22% demand drop at 2x | Revenue vs retention tradeoff |

---

## Key Findings

- **Peak demand** — Friday 7 PM peaks at 1,999 rides/hour
- **Retention crisis** — Only 19% of riders active after 30 days; 81% lost within a month
- **Cancellation pattern** — 6 AM has the lowest ride completion rate (81%)
- **Fare range** — Average fare falls in $10–$15 (Medium Surge) across all hours
- **Rider segments** — 3 distinct segments identified: Low, Mid, and High value riders

---

## Business Recommendations

| Problem | Recommendation |
|---------|---------------|
| Retention | Target D7 churned riders with ₹60 discount voucher via push notification |
| Cancellation | Penalize repeat post-match cancellers — warning after 3 cancellations |
| Surge | A/B test surge cap at 1.5x in 2 cities for 30 days — measure GMV vs demand |

---

## Tech Stack

| Tool | Purpose |
|------|---------|
| Python (Pandas, Matplotlib, Seaborn, Scikit-learn) | Cleaning, EDA, A/B testing, segmentation |
| SQL (PostgreSQL) | Funnel analysis, cohort retention, LTV, surge revenue |
| Power BI (DAX) | Executive dashboard — 3 pages, 5 DAX measures |

---

## Project Structure

```
rideiq-uber-analytics/
├── data/
│   ├── raw/                  ← Original Kaggle dataset
│   └── cleaned/              ← Processed dataset (195,065 rows)
├── notebooks/
│   ├── 01_data_cleaning.ipynb
│   ├── 02_eda.ipynb
│   ├── 03_ab_test.ipynb
│   └── 04_segmentation.ipynb
├── sql/
│   ├── 01_funnel.sql
│   ├── 02_retention_cohort.sql
│   ├── 03_ltv.sql
│   ├── 04_cancellation.sql
│   ├── 05_supply_demand.sql
│   └── 06_surge_revenue.sql
├── dashboard/
│   └── uber_dashboard.pbix
└── problem_statement.md
```

---

## Notebooks

| Notebook | Description |
|----------|-------------|
| 01_data_cleaning.ipynb | Cleaned 200K rows — removed 4,935 invalid records, fixed data types, engineered time features |
| 02_eda.ipynb | 8+ visualizations — hourly demand, fare distribution, day-of-week patterns, cohort heatmap |
| 03_ab_test.ipynb | Simulated surge cap A/B test — Z-test, p-value: 0.46 |
| 04_segmentation.ipynb | KMeans clustering (k=3) — Low, Mid, High value rider segments |

---

## SQL Queries

| File | Analysis |
|------|----------|
| 01_funnel.sql | Ride completion funnel by hour |
| 02_retention_cohort.sql | Monthly cohort retention using window functions |
| 03_ltv.sql | Rider lifetime value by passenger segment |
| 04_cancellation.sql | Cancellation rate analysis by hour |
| 05_supply_demand.sql | Peak demand hours by day of week |
| 06_surge_revenue.sql | Revenue and surge level classification by hour |

---

## Dataset

| Property | Value |
|----------|-------|
| Source | Uber Fares Dataset — Kaggle |
| Raw rows | 200,000 |
| Cleaned rows | 195,065 |
| Columns | 11 (after feature engineering) |
| Location | New York City |
| Period | 2009–2015 |

---

*Built by Aditya Sharma · [LinkedIn](https://linkedin.com/in/your-profile) · [GitHub](https://github.com/aditya-datahub)*

# RideIQ — Uber Product Analytics

> Simulating a Product Analyst role at Uber — analyzing 200,000+ rides to solve 3 core business problems using SQL, Python, and Power BI.

---

## Business Problems

| # | Problem | Impact |
|---|---------|--------|
| 1 | Rider retention drop — D7 only 34% | ₹2.16Cr/month CAC waste |
| 2 | Cancellation funnel leakage — 28% rides cancel | ₹2.3Cr/month GMV loss |
| 3 | Surge pricing impact — demand drops 22% at 2x | Revenue vs demand tradeoff |

---

## Tech Stack

| Tool | Purpose |
|------|---------|
| Python | Data cleaning, EDA, A/B testing, KMeans segmentation |
| SQL (PostgreSQL) | Funnel analysis, cohort retention, LTV, surge revenue |
| Power BI | Executive dashboard — 3 pages, 5 DAX measures |

---

## Project Structure

rideiq-uber-analytics/
├── data/               — raw and cleaned datasets
├── notebooks/          — 4 Python notebooks
├── sql/                — 6 SQL query files
├── dashboard/          — Power BI .pbix file
└── problem_statement.md

---

## Key Findings

- **Peak demand** — Friday 7 PM has highest rides (1,999 rides/hour)
- **Retention** — D7 retention at 34%, D30 at 19% — 8 in 10 riders lost within a month
- **Cancellation** — Hour 6 AM has lowest completion rate (81%)
- **Surge** — All hours fall in Medium Surge range ($10–$15 avg fare)
- **Segmentation** — 3 rider segments identified — Low, Mid, High value

---

## Business Recommendations

1. **Retention** — Target riders who haven't returned in 7 days with ₹60 discount voucher
2. **Cancellation** — Reduce post-match cancellations by penalizing repeat cancellers
3. **Surge** — Run real A/B test in 2 cities — cap surge at 1.5x for 30 days

---

## Notebooks

| Notebook | Description |
|----------|-------------|
| 01_data_cleaning.ipynb | Cleaned 200K rows — removed 4,935 invalid records |
| 02_eda.ipynb | 8+ visualizations — hourly demand, fare distribution, cohort heatmap |
| 03_ab_test.ipynb | Surge cap A/B test — Z-test, p-value 0.46 |
| 04_segmentation.ipynb | KMeans clustering — Low, Mid, High value riders |

---

## SQL Queries

| File | Analysis |
|------|----------|
| 01_funnel.sql | Ride completion funnel by hour |
| 02_retention_cohort.sql | Monthly cohort retention with window functions |
| 03_ltv.sql | Rider lifetime value by passenger segment |
| 04_cancellation.sql | Cancellation rate by hour |
| 05_supply_demand.sql | Peak demand hours by day |
| 06_surge_revenue.sql | Revenue and surge level by hour |

---

*Dataset: Uber Fares Dataset — Kaggle | Rows: 195,065 | Tools: Python, PostgreSQL, Power BI*

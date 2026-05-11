# RideIQ — Problem Statement
**Project:** RideIQ Uber Product Analytics
**Role simulated:** Product Analyst, Rides & Growth Team
**Data source:** Uber Fares Dataset (Kaggle) + simulated user/event tables

---

## Business context

Uber's India rides business processes over 4 million trips per day across 20+ cities. Despite strong top-of-funnel growth (~1.2L new riders per month), the growth team has flagged three persistent problems that are quietly eroding revenue and long-term rider LTV.

---

## Problem 1 — Rider retention drop

**Observation:** Only 34% of new riders return within 7 days (D7). By Day 30, retention falls to 19%.

**Business impact:** At an average CAC of ₹180 per rider and 1.2L new riders/month, poor retention is burning ₹2.16Cr/month in acquisition spend that never converts to long-term value.

**Key questions:**
- Which rider cohorts show the lowest retention?
- What is the average number of rides before a rider goes dormant?
- Does first-ride experience predict long-term retention?

---

## Problem 2 — Cancellation funnel leakage

**Observation:** Overall cancellation rate is 28%. Of all cancellations, 41% happen after a driver has already been matched.

**Business impact:** An estimated ₹2.3Cr in potential GMV is lost monthly due to post-match cancellations.

**Key questions:**
- At which funnel step is drop-off the highest?
- Is cancellation higher during surge hours?
- Which cities have the worst cancellation rates?

---

## Problem 3 — Surge pricing impact (A/B test)

**Observation:** Ride demand drops ~22% when surge exceeds 2x.

**Experiment:** A/B test — surge capped at 1.5x vs standard surge.

**Key questions:**
- What is the revenue-demand tradeoff at different surge multipliers?
- Does a 1.5x surge cap reduce cancellations?
- Which rider segments are most price-sensitive?

---

## Success metrics

| Metric | Current | Target |
|--------|---------|--------|
| D7 rider retention | 34% | 42% |
| D30 rider retention | 19% | 26% |
| Post-match cancellation rate | 41% | 30% |
| Overall cancellation rate | 28% | 20% |
| GMV per rider (monthly) | ₹340 | ₹410 |

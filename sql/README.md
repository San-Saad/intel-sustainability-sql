# SQL Query Guide

This folder contains the SQL queries used in the Intel Sustainability SQL Analysis project.

## Query Files

| File | Purpose |
| --- | --- |
| `01_join_and_age_buckets.sql` | Joins device and impact data, then creates device age cohorts |
| `02_overall_impact.sql` | Calculates overall device count, average age, energy savings, and CO2 savings |
| `03_segment_analysis.sql` | Segments sustainability impact by device type, age bucket, and region |
| `04_repurposing_strategy.sql` | Calculates regional percentage contributions by device type |

## Assumed Tables

```text
intel.device_data
intel.impact_data
```

The queries assume both tables share a `device_id` field.

# Intel Sustainability SQL Analysis

## Overview

This project analyzes the environmental impact of repurposed computing devices using SQL. The goal is to evaluate how repurposing laptops and desktops contributes to energy savings and CO2 emission reductions across different regions.

The analysis joins Intel device inventory data with environmental impact data, creates device age cohorts, calculates sustainability impact, and identifies strategies to maximize environmental benefits.

This project demonstrates how SQL can be used to support sustainability analytics and business decision-making.

---

# Business Question

How can Intel prioritize device repurposing efforts to maximize energy savings and CO2 reduction?

The SQL analysis supports this question by answering:

- How many devices were repurposed?
- What is the overall energy and CO2 impact?
- Which device types generate the strongest sustainability outcomes?
- How does device age affect energy and CO2 savings?
- Which regions produce the highest environmental benefit?
- How should repurposing strategy be prioritized by region and device type?

---

# Tools Used

| Tool | Purpose |
| --- | --- |
| SQL | Data joining, aggregation, segmentation, and analysis |
| Relational database schema | Source tables organized under the `intel` schema |
| GitHub | Version control and portfolio documentation |
| PDF report | Written analysis and interpretation of SQL results |

---

# Dataset Description

Two datasets were used for this analysis.

## `intel.device_data`

Contains information about repurposed devices.

| Column | Description |
| --- | --- |
| `device_id` | Unique identifier for each device |
| `device_type` | Type of device, such as laptop or desktop |
| `model_year` | Year the device was manufactured |

## `intel.impact_data`

Contains environmental impact metrics for each device.

| Column | Description |
| --- | --- |
| `impact_id` | Unique identifier for the impact record |
| `device_id` | Links the impact record to a device |
| `usage_purpose` | Purpose of the repurposed device |
| `power_consumption` | Power consumption in watts |
| `energy_savings_yr` | Estimated yearly energy savings in kWh |
| `co2_saved_kg_yr` | CO2 emissions saved per year in kg |
| `recycling_rate` | Percentage of device material that can be recycled |
| `region` | Geographic region where the device is used |

Primary join key:

```sql
device_id
```

---

# Project Workflow

The project is organized into four SQL tasks.

---

## 1. Data Preparation

The first query joins `intel.device_data` and `intel.impact_data` using `device_id`.

It also creates:

- `device_age`
- `device_age_bucket`

Device age buckets:

- `newer`: 0-3 years old
- `mid-age`: 4-6 years old
- `older`: more than 6 years old

SQL file:

[sql/01_join_and_age_buckets.sql](sql/01_join_and_age_buckets.sql)

---

## 2. Overall Impact Analysis

The second query calculates high-level sustainability impact.

Key results:

- Total devices repurposed: **601,740**
- Average device age: **3.52 years**
- Average energy savings per device: **25.74 kWh**
- Total CO2 saved: **6,768 tons**

Environmental impact equivalent:

- Powering approximately **1,420 U.S. households for one year**
- Removing approximately **1,470 cars from the road**

SQL file:

[sql/02_overall_impact.sql](sql/02_overall_impact.sql)

---

## 3. Device, Age, and Regional Analysis

The third query segments sustainability impact across device type, age bucket, and region.

### Device Type Findings

| Device Type | Total Devices | Avg Energy Savings | Avg CO2 Saved |
| --- | --- | --- | --- |
| Desktop | 193,676 | ~25.62 kWh | ~0.01119 tons |
| Laptop | 408,064 | ~25.80 kWh | ~0.01128 tons |

Key insight:

- Laptops slightly outperform desktops in energy and CO2 savings.
- Laptops also represent the majority of repurposed devices.

### Device Age Findings

| Age Group | Total Devices | Avg Energy Savings | Avg CO2 Saved |
| --- | --- | --- | --- |
| Newer | 317,191 | ~19 kWh | ~0.0083 tons |
| Mid-Age | 264,310 | ~32 kWh | ~0.014 tons |
| Older | 20,239 | ~48 kWh | ~0.021 tons |

Key insight:

- Older devices generate the most savings per device.
- Mid-age devices are the most commonly repurposed.

### Regional Findings

| Region | Total Devices | Avg Energy Savings | Avg CO2 Saved |
| --- | --- | --- | --- |
| Asia | 192,881 | ~25.79 kWh | ~0.0155 tons |
| Europe | 109,381 | ~25.75 kWh | ~0.0064 tons |
| North America | 299,478 | ~25.71 kWh | ~0.0103 tons |

Key insights:

- North America repurposes the most devices.
- Asia achieves the highest CO2 savings per device.
- Regions with higher carbon intensity can produce greater environmental benefit from repurposing.

SQL file:

[sql/03_segment_analysis.sql](sql/03_segment_analysis.sql)

---

## 4. Repurposing Strategy Optimization

The fourth query calculates each device type's percentage contribution to regional energy savings and CO2 savings.

Strategy findings:

- Laptops account for approximately **68%** of total energy and CO2 savings.
- Desktops account for approximately **32%** of total savings.

Recommended strategy:

1. Prioritize repurposing laptops due to their higher total environmental impact.
2. Focus on Asia and North America, where impact potential is highest.
3. Add cost-per-device metrics in future analysis to maximize sustainability per dollar spent.

SQL file:

[sql/04_repurposing_strategy.sql](sql/04_repurposing_strategy.sql)

---

# Analysis Report

The written analysis is available here:

[reports/intel-sustainability-analysis.pdf](reports/intel-sustainability-analysis.pdf)

---

# Key SQL Concepts Demonstrated

This project demonstrates:

- `JOIN` operations across related tables
- Derived columns
- `CASE` statements for cohort creation
- Aggregation with `COUNT`, `AVG`, and `SUM`
- Grouped analysis by categorical fields
- Common table expressions
- Percentage-of-total calculations
- Translating SQL output into business recommendations

---

# Skills Demonstrated

- SQL querying
- Data transformation
- Data aggregation
- Sustainability analytics
- Environmental impact analysis
- Business question framing
- Analytical reporting
- GitHub project organization
- Technical documentation

---

# Repository Structure

```text
intel-sustainability-sql/
|-- sql/
|   |-- 01_join_and_age_buckets.sql
|   |-- 02_overall_impact.sql
|   |-- 03_segment_analysis.sql
|   `-- 04_repurposing_strategy.sql
|-- reports/
|   `-- intel-sustainability-analysis.pdf
|-- .gitignore
`-- README.md
```

---

# Status

Version 1 is complete.

Future improvements:

- Add screenshots of query output
- Add a data dictionary if the dataset can be shared
- Convert the PDF findings into a Markdown report
- Add cost-per-device analysis for sustainability ROI

---

# Author

San Saad

[GitHub](https://github.com/San-Saad)

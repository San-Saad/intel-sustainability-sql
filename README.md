# intel-sustainability-sql
Drove a SQL-based sustainability analysis for Intel by joining device and impact data, engineering age cohorts, and segmenting by type and region to quantify energy and CO₂ savings, ultimately delivering insights that guided repurposing initiatives.

## Overview
This project analyzes the environmental impact of repurposed computing devices using SQL data analysis. The goal is to evaluate how repurposing laptops and desktops contributes to energy savings and CO₂ emission reductions across different regions.

The analysis combines two datasets to measure sustainability impact and identify strategies to maximize environmental benefits.

This project demonstrates skills in:

- SQL Joins
- Data Transformation
- Data Aggregation
- Sustainability Analytics
- Environmental Impact Analysis

---

# Dataset Description

Two datasets were used for this analysis.

## intel.device_data
Contains information about repurposed devices.

| Column | Description |
|------|------|
| device_id | Unique identifier for each device |
| device_type | Type of device (Laptop or Desktop) |
| model_year | Year the device was manufactured |

## intel.impact_data
Contains environmental impact metrics for each device.

| Column | Description |
|------|------|
| impact_id | Unique identifier for the impact record |
| device_id | Links the impact record to a device |
| usage_purpose | Purpose of the repurposed device |
| power_consumption | Power consumption in watts |
| energy_savings_yr | Estimated yearly energy savings (kWh) |
| co2_saved_kg_yr | CO₂ emissions saved per year (kg) |
| recycling_rate | Percentage of device that can be recycled |
| region | Geographic region where the device is used |

---

# Project Tasks

## Task 1 – Data Preparation

### Join Device and Impact Data
The first step joined the `intel.device_data` and `intel.impact_data` tables using `device_id` to create a unified dataset containing device specifications and environmental impact metrics.

### Add Device Age Column
A new column called `device_age` was created to determine how old each device is.
device_age = current_year - model_year


This helps identify which devices are being repurposed and how device age influences environmental impact.

### Add Device Age Bucket
Devices were grouped into age categories:

- Newer Devices
- Mid-Age Devices
- Older Devices

This allows easier analysis of energy savings and CO₂ reduction by device age group.

---

# Task 2 – Overall Impact Analysis

Key results from the aggregated dataset:

- Total Devices Repurposed: **601,740**
- Average Device Age: **3.52 years**
- Average Energy Savings Per Device: **25.74 kWh**
- Total CO₂ Saved: **6,768 tons**

Environmental impact equivalent:

- Powering approximately **1,420 U.S. households for one year**
- Removing approximately **1,470 cars from the road**

These results highlight how repurposing devices significantly reduces energy consumption and greenhouse gas emissions.

---

# Task 3 – Device Analysis

## Device Type Analysis

| Device Type | Total Devices | Avg Energy Savings | Avg CO₂ Saved |
|------|------|------|------|
| Desktop | 193,676 | ~25.62 kWh | ~0.01119 tons |
| Laptop | 408,064 | ~25.80 kWh | ~0.01128 tons |

Key insight:
- Laptops slightly outperform desktops in energy and CO₂ savings.
- Repurposing laptops avoids higher emissions associated with manufacturing new laptops.

---

## Device Age Analysis

| Age Group | Total Devices | Avg Energy Savings | Avg CO₂ Saved |
|------|------|------|------|
| Newer | 317,191 | ~19 kWh | ~0.0083 tons |
| Mid-Age | 264,310 | ~32 kWh | ~0.014 tons |
| Older | 20,239 | ~48 kWh | ~0.021 tons |

Key insight:
- **Older devices generate the most savings per device**, but fewer are repurposed.
- **Mid-age devices are the most commonly repurposed.**

---

# Regional Analysis

| Region | Total Devices | Avg Energy Savings | Avg CO₂ Saved |
|------|------|------|------|
| Asia | 192,881 | ~25.79 kWh | ~0.0155 tons |
| Europe | 109,381 | ~25.75 kWh | ~0.0064 tons |
| North America | 299,478 | ~25.71 kWh | ~0.0103 tons |

Key insights:

- North America repurposes the most devices.
- Asia achieves the **highest CO₂ savings per device**.
- Repurposing devices in regions with higher carbon intensity results in greater environmental benefits.

---

# Task 4 – Repurposing Strategy Optimization

Based on the analysis:

- Laptops account for **~68% of total energy and CO₂ savings**
- Desktops account for **~32% of total savings**

Recommended strategy:

1. Prioritize repurposing **laptops** due to higher environmental impact.
2. Focus on **Asia and North America**, where impact potential is highest.
3. Introduce **cost-per-device metrics** to maximize sustainability per dollar spent.

---

# Tools Used

- SQL
- Data Aggregation
- Data Analysis
- Sustainability Impact Metrics

---

# Key Takeaways

This analysis demonstrates how data analytics can be used to evaluate sustainability programs. Repurposing computing devices can significantly reduce energy consumption, lower carbon emissions, and extend the lifecycle of technology.

Strategic repurposing focused on laptops and high-impact regions can further maximize environmental benefits.

---

# Author

San Saad 

Cybersecurity | Data Analytics | Sustainability Technology

--Optimizing Repurposing Strategy

WITH regional_totals AS (
    SELECT region,
           SUM(energy_savings_yr) AS total_energy_savings,
           SUM(co2_saved_kg_yr) AS total_co2_saved
    FROM intel.device_data d
    JOIN intel.impact_data i ON d.device_id = i.device_id
    GROUP BY region
)
SELECT i.region,
       d.device_type,
       COUNT(*) AS total_devices,
       AVG(i.energy_savings_yr) AS avg_energy_savings_kwh,
       AVG(i.co2_saved_kg_yr)/1000 AS avg_co2_saved_tons,
       SUM(i.energy_savings_yr) / rt.total_energy_savings * 100 AS pct_energy_savings_by_type,
       SUM(i.co2_saved_kg_yr) / rt.total_co2_saved * 100 AS pct_co2_savings_by_type
FROM intel.device_data d
JOIN intel.impact_data i ON d.device_id = i.device_id
JOIN regional_totals rt ON i.region = rt.region
GROUP BY i.region, d.device_type, rt.total_energy_savings, rt.total_co2_saved;
-- Task 4: Compare device type contributions within each region to support
-- repurposing strategy recommendations.

WITH regional_totals AS (
    SELECT
        i.region,
        SUM(i.energy_savings_yr) AS total_energy_savings,
        SUM(i.co2_saved_kg_yr) AS total_co2_saved
    FROM intel.device_data AS d
    INNER JOIN intel.impact_data AS i
        ON d.device_id = i.device_id
    GROUP BY
        i.region
)
SELECT
    i.region,
    d.device_type,
    COUNT(*) AS total_devices,
    AVG(i.energy_savings_yr) AS avg_energy_savings_kwh,
    AVG(i.co2_saved_kg_yr) / 1000 AS avg_co2_saved_tons,
    SUM(i.energy_savings_yr) / NULLIF(rt.total_energy_savings, 0) * 100 AS pct_energy_savings_by_type,
    SUM(i.co2_saved_kg_yr) / NULLIF(rt.total_co2_saved, 0) * 100 AS pct_co2_savings_by_type
FROM intel.device_data AS d
INNER JOIN intel.impact_data AS i
    ON d.device_id = i.device_id
INNER JOIN regional_totals AS rt
    ON i.region = rt.region
GROUP BY
    i.region,
    d.device_type,
    rt.total_energy_savings,
    rt.total_co2_saved
ORDER BY
    i.region,
    pct_energy_savings_by_type DESC;

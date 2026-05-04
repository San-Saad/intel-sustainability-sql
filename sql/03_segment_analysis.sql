-- Task 3A: Analyze sustainability impact by device type.

SELECT
    d.device_type,
    COUNT(*) AS total_devices,
    AVG(i.energy_savings_yr) AS avg_energy_savings_kwh,
    AVG(i.co2_saved_kg_yr) / 1000 AS avg_co2_saved_tons
FROM intel.device_data AS d
INNER JOIN intel.impact_data AS i
    ON d.device_id = i.device_id
GROUP BY
    d.device_type
ORDER BY
    avg_energy_savings_kwh DESC;


-- Task 3B: Analyze sustainability impact by device age bucket.

WITH device_age_buckets AS (
    SELECT
        d.device_id,
        i.energy_savings_yr,
        i.co2_saved_kg_yr,
        CASE
            WHEN 2024 - d.model_year <= 3 THEN 'newer'
            WHEN 2024 - d.model_year <= 6 THEN 'mid-age'
            ELSE 'older'
        END AS device_age_bucket
    FROM intel.device_data AS d
    INNER JOIN intel.impact_data AS i
        ON d.device_id = i.device_id
)
SELECT
    device_age_bucket,
    COUNT(*) AS total_devices,
    AVG(energy_savings_yr) AS avg_energy_savings_kwh,
    AVG(co2_saved_kg_yr) / 1000 AS avg_co2_saved_tons
FROM device_age_buckets
GROUP BY
    device_age_bucket
ORDER BY
    avg_energy_savings_kwh DESC;


-- Task 3C: Analyze sustainability impact by region.

SELECT
    i.region,
    COUNT(*) AS total_devices,
    AVG(i.energy_savings_yr) AS avg_energy_savings_kwh,
    AVG(i.co2_saved_kg_yr) / 1000 AS avg_co2_saved_tons
FROM intel.device_data AS d
INNER JOIN intel.impact_data AS i
    ON d.device_id = i.device_id
GROUP BY
    i.region
ORDER BY
    avg_energy_savings_kwh DESC;

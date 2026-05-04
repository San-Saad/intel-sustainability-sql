-- Task 1: Join device and impact data, then create device age cohorts.

SELECT
    d.device_id,
    d.device_type,
    d.model_year,
    i.region,
    i.energy_savings_yr,
    i.co2_saved_kg_yr,
    2024 - d.model_year AS device_age,
    CASE
        WHEN 2024 - d.model_year <= 3 THEN 'newer'
        WHEN 2024 - d.model_year <= 6 THEN 'mid-age'
        ELSE 'older'
    END AS device_age_bucket
FROM intel.device_data AS d
INNER JOIN intel.impact_data AS i
    ON d.device_id = i.device_id
ORDER BY
    device_age DESC,
    d.device_type,
    i.region;

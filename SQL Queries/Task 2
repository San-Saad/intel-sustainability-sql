-- Aggregate overall impact
SELECT
    COUNT(*) AS total_devices,
    AVG(2024 - d.model_year) AS avg_device_age,
    AVG(i.energy_savings_yr) AS avg_energy_savings_kwh,
    SUM(i.co2_saved_kg_yr) / 1000 AS total_co2_saved_tons
FROM intel.device_data d
JOIN intel.impact_data i ON d.device_id = i.device_id;
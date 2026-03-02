
-- Device Type Analysis
SELECT d.device_type,
       COUNT(*) AS total_devices,
       AVG(i.energy_savings_yr) AS avg_energy_savings_kwh,
       AVG(i.co2_saved_kg_yr) / 1000 AS avg_co2_saved_tons
FROM intel.device_data d
JOIN intel.impact_data i ON d.device_id = i.device_id
GROUP BY d.device_type;

-- Device Age Analysis
SELECT CASE
           WHEN 2024 - d.model_year <= 3 THEN 'newer'
           WHEN 2024 - d.model_year > 3 AND 2024 - d.model_year <= 6 THEN 'mid-age'
           WHEN 2024 - d.model_year > 6 THEN 'older'
       END AS device_age_bucket,
       COUNT(*) AS total_devices,
       AVG(i.energy_savings_yr) AS avg_energy_savings_kwh,
       AVG(i.co2_saved_kg_yr) / 1000 AS avg_co2_saved_tons
FROM intel.device_data d
JOIN intel.impact_data i ON d.device_id = i.device_id
GROUP BY device_age_bucket;

-- Regional Analysis
SELECT i.region,
       COUNT(*) AS total_devices,
       AVG(i.energy_savings_yr) AS avg_energy_savings_kwh,
       AVG(i.co2_saved_kg_yr) / 1000 AS avg_co2_saved_tons
FROM intel.device_data d
JOIN intel.impact_data i ON d.device_id = i.device_id
GROUP BY i.region;


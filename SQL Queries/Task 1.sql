-- Join device_data and impact_data
SELECT *
FROM intel.device_data d
JOIN intel.impact_data i ON d.device_id = i.device_id;

-- Add device_age column
SELECT d.*, i.*, (2024 - d.model_year) AS device_age
FROM intel.device_data d
JOIN intel.impact_data i ON d.device_id = i.device_id;

-- Add device_age_bucket column
SELECT d.*, i.*,
       (2024 - d.model_year) AS device_age,
       CASE
           WHEN 2024 - d.model_year <= 3 THEN 'newer'
           WHEN 2024 - d.model_year > 3 AND 2024 - d.model_year <= 6 THEN 'mid-age'
           WHEN 2024 - d.model_year > 6 THEN 'older'
       END AS device_age_bucket
FROM intel.device_data d
JOIN intel.impact_data i ON d.device_id = i.device_id;


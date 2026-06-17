-- Poin 1

WITH base_data AS (
  SELECT *,
  -- Convert miles dan seed ke km dan km/h
  miles * 1.60934 AS distance_km,
  speed * 1.60934 AS speed_kmh,
  -- Beri keterangan day type
  CASE 
    WHEN day IN ('Saturday', 'Sunday') THEN 'Weekend'
    ELSE 'Weekday' END AS day_type
  FROM `driven-bulwark-483511-p7.Uber.uber_clean`
)

SELECT 
  category, day_type,
  COUNT(*) AS total_trip,
  ROUND(AVG(CASE WHEN duration > 0 THEN duration END),2) AS avg_duration_minutes,
  ROUND(AVG(distance_km),2) AS avg_distance_km,
  ROUND(AVG(CASE WHEN duration > 0 THEN speed_kmh END),2) AS avg_speed_kmh
FROM base_data
GROUP BY category, day_type;


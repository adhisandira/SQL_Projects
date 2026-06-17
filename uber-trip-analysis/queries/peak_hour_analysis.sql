-- Poin 2
-- Total trip per jam pada weekend dan weekday
-- Top 10 hari dan jam tersibuk

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

-- Total trip per jam pada weekend

-- SELECT start_hour, COUNT(*) AS count_trip_weekend
-- From base_data
-- WHERE day_type = 'Weekend'
-- GROUP BY start_hour ORDER BY start_hour;

-- Total trip per jam pada weekday

-- SELECT start_hour, COUNT(*) AS count_trip_weekday
-- From base_data
-- WHERE day_type = 'Weekday'
-- GROUP BY start_hour ORDER BY start_hour;


-- Top 10 hari dan jam tersibuk

SELECT day, start_hour, COUNT(*) AS count_trip
FROM base_data
GROUP BY day,start_hour ORDER BY COUNT (*) DESC, start_hour LIMIT 10;
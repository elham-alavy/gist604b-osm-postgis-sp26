-- Query 3: Road Density by County in Oregon
-- Purpose: Calculate primary and secondary road density (km per sq km) in each county

-- Requirements:
-- - Use adminareas_a for counties (fclass = 'admin_level6')
-- - Use roads for line features
-- - Filter roads to primary and secondary road types
-- - Use ST_Intersects to match roads to counties
-- - Use ST_Intersection to clip road segments to county boundaries
-- - Use ST_Length(geom::geography) for accurate road lengths in meters
-- - Convert meters to kilometers (divide by 1,000)
-- - Use ST_Area(geom::geography) for county area
-- - Convert square meters to square kilometers (divide by 1,000,000)
-- - Use a CTE to calculate intermediate metrics
-- - Calculate road density = total_road_length_km / county_area_sq_km
-- - Order results by road density (highest first)

-- Expected Output:
-- - county_name
-- - total_road_length_km
-- - county_area_sq_km
-- - road_density_km_per_sq_km
-- - geom

WITH county_metrics AS (
    SELECT
        aa.name AS county_name,
        SUM(ST_Length(ST_Intersection(r.geom, aa.geom)::geography)) / 1000 AS total_road_length_km,
        ST_Area(aa.geom::geography) / 1000000 AS county_area_sq_km,
        aa.geom
    FROM
        adminareas_a AS aa
    JOIN
        roads AS r ON ST_Intersects(aa.geom, r.geom)
    WHERE
        aa.fclass = 'admin_level6'
        AND r.fclass IN ('primary', 'secondary')
    GROUP BY
        aa.name, aa.geom
)

SELECT
    county_name,
    total_road_length_km,
    county_area_sq_km,
    total_road_length_km / county_area_sq_km AS road_density_km_per_sq_km,
    geom
FROM
    county_metrics
ORDER BY
    road_density_km_per_sq_km DESC;

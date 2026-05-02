-- Query 1: Cafe Locations in Oregon
-- Purpose: Extract cafe point locations for spatial distribution analysis

-- Requirements:
-- - Use pois for point features
-- - Filter POIs where fclass = 'cafe'
-- - Return raw point geometries

-- Expected Output:
-- - geom

SELECT
    geom
FROM
    pois
WHERE
    fclass = 'cafe';

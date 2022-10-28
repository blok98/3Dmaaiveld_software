-- Get all linestrings of bgt geoms
select ST_AsEWKT(ST_ExteriorRing(ST_GeomFromWKB(wkb_geometry))), ST_GeomFromWKB(wkb_geometry)
from road_wegdeelactueelbestaand_0
limit 10;


-- Interpolate real linestring of bgt polygon
-- interpolate where the string linestring is replaced by the real linestrings in the BGT
-- st_linemerge is used for multilinestrings (single linestring is req as input for interpolate)
SELECT ST_AsEWKT(ST_GeomFromWKB(wkb_geometry)), ST_Dump(ST_LineInterpolatePoints(ST_LineMerge(ST_AsEWKT(ST_ExteriorRing(ST_GeomFromWKB(wkb_geometry)))),
                                        (25 / ST_Length(ST_LineMerge(ST_AsEWKT(ST_ExteriorRing(ST_GeomFromWKB(wkb_geometry)))))  )))
FROM road_wegdeelactueelbestaand_0
limit 10


--retrieve BGT points from multipoints/linestr
select linestr, (ST_DumpPoints(linestr)).geom
from interpolated_linestrings
limit 2


-- Get 2d points of 3d lidar points (used for function closest point to bgt point)
select Point(lidarpoint)
from lidar_geomPoints
limit 10

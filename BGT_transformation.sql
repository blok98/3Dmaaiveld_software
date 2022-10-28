
-- update interpolated linestrings into a new created database. Add polygons, startpoints and endpoints.
CREATE TABLE interpolated_linestrings (
    poly geometry,
    linestr geometry,
    startpoint geometry,
    endpoint geometry
);

INSERT INTO interpolated_linestrings (poly,linestr,startpoint,endpoint)
SELECT ST_GeomFromWKB(wkb_geometry), 
ST_AsEWKT(ST_LineInterpolatePoints(ST_LineMerge(ST_AsEWKT(ST_ExteriorRing(ST_GeomFromWKB(wkb_geometry)))),
(5 / ST_Length(ST_LineMerge(ST_AsEWKT(ST_ExteriorRing(ST_GeomFromWKB(wkb_geometry)))))  ))),
ST_StartPoint(ST_LineInterpolatePoints(ST_LineMerge(ST_AsEWKT(ST_ExteriorRing(ST_GeomFromWKB(wkb_geometry)))),
(5 / ST_Length(ST_LineMerge(ST_AsEWKT(ST_ExteriorRing(ST_GeomFromWKB(wkb_geometry)))))  ))),
ST_EndPoint(ST_LineInterpolatePoints(ST_LineMerge(ST_AsEWKT(ST_ExteriorRing(ST_GeomFromWKB(wkb_geometry)))),
(5 / ST_Length(ST_LineMerge(ST_AsEWKT(ST_ExteriorRing(ST_GeomFromWKB(wkb_geometry)))))  )))
FROM road_wegdeelactueelbestaand_0
limit 100

--insert BGT geometry ponits from code above into new database
create table bgt_geomPoints
(
   geomPoint geometry
);

INSERT INTO bgt_geomPoints ( geomPoint ) 
select (ST_DumpPoints(linestr)).geom
from interpolated_linestrings


-- de bgt geompoints hebben geen srid waardoor ze niet met lidar points vergeleken kunnen worden. Vandaar dat ze zelfde srid moeten krijgen als van lidar points:
UPDATE bgt_geompoints SET geompoint = ST_SetSRID(geompoint,28992)



-------------------------- INTERMIDATE STEPS --------------------------

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

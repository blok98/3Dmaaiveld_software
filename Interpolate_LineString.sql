-- Creates smaller linestrings based on given linestring.
-- st_length requires the correct code to set the unit of length. feet: 2249. meters: 26986.
SELECT ST_Dump(ST_LineInterpolatePoints('LINESTRING(25 50, 100 125, 150 190)',
                                       (25 / ST_Length(ST_GeomFromText(
						   'LINESTRING(743238 2967416,743238 2967450,743265 2967450,
						   743265.625 2967416,743238 2967416)',2249))  )))

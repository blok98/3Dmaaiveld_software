-- visualisatie buffers en points kleine linestrings (in bgt_paasheuvel)
select st_collect(ST_Buffer(geompoint,10, 'quad_segs=8'), geompoint)
from bgt_geompoints
limit 10

-- visualisatie vonoroi polygons of lidar datapoints. First 3d lidar points have to be transf to 2d points.After QGIS function voronoi can be executed on these points.
select geometry(lidarpoint)
from lidar_geompoints
limit 10

-- voronoy diagram was realised with the build in voronoi diagram tool in QGIS. 

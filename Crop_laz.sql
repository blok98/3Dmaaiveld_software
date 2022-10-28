-- Crop laz data based on bounderies of bgt data. Everything 
-- outside the bounderies will be deleted.
-- Database: paasheuvel_csvfromtif.
DROP TABLE FROM output
WHERE field1 <117226.8 --min x
AND field1 >117610.6   --max x
AND field2 >481053     --min y
AND field2 <481439;    --max y

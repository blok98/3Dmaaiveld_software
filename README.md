# 3Dmaaiveld_software
Contains SQL, data and data documentation

![Alt][1](png/download.png "Title")
![Alt][2](png/hu.png "Title")

#### SQL CODE
The SQL codes are seperated into code for the BGT data and code for the Lidar data. Each file are chronologically ordered. BGT_transformation.sql should be executed first.
SQL statements that clearify the main code is listed at the bottom of both files. 

#### RUNNING BATCH FILES:
- bgt_to_postgres.bat:<br>
bgt_to_postgres.bat hostname port user password dbname area
- laz_to_postgres.bat: <br>
laz_to_postgres.bat

For running the laz_to_postgres file, the load_paasheuvel_laz_data.json has te be edited to the right postgres settings. 




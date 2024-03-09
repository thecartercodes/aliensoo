#!/bin/bash

cd_filename=tmp_lcd_000b21a_e.zip

curl -o $cd_filename https://www12.statcan.gc.ca/census-recensement/2021/geo/sip-pis/boundary-limites/files-fichiers/lcd_000b21a_e.zip

unzip $cd_filename -d tmp/
rm -f $cd_filename

shp2pgsql -D -I -s 3347 tmp/lcd_000b21a_e.shp census_division | psql -h $PG_HOST -p $PG_PORT -d $PG_DBNAME -U $PG_USERNAME
{{ config(materialized='table') }}

select
    cduid as census_division_id
    , cdname as census_division_name
    , cdtype as census_division_type
    , dguid as dguid
    , landarea as land_area
    , geom
    , {{ pruid_to_region_code('pruid') }} as region_code
from {{ source('src', 'census_division') }}

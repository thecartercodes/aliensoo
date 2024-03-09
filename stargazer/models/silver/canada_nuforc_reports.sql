{{ config(materialized='table') }}

with nr as (
    select
      date_time, text, shape, stats, report_link, duration
      , city_latitude, city_longitude
    from {{ source('src', 'nuforc_reports')}}
    where country = 'Canada'
)
select
    cd.census_division_id
    , nr.date_time as report_date
    , nr.text as report_text
    , nr.shape
    , nr.stats
    , nr.report_link
    , nr.duration
from {{ ref('dim_census_division') }} as cd
join nr
    on st_covers(
        cd.geom
        , st_transform(
            st_setsrid(
                st_makepoint(
                    nr.city_longitude
                    , nr.city_latitude
                )
                , 4326
            )
           , 3347
        )
    )

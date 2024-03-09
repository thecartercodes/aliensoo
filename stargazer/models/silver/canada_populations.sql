{{ config(materialized='table') }}

select
    date(ref_date::int || '-01-01') as calendar_yr
    , geo
    , dguid
    , substring(dguid, 5) as census_division_sub_id
    , value as population
from {{ source('src', 'canada_populations') }}
where sex = 'Both sexes'
    and age_group = 'All ages'
    and uom = 'Persons'

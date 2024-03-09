{{ config(materialized='view') }}

select
  *
from {{ ref('fct_census_division_timeseries') }}
where calendar_yr = '2022-01-01'
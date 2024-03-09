{{ config(materialized='table') }}

with all_calendar_dates as (
    select date_trunc('year', dd)::date as val
    from generate_series(
        '1969-01-01'::timestamp
        , '2022-01-01'
        , '1 year'::interval
    ) as dd
)
, dates_by_cd as (
    select
        acd.val calendar_yr
        , dcd.census_division_id
    from all_calendar_dates acd
    cross join {{ ref('dim_census_division') }} dcd
)
, fct_census_division_nuforc_timeseries as (
    select
      dcd.calendar_yr
      , dcd.census_division_id
      , avg(length(report_text)) as avg_report_len
      , sum(length(report_text)) as sum_report_len
      , coalesce(count(cnr.*), 0) as reports
    from dates_by_cd dcd
    left join {{ ref('canada_nuforc_reports') }} cnr
        on dcd.calendar_yr = date_trunc('year', cnr.report_date)
            and dcd.census_division_id = cnr.census_division_id
    group by 1, 2
)
select
  fcdnt.calendar_yr
  , fcdnt.census_division_id
  , dcd.census_division_name
  , dcd.land_area
  , dcd.region_code
  , fcdnt.avg_report_len
  , fcdnt.sum_report_len
  , fcdnt.reports
  , cp.population
from fct_census_division_nuforc_timeseries fcdnt
join {{ ref('dim_census_division') }} dcd on fcdnt.census_division_id = dcd.census_division_id
left join {{ ref('canada_populations') }} cp
  on substring(dcd.dguid, 5) = cp.census_division_sub_id
    and fcdnt.calendar_yr = cp.calendar_yr
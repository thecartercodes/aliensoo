{% macro pruid_to_region_code(column_name) %}
    case
        when {{column_name}} = '46' then 'MB'
        when {{column_name}} = '59' then 'BC'
        when {{column_name}} = '12' then 'NS'
        when {{column_name}} = '11' then 'PE'
        when {{column_name}} = '10' then 'NL'
        when {{column_name}} = '61' then 'NT'
        when {{column_name}} = '48' then 'AB'
        when {{column_name}} = '35' then 'ON'
        when {{column_name}} = '13' then 'NB'
        when {{column_name}} = '24' then 'QC'
        when {{column_name}} = '60' then 'YT'
        when {{column_name}} = '47' then 'SK'
        when {{column_name}} = '62' then 'NU'
        else 'Unknown'
    end
{% endmacro %}

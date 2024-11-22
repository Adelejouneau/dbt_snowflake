-- models/count_countries.sql
with country_data as (
    select * from {{ ref('country_code') }} -- Faites référence à la table créée à partir du seed
)

{%- set countries = ["France", "Spain", "Germany", "United States"] -%}

select
{%- for country in countries %}
{%- if ' ' not in country %}
count(case when name = '{{country}}' then name end) as {{country}}_amount
{%- else %}
{% set country_underscore = country.replace(' ', '_') -%}
count(case when name = '{{country}}' then name end) as {{country_underscore}}_amount
{% endif -%}
{%- if not loop.last %},{% endif -%}
{% endfor -%}
from {{ ref('country_codes') }}
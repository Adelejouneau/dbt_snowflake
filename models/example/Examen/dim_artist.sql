{{ config(materialized='table', tags=['star_schema']) }}

with artist_data as (
    select
        artistid,
        birthyear,
        country,
        nameartist
    from {{ source('star_schema', 'DIMARTIST') }}
)

select * from artist_data

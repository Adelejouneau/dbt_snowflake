{{ config(materialized='table', tags=['star_schema']) }}

with genre_data as (
    select
        genreid,
        namegenre
    from {{ source('star_schema', 'DIMGENRE') }}
)

select * from genre_data

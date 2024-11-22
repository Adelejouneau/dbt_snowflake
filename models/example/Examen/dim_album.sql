{{ config(materialized='table', tags=['star_schema']) }}

with album_data as (
    select
        albumid,
        title,
        artistid,
        cdyear,
        prodyear
    from {{ source('star_schema', 'DIMALBUM') }}
)

select * from album_data
{{ config(materialized='table', tags=['star_schema']) }}

with track_data as (
    select
        trackid,
        nametrack,
        albumid,
        mediatypeid,
        genreid,
        composer,
        milliseconds,
        bytes,
        unitprice
    from {{ source('star_schema', 'FACTTRACK') }}
)

select * from track_data

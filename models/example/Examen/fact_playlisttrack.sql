{{ config(materialized='table', tags=['star_schema']) }}

with playlisttrack_data as (
    select
        playlistid,
        trackid
    from {{ source('star_schema', 'FACTPLAYLISTTRACK') }}
)

select * from playlisttrack_data

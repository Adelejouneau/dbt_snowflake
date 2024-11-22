{{ config(materialized='table', tags=['star_schema']) }}

with playlist_data as (
    select
        playlistid,
        nameplaylist
    from {{ source('star_schema', 'DIMPLAYLIST') }}
)

select * from playlist_data

{{ config(materialized='view', tags=['exam_views']) }}

with albums_count as (
    select
        nameartist as artist_name,
        count(a.albumid) as album_count
    from {{ ref('dim_artist') }} ar
    join {{ ref('dim_album') }} a on ar.artistid = a.artistid
    group by ar.nameartist
)

select * from albums_count

{{ config(materialized='view', tags=['exam_views']) }}

with tracks_count as (
    select
        nameartist as artist_name,
        count(t.trackid) as track_count
    from {{ ref('dim_artist') }} ar
    join {{ ref('dim_album') }} a on ar.artistid = a.artistid
    join {{ ref('fact_track') }} t on a.albumid = t.albumid
    group by ar.nameartist
)

select * from tracks_count

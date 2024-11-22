{{ config(materialized='view', tags=['exam_views']) }}

with rock_tracks_france as (
    select
        nametrack as track_name,
        nameartist as artist_name
    from {{ ref('fact_track') }} t
    join {{ ref('dim_genre') }} g on t.genreid = g.genreid
    join {{ ref('dim_artist') }} ar on t.albumid = ar.artistid
    where g.namegenre = 'Rock' and ar.country = 'France'
)

select * from rock_tracks_france

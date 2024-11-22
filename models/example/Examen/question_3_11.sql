{{ config(materialized='view', tags=['exam_views']) }}

with playlists_before_1990 as (
    select
        nameplaylist as playlist_name
    from {{ ref('dim_playlist') }} p
    join {{ ref('fact_playlisttrack') }} pt on p.playlistid = pt.playlistid
    join {{ ref('fact_track') }} t on pt.trackid = t.trackid
    join {{ ref('dim_artist') }} ar on t.albumid = ar.artistid
    where ar.birthyear < 1990
    group by p.nameplaylist
)

select * from playlists_before_1990

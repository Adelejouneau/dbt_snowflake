{{ config(materialized='view', tags=['exam_views']) }}

with long_track_playlists as (
    select
        nameplaylist as playlist_name
    from {{ ref('dim_playlist') }} p
    join {{ ref('fact_playlisttrack') }} pt on p.playlistid = pt.playlistid
    join {{ ref('fact_track') }} t on pt.trackid = t.trackid
    where t.milliseconds > 240000
    group by p.nameplaylist
)

select * from long_track_playlists

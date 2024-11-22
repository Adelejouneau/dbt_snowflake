{{ config(materialized='view', tags=['exam_views']) }}

with rock_jazz_tracks as (
    select
        nametrack as track_name,
        composer
    from {{ ref('fact_track') }} t
    join {{ ref('dim_genre') }} g on t.genreid = g.genreid
    where g.namegenre in ('Rock', 'Jazz')
)

select * from rock_jazz_tracks

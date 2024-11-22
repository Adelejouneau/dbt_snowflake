{{ config(materialized='view', tags=['exam_views']) }}

with album_lengths as (
    select
        a.albumid,
        a.title,
        sum(t.milliseconds) as total_duration
    from {{ ref('dim_album') }} a
    join {{ ref('fact_track') }} t on a.albumid = t.albumid
    group by a.albumid, a.title
    order by total_duration desc
    limit 10
)

select * from album_lengths

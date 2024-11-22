{{ config(materialized='view', tags=['exam_views']) }}

with tracks_2000_2002 as (
    select
        nametrack,
        t.albumid,
        prodyear
    from {{ ref('fact_track') }} t
    join {{ ref('dim_album') }} a on t.albumid = a.albumid
    where a.prodyear in (2000, 2002)
)

select * from tracks_2000_2002

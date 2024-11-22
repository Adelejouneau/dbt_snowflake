{{ config(materialized='view', tags=['exam_views']) }}

with avg_track_size as (
    select
        namegenre as genre_name,
        avg(t.bytes) as avg_size
    from {{ ref('fact_track') }} t
    join {{ ref('dim_genre') }} g on t.genreid = g.genreid
    group by g.namegenre
)

select * from avg_track_size

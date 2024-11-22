{{ config(materialized='view', tags=['exam_views']) }}

with genre_popularity as (
    select
        namegenre as genre_name,
        count(*) as listen_count
    from {{ ref('fact_track') }} t
    join {{ ref('dim_genre') }} g on t.genreid = g.genreid
    join {{ ref('dim_album') }} a on t.albumid = a.albumid
    where a.prodyear between 2000 and 2009
    group by g.namegenre
    order by listen_count desc
    limit 1
)

select * from genre_popularity

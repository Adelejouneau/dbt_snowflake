{{ config(materialized='view', tags=['exam_views']) }}

with albums_with_more_cd as (
    select
        title
    from {{ ref('dim_album') }}
    where cdyear > 1
)

select * from albums_with_more_cd

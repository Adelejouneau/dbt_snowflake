{{ config(materialized='table', tags=['star_schema']) }}

with mediatype_data as (
    select
        mediatypeid,
        namemediatype
    from {{ source('star_schema', 'DIMMEDIATYPE') }}
)

select * from mediatype_data

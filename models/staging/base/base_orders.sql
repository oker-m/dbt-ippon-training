{{ config(materialized = 'table')}}

select distinct * from {{source("name_source_scenario2", "orders")}}
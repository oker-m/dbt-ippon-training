{{ config(materialized = 'table')}}
select distinct * from {{ mockable_source("name_source_scenario2", "orders", "sample_orders") }}
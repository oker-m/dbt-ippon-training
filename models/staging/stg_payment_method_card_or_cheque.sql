{{ config(materialized = 'table')}}
{% set payment_methods = get_payment_methods() %}
select 
    r.name,
    {% for payment_method in payment_methods %}
    sum(case when payment_method = '{{payment_method}}' then amount end) as {{payment_method}}_amount,
    {% endfor %}
    sum(amount) as total_amount
from
    {{ ref("base_restaurants") }} as r
left join
    {{ ref("base_orders") }} as o
    on o.restaurant_identifier = r.identifier
group by 1
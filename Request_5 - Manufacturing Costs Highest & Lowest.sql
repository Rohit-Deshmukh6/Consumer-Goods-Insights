select product_code,product, manufacturing_cost from dim_product
join fact_manufacturing_cost
using (product_code)
where manufacturing_cost = (select max(manufacturing_cost) from fact_manufacturing_cost)

union

select product_code,product, manufacturing_cost from dim_product
join fact_manufacturing_cost
using (product_code)
where manufacturing_cost = (select min(manufacturing_cost) from fact_manufacturing_cost)
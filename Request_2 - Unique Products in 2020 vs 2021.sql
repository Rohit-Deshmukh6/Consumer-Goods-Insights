
with cte1 as (
select count(distinct(product_code)) 
as unique_products_2020
from fact_sales_monthly
where fiscal_year = 2020
),

cte2 as (
select count(distinct(product_code)) 
as unique_products_2021
from fact_sales_monthly
where fiscal_year = 2021)


select *,
		round((b.unique_products_2021-a.unique_products_2020)*100/a.unique_products_2020,2) as pct_change
 from cte1 a 
cross join cte2 b



with cte1 as (
select 
	max(division) as division,
    max(product_code) as product_code,
    max(product) as product,
    sum(sold_quantity) as total_sold_quantity

from fact_sales_monthly
join dim_product
using (product_code)
where fiscal_year = 2021
group by product
order by division),

cte2 as (
select * ,
	rank() over (partition by division order by total_sold_quantity desc) as rnk
from cte1)

select * from cte2 where rnk <=3

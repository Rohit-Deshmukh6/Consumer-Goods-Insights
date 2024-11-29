with cte as (
select channel,
		round((sum(sold_quantity*gross_price))/1000000,2) as gross_sales_mln

from fact_sales_monthly
join fact_gross_price
using (product_code, fiscal_year)
join dim_customer
using (customer_code)
where fiscal_year = 2021
group by channel)

select *,
     round(gross_sales_mln*100/sum(gross_sales_mln) over (),2) as percentage   
     from cte
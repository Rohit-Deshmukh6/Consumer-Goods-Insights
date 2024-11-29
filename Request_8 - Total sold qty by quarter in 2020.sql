
select 
quarter((date_add(date, interval 4 month))) as Quarter,
sum((sold_quantity)) as total_sold_quantity

from fact_sales_monthly
where fiscal_year = 2020
group by Quarter
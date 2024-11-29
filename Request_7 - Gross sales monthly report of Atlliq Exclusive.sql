select 
concat(
	monthname(date),' ',
    year(date) ) as Month,
    round(sum(sold_quantity*gross_price),2) as Gross_sales_Amt
    
 from fact_sales_monthly
join dim_customer
using (customer_code)
join fact_gross_price
using(product_code,fiscal_year)
where customer = "Atliq Exclusive"
group by date
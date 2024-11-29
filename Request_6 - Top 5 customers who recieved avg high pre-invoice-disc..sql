select 
		customer_code,customer,
        round(avg(pre_invoice_discount_pct)*100,1) as avg_disc_pct
 from fact_pre_invoice_deductions
join dim_customer
using (customer_code)
where market = "India"
and fiscal_year = 2021
group by customer,customer_code
order by avg_disc_pct desc
limit 5
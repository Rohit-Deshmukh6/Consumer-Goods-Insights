SELECT segment,
	count(distinct(product)) as unique_products
 FROM gdb023.dim_product
group by segment
order by unique_products desc
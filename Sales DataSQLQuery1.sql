--Sales changing year over year
select 
      FORMAT(sale_date,'yyy-mm') as year,
	  sum(sales_amount) as total_sales
from sales_data
group by FORMAT(sale_date,'yyy-mm')
order by year;


--Top sales Representives
select   
sales_rep,
	  sum(sales_amount) as total_sales,
	  sum(quantity_sold) as total_units_sold
from dbo.sales_data
group by sales_rep
order by total_sales desc;


--Regions that generate the most Revenue
select 
      region,
	  sum(sales_amount) as total_sales
from sales_data
group by Region
order by total_sales desc;


--Product categories total sales and total quantities 
select 
      product_category,
	  sum(sales_amount) as total_sales,
	  sum(quantity_sold) as total_quantity
from dbo.sales_data
group by Product_Category
order by total_sales desc;

--Total profit for each product category 
select 
      product_category,
	  sum(sales_amount) as total_sales,
	  sum(quantity_sold) as total_quantity,
	  sum((unit_price-unit_cost) * quantity_sold) as total_profit
from dbo.sales_data
group by Product_Category
order by total_sales desc;


--New Customers vs Returning customers spending difference 
select
      customer_type,
	  count(*) as number_of_orders,
	  sum(sales_amount) as total_sales,
	  avg(discount) as avg_discount
from dbo.sales_data
group by Customer_Type;

--Most used Payment methods
select
      payment_method,
	  count(*) as usage_count
from sales_data
group by Payment_Method
order by usage_count desc;

--Discount impact on Sales
select
      discount,
	  avg(sales_amount) as Avg_sales
from sales_data
group by Discount
order by Discount;

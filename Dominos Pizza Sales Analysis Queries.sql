use [Dominos Pizza Sales Analysis]

select top 20* from [dbo].[pizza_sales]

--- Dominos Pizza Sales Analysis ---
-- KPIs --
-- Total Revenue -- 
select sum(total_price) as Total_Revenue from [dbo].[pizza_sales]
-- 817860.049999993

-- Average Order Value -- 
select sum(total_price)/count(distinct order_id) as AOV from [dbo].[pizza_sales]
-- 38.3072622950816

-- Total Pizzas sold --
select sum(quantity) from [dbo].[pizza_sales]
-- 49574

-- Total Orders -- 
select count(distinct order_id) from [dbo].[pizza_sales]
-- 21350

-- Average Pizzas per Order --
select round(sum(quantity)/count(distinct order_id), 2) from [dbo].[pizza_sales]
-- 2.32

-- Chart Requirements --
-- Daily trend for total orders--
select datename(dw, order_date) as week_day,count(distinct order_id) as number_of_orders
from [dbo].[pizza_sales]
group by datename(dw, order_date)

-- Monthly trend for total orders--
select datename(m, order_date) as order_month,count(distinct order_id) as number_of_orders
from [dbo].[pizza_sales]
group by datename(m, order_date)

-- % of sales by Pizza category --
select pizza_category, round(sum(total_price)*100 /(select sum(total_price) from [dbo].[pizza_sales]), 2) as no_od_orders 
from [dbo].[pizza_sales]
group by pizza_category

-- % of sales by pizza size --
select pizza_size, round(sum(total_price)*100 /(select sum(total_price) from [dbo].[pizza_sales]), 2) as no_od_orders 
from [dbo].[pizza_sales]
group by pizza_size

-- Total pizzas sold by pizza category --
select pizza_category, sum(quantity)
from [dbo].[pizza_sales]
group by pizza_category

-- Top 5 best sellers by revenue, total quantity, total_orders
select top 5 pizza_name, round(sum(total_price),2)as rev
from [dbo].[pizza_sales]
group by pizza_name
order by 2 desc

select top 5 pizza_name, sum(quantity) as quantity
from [dbo].[pizza_sales]
group by pizza_name
order by 2 desc

select top 5 pizza_name, count(order_id)as orders
from [dbo].[pizza_sales]
group by pizza_name
order by 2 desc

-- Bottom 5 best sellers by revenue, total quantity, total_orders
select top 5 pizza_name, round(sum(total_price),2)as rev
from [dbo].[pizza_sales]
group by pizza_name
order by 2

select top 5 pizza_name, sum(quantity) as quantity
from [dbo].[pizza_sales]
group by pizza_name
order by 2 

select top 5 pizza_name, count(order_id)as orders
from [dbo].[pizza_sales]
group by pizza_name
order by 2

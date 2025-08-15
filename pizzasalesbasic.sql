select *from pizza_sales

--Total revenue
select sum(total_price) as Total_Revenue from pizza_sales

--Average order value--
select sum(total_price)/count (distinct order_id) as Avg_Order_value from pizza_sales

--Total pizzas sold--
select sum(quantity) as Total_Pizza_sold from pizza_sales

--Total order placed--
select count (distinct order_id) as Total_Orders from pizza_sales

--Average pizzas per order--
select cast(cast(sum(quantity) as decimal(10,2))/
cast(count(distinct order_id) as decimal(10,2)) as decimal(10,2)) as Avg_pizzas_perorder from pizza_sales
select *from pizza_sales

--Daily trend for total orders--
SELECT DATENAME(DW,order_date) AS Order_day,COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DATENAME(DW,order_date)

--Monthly trend for total orders--
SELECT DATENAME(MONTH,order_date) AS Month_Name,COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY DATENAME(MONTH,order_date)
ORDER BY Total_Orders DESC

--Percentage of sales by pizza category--
SELECT pizza_category,SUM(total_price) AS Total_sales,SUM(total_price)*100/
(SELECT sum(total_price) FROM pizza_sales WHERE MONTH(order_date)=1)  AS PCT 
FROM pizza_sales
WHERE MONTH(order_date)=1	--for january--
GROUP BY pizza_category

--Percentage of sales by pizza size--
SELECT pizza_size,CAST(SUM(total_price) AS DECIMAL(10,2)) AS Total_sales,CAST(SUM(total_price)*100/
(SELECT sum(total_price) FROM pizza_sales WHERE DATEPART(quarter,order_date)=1) AS DECIMAL(10,2)) AS PCT 
FROM pizza_sales
WHERE DATEPART(quarter,order_date)=1
GROUP BY pizza_size
ORDER BY PCT DESC

--Top 5 best sellers by revenue,total quantity and total orders--
SELECT TOP 5 pizza_name,SUM(total_price) AS Total_Revenue FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

SELECT TOP 5 pizza_name,SUM(quantity) AS Total_Quantity FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity DESC

SELECT TOP 5 pizza_name,COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC

--Bottom 5 sellers by revenue,total quanity and total orders--
SELECT TOP 5 pizza_name,SUM(total_price) AS Total_Revenue FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC

SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC

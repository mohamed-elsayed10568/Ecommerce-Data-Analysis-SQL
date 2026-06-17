select * from diversified_ecommerce_dataset

--Highest Profit Category--
select Category, sum(price - Discount) as Sales, sum(price - Discount - Shipping_Cost - Tax_Rate) as profit
from diversified_ecommerce_dataset
group by Category
order by sum(Price) desc

--Number of customers for the products based on age--
select Customer_Age_Group, Category, count(Product_id) as 'Count Of Customer'
from diversified_ecommerce_dataset
group by Customer_Age_Group, Category
order by Customer_Age_Group

--Sales by location--
select distinct customer_location, sum(price - Discount) as sales
from diversified_ecommerce_dataset
group by Customer_Location
order by sales desc

--Sum of Shipping Cost--
select Shipping_Method, sum(Shipping_Cost) as Shipping_Cost
from diversified_ecommerce_dataset
group by Shipping_Method
order by Shipping_Cost desc

--Return rate from Shipping Method--
select Shipping_Method, avg(Return_Rate)
from diversified_ecommerce_dataset
group by Shipping_Method
order by avg(Return_Rate) desc

--Shipping cost based on location--
select Customer_Location ,sum(Shipping_cost) as sum_shipping_cost
from diversified_ecommerce_dataset
group by Customer_Location
order by sum(Shipping_cost) desc

--Preferred product categories based on customer age groups--
SELECT Customer_Age_Group, Category, COUNT(*) AS Number_of_Purchases
FROM diversified_ecommerce_dataset
group by Customer_Age_Group, Category
order by Customer_Age_Group, Number_of_Purchases DESC;

--Products that are in short supply--
SELECT Product_ID, Product_Name, Category, Stock_Level, Popularity_Index
FROM diversified_ecommerce_dataset
WHERE Stock_Level < 50 AND Popularity_Index > 70
ORDER BY Popularity_Index DESC;

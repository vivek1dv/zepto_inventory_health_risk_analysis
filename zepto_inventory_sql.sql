CREATE DATABASE q_commerce;

USE q_commerce;

SELECT * 
FROM zepto;

-- create duplicate table
CREATE TABLE zepto_1
LIKE zepto;

INSERT INTO zepto_1
SELECT * FROM zepto;


-- Data exploration

-- sample data
SELECT * 
FROM zepto_1;
 
-- add sku id column
ALTER TABLE zepto_1
ADD COLUMN sku_id SERIAL PRIMARY KEY;

-- count of rows
SELECT COUNT(*)
FROM zepto_1;

SELECT * 
FROM zepto_1;

-- null values
SELECT *
FROM zepto_1
WHERE category IS NULL
OR 
name IS NULL
OR
mrp IS NULL
OR
discountpercent IS NULL
OR
discountedsellingprice IS NULL
OR
weightingms IS NULL
OR
outofstock IS NULL
OR
quantity IS NULL;


-- check different product categories
SELECT DISTINCT category
FROM zepto_1
ORDER BY category ASC;

-- products in stock vs out of stock
SELECT outofstock, COUNT(sku_id)
FROM zepto_1
GROUP BY outofstock;

-- product names present in multiple times
SELECT name, COUNT(sku_id) AS number_of_sku
FROM zepto_1
GROUP BY name
HAVING number_of_sku > 1
ORDER BY  number_of_sku DESC;

-- Data cleaning

-- where price is zero
SELECT * 
FROM zepto_1
WHERE mrp = 0 OR discountedSellingPrice = 0;

DELETE FROM zepto_1
WHERE mrp = 0 ;

-- update paise into rupees
UPDATE zepto_1
SET mrp = mrp/100.0,
discountedSellingPrice = discountedSellingPrice/100.0;

SELECT * 
FROM zepto_1;



-- Q1. Find the top 10 best-value products based on the discount percentage.
SELECT DISTINCT name, mrp, discountPercent
FROM zepto_1
ORDER BY discountPercent DESC
LIMIT 10;


-- Q2.What are the Products with High MRP but Out of Stock.
SELECT DISTINCT name, mrp
FROM zepto_1
WHERE outofstock = "true" AND mrp > 300
ORDER BY mrp DESC ; 


-- Q3.Calculate Estimated Revenue for each category.
SELECT category, SUM(discountedSellingPrice*availableQuantity) AS revenue
FROM zepto_1
GROUP BY category
ORDER BY revenue DESC;


-- Q4. Find all products where MRP is greater than ₹500 and discount is less than 10%.
SELECT DISTINCT DISTINCT name, mrp, discountpercent
FROM zepto_1
WHERE mrp > 500 AND  discountpercent < 10
ORDER BY mrp;
     

-- Q5. Identify the top 5 categories offering the highest average discount percentage.
SELECT category, ROUND(AVG(discountPercent), 2) AS avg_discount
FROM zepto_1
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;


-- Q6. Find the price per gram for products above 100g and sort by best value.
SELECT DISTINCT name, discountedSellingPrice, weightInGms,
ROUND(discountedSellingPrice/weightInGms, 2) AS price_per_gram
FROM zepto_1
WHERE weightInGms > 100
ORDER BY price_per_gram;


-- Q7.Group the products into categories like Low, Medium, Bulk.
SELECT DISTINCT name, weightInGms,
CASE WHEN weightInGms < 1000 THEN "Low"
	WHEN weightInGms < 5000 THEN "Medium"
	ELSE "Bulk"
    END AS weight_category
FROM zepto_1;


-- Q8.What is the Total Inventory Weight Per Category.
SELECT category, SUM(weightInGms*availableQuantity) AS total_weight
FROM zepto_1
GROUP BY category
ORDER BY total_weight DESC;

/*
===============================================================================
Measures Exploration (Key Metrics)
===============================================================================
Purpose:
    - Calculate aggregated metrics (totals, averages) for quick business insights.
    - Identify overall trends and detect anomalies in sales, orders, products, and customers.

SQL Functions Used:
    - COUNT(), COUNT(DISTINCT)
    - SUM()
    - AVG()
===============================================================================
*/

-- Total Sales
SELECT SUM(sales_amount) AS total_sales
FROM gold.fact_sales;

-- Total Items Sold
SELECT SUM(quantity) AS total_items_sold
FROM gold.fact_sales;

-- Average Selling Price
SELECT AVG(price) AS avg_price
FROM gold.fact_sales;

-- Total Orders (raw count)
SELECT COUNT(order_number) AS total_orders
FROM gold.fact_sales;

-- Total Orders (without duplicates)
SELECT COUNT(DISTINCT order_number) AS total_orders_no_duplicates
FROM gold.fact_sales;

-- Total Products (with and without duplicates)
SELECT COUNT(DISTINCT product_key) AS total_products_no_duplicates
FROM gold.dim_products;

SELECT COUNT(product_key) AS total_products
FROM gold.dim_products;

-- Total Customers
SELECT COUNT(customer_key) AS total_customers
FROM gold.dim_customers;

-- Total Customers Who Placed Orders
SELECT COUNT(DISTINCT customer_key) AS total_customers_who_ordered
FROM gold.fact_sales;

-- Generate a consolidated key metrics report
SELECT 'Total Sales' AS measure_name, SUM(sales_amount) AS measure_value FROM gold.fact_sales
UNION ALL
SELECT 'Total Quantity', SUM(quantity) FROM gold.fact_sales
UNION ALL
SELECT 'Average Price', AVG(price) FROM gold.fact_sales
UNION ALL
SELECT 'Total Orders', COUNT(DISTINCT order_number) FROM gold.fact_sales
UNION ALL
SELECT 'Total Products', COUNT(DISTINCT product_key) FROM gold.dim_products
UNION ALL
SELECT 'Total Customers', COUNT(DISTINCT customer_key) FROM gold.dim_customers;

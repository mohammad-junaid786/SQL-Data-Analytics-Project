/*
===============================================================================
Ranking Analysis
===============================================================================
Purpose:
    - Rank products, customers, and other entities based on performance metrics.
    - Identify top performers and lowest performers for deeper analysis.

Tables Used:
    - gold.fact_sales
    - gold.dim_products
    - gold.dim_customers

SQL Functions Used:
    - Aggregate Functions: SUM(), COUNT()
    - Window Functions: RANK()
    - Clauses: GROUP BY, ORDER BY, TOP
===============================================================================
*/

-- Top 5 products generating the highest revenue (Simple Ranking)
SELECT TOP 5
    p.product_name,
    SUM(s.sales_amount) AS total_revenue
FROM gold.fact_sales s
LEFT JOIN gold.dim_products p
    ON p.product_key = s.product_key
GROUP BY p.product_name
ORDER BY total_revenue DESC;


-- Top 5 products generating the highest revenue (Flexible Ranking using Window Functions)
SELECT *
FROM (
    SELECT
        p.product_name,
        SUM(s.sales_amount) AS total_revenue,
        RANK() OVER (ORDER BY SUM(s.sales_amount) DESC) AS rank_products
    FROM gold.fact_sales s
    LEFT JOIN gold.dim_products p
        ON p.product_key = s.product_key
    GROUP BY p.product_name
) AS ranked_products
WHERE rank_products <= 5;


-- 5 worst-performing products in terms of sales
SELECT TOP 5
    p.product_name,
    SUM(s.sales_amount) AS total_revenue
FROM gold.fact_sales s
LEFT JOIN gold.dim_products p
    ON p.product_key = s.product_key
GROUP BY p.product_name
ORDER BY total_revenue;


-- Top 10 customers generating the highest revenue
SELECT TOP 10
    c.customer_key,
    c.first_name,
    c.last_name,
    SUM(s.sales_amount) AS total_revenue
FROM gold.fact_sales s
LEFT JOIN gold.dim_customers c
    ON c.customer_key = s.customer_key
GROUP BY 
    c.customer_key,
    c.first_name,
    c.last_name
ORDER BY total_revenue DESC;


-- 3 customers with the fewest orders placed
SELECT TOP 3
    c.customer_key,
    c.first_name,
    c.last_name,
    COUNT(DISTINCT s.order_number) AS total_orders
FROM gold.fact_sales s
LEFT JOIN gold.dim_customers c
    ON c.customer_key = s.customer_key
GROUP BY 
    c.customer_key,
    c.first_name,
    c.last_name
ORDER BY total_orders;

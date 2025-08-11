/*
===============================================================================
Cumulative Analysis
===============================================================================
Purpose:
    - Calculate running totals or moving averages for key metrics.
    - Track performance over time cumulatively.
    - Useful for growth analysis or identifying long-term trends.

Tables Used:
    - gold.fact_sales

SQL Functions Used:
    - Window Functions: SUM() OVER(), AVG() OVER()
    - Date Functions: DATETRUNC()
    - Aggregate Functions: SUM(), AVG()
===============================================================================
*/

-- Aggregate yearly sales and prices, then calculate running totals and moving averages
SELECT
    order_date,
    total_sales,
    SUM(total_sales) OVER (ORDER BY order_date) AS running_total_sales,
    AVG(avg_price) OVER (ORDER BY order_date) AS moving_average_price
FROM
(
    SELECT 
        DATETRUNC(year, order_date) AS order_date,
        SUM(sales_amount) AS total_sales,
        AVG(price) AS avg_price
    FROM gold.fact_sales
    WHERE order_date IS NOT NULL
    GROUP BY DATETRUNC(year, order_date)
) t;

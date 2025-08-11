/*
===============================================================================
Part-to-Whole Analysis
===============================================================================
Purpose:
    - Identify which categories contribute the most to overall sales.
    - Compare performance across product categories as a percentage of the total.
    - Useful for contribution analysis, A/B testing, or regional comparisons.

Tables Used:
    - gold.fact_sales
    - gold.dim_products

SQL Functions Used:
    - Aggregate Functions: SUM(), ROUND()
    - Window Functions: SUM() OVER() for total calculations
    - CAST(): Convert values for percentage calculations
===============================================================================
*/

/* Step 1: Calculate total sales per category */
WITH category_sales AS (
    SELECT
        p.category,
        SUM(s.sales_amount) AS total_sales
    FROM gold.fact_sales s
    LEFT JOIN gold.dim_products p
        ON p.product_key = s.product_key
    GROUP BY p.category
)

/* Step 2: Calculate percentage contribution of each category to overall sales */
SELECT
    category,
    total_sales,
    SUM(total_sales) OVER () AS overall_sales,
    ROUND((CAST(total_sales AS FLOAT) / SUM(total_sales) OVER ()) * 100, 2) AS percentage_of_total
FROM category_sales
ORDER BY total_sales DESC;

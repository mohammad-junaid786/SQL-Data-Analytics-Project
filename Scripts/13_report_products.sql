/*
===============================================================================
Product Report
===============================================================================
Purpose:
    - Consolidate key product metrics and performance indicators.
    - Provide segmentation by revenue tiers (High-Performer, Mid-Range, Low-Performer).
    - Enable performance tracking and comparative analysis across products.

Tables Used:
    - gold.fact_sales
    - gold.dim_products

SQL Functions Used:
    - DATEDIFF(): Calculate product lifespan and recency.
    - CASE: Segment products based on revenue thresholds.
    - COUNT(), SUM(), AVG(), ROUND(): Aggregate and summarize metrics.
    - NULLIF(): Prevent division by zero in calculations.

Highlights:
    1. Retrieves essential fields: product name, category, subcategory, and cost.
    2. Segments products into revenue-based categories.
    3. Aggregates product-level metrics:
       - total orders
       - total sales
       - total quantity sold
       - total unique customers
       - lifespan (in months)
    4. Calculates KPIs:
       - recency (months since last sale)
       - average order revenue (AOR)
       - average monthly revenue
===============================================================================
*/

-- =============================================================================
-- Create Report: gold.report_products
-- =============================================================================
IF OBJECT_ID('gold.report_products', 'V') IS NOT NULL
    DROP VIEW gold.report_products;
GO

CREATE VIEW gold.report_products AS

/*---------------------------------------------------------------------------
Step 1: Base Query - Retrieve core product and sales data
---------------------------------------------------------------------------*/
WITH base_query AS (
    SELECT
        s.order_number,
        s.order_date,
        s.customer_key,
        s.sales_amount,
        s.quantity,
        p.product_key,
        p.product_name,
        p.category,
        p.subcategory,
        p.cost
    FROM gold.fact_sales s
    LEFT JOIN gold.dim_products p
        ON s.product_key = p.product_key
    WHERE s.order_date IS NOT NULL
),

/*---------------------------------------------------------------------------
Step 2: Product Aggregations - Summarize metrics at the product level
---------------------------------------------------------------------------*/
product_aggregations AS (
    SELECT
        product_key,
        product_name,
        category,
        subcategory,
        cost,
        DATEDIFF(MONTH, MIN(order_date), MAX(order_date)) AS lifespan,
        MAX(order_date) AS last_sale_date,
        COUNT(DISTINCT order_number) AS total_orders,
        COUNT(DISTINCT customer_key) AS total_customers,
        SUM(sales_amount) AS total_sales,
        SUM(quantity) AS total_quantity,
        ROUND(AVG(CAST(sales_amount AS FLOAT) / NULLIF(quantity, 0)), 1) AS avg_selling_price
    FROM base_query
    GROUP BY
        product_key,
        product_name,
        category,
        subcategory,
        cost
)

/*---------------------------------------------------------------------------
Step 3: Final Output - Apply segmentation and compute KPIs
---------------------------------------------------------------------------*/
SELECT 
    product_key,
    product_name,
    category,
    subcategory,
    cost,
    last_sale_date,
    DATEDIFF(MONTH, last_sale_date, GETDATE()) AS recency_in_months,
    CASE
        WHEN total_sales > 50000 THEN 'High-Performer'
        WHEN total_sales >= 10000 THEN 'Mid-Range'
        ELSE 'Low-Performer'
    END AS product_segment,
    lifespan,
    total_orders,
    total_sales,
    total_quantity,
    total_customers,
    avg_selling_price,
    -- Average Order Revenue (AOR)
    CASE 
        WHEN total_orders = 0 THEN 0
        ELSE total_sales / total_orders
    END AS avg_order_revenue,
    -- Average Monthly Revenue
    CASE
        WHEN lifespan = 0 THEN total_sales
        ELSE total_sales / lifespan
    END AS avg_monthly_revenue
FROM product_aggregations;

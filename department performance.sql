--- Monthly sales performance
SELECT 
    EXTRACT(YEAR FROM sold_at) as year,
    EXTRACT(MONTH FROM sold_at) as month,
    TO_CHAR(sold_at, 'Month') as month_name,
    COUNT(*) as items_sold,
    SUM(product_retail_price) as monthly_revenue
FROM inventory_items
WHERE sold_at IS NOT NULL
GROUP BY EXTRACT(YEAR FROM sold_at), EXTRACT(MONTH FROM sold_at), TO_CHAR(sold_at, 'Month')
ORDER BY year DESC, month DESC;


--- Best Selling Products
SELECT 
    product_name,
    product_brand,
    COUNT(*) AS units_sold,
    SUM(product_retail_price) AS revenue
FROM inventory_items
WHERE sold_at IS NOT NULL
GROUP BY product_name, product_brand
ORDER BY revenue DESC;


--- Category Performance
SELECT 
    product_category,
    COUNT(*) AS items_sold,
    SUM(product_retail_price) AS revenue,
    SUM(product_retail_price - cost) AS profit
FROM inventory_items
WHERE sold_at IS NOT NULL
GROUP BY product_category
ORDER BY revenue DESC;


---Distribution Center Performance
SELECT 
    product_distribution_center_id,
    COUNT(*) AS items_sold,
    SUM(product_retail_price) AS revenue
FROM inventory_items
WHERE sold_at IS NOT NULL
GROUP BY product_distribution_center_id
ORDER BY revenue DESC;


---Department Performance
SELECT 
    product_department,
    COUNT(*) AS units_sold,
    SUM(product_retail_price) AS revenue
FROM inventory_items
WHERE sold_at IS NOT NULL
GROUP BY product_department
ORDER BY units_sold DESC;


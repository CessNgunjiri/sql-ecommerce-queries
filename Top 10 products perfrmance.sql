SELECT 
    product_department,
    COUNT(*) AS units_sold,
    SUM(product_retail_price) AS revenue
FROM inventory_items
WHERE sold_at IS NOT NULL
GROUP BY product_department
ORDER BY units_sold DESC;


--Top 10 Products Performance
SELECT 
    product_name,
    product_brand,
    COUNT(*) AS units_sold,
    SUM(product_retail_price) AS revenue
FROM inventory_items
WHERE sold_at IS NOT NULL
GROUP BY product_name, product_brand
ORDER BY revenue DESC
LIMIT 10;



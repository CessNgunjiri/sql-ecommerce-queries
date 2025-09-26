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


--- Top 20 Brand Performance
SELECT 
    product_brand,
    COUNT(*) AS items_sold,
    SUM(product_retail_price) AS revenue,
    SUM(product_retail_price - cost) AS profit
FROM inventory_items
WHERE sold_at IS NOT NULL
GROUP BY product_brand
ORDER BY revenue DESC
LIMIT 20;

SELECT 
    p.category,
    COUNT(*) AS units_sold,
    SUM(p.retail_price) AS revenue
FROM inventory_items i
JOIN products p ON i.product_id = p.id
WHERE i.sold_at IS NOT NULL
GROUP BY p.category
ORDER BY revenue DESC;


--- Sales by month
SELECT 
    EXTRACT(YEAR FROM i.sold_at) AS year,
    EXTRACT(MONTH FROM i.sold_at) AS month,
    TO_CHAR(i.sold_at, 'Month') AS month_name,
    SUM(p.retail_price) AS monthly_revenue,
    COUNT(*) AS units_sold
FROM inventory_items i
JOIN products p ON i.product_id = p.id
WHERE i.sold_at IS NOT NULL
GROUP BY year, month, month_name
ORDER BY year DESC, month DESC;

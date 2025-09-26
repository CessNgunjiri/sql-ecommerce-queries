SELECT 
    p.category,
    COUNT(*) AS units_sold,
    SUM(p.retail_price) AS revenue
FROM inventory_items i
JOIN products p ON i.product_id = p.id
WHERE i.sold_at IS NOT NULL
GROUP BY p.category
ORDER BY revenue DESC;

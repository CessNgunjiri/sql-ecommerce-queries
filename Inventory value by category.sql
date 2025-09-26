SELECT 
    p.category,
    SUM(p.cost) AS total_inventory_value,
    COUNT(DISTINCT p.id) AS unique_products
FROM products p
GROUP BY p.category
ORDER BY total_inventory_value DESC;
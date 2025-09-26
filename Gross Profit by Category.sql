SELECT 
    p.category,
    SUM(p.cost) AS total_inventory_value,
    COUNT(DISTINCT p.id) AS unique_products
FROM products p
GROUP BY p.category
ORDER BY total_inventory_value DESC;



--- Which warehouses hold the most stock (by cost value)
SELECT 
    p.distribution_center_id,
    COUNT(*) AS total_items,
    SUM(p.cost) AS inventory_value
FROM products p
GROUP BY p.distribution_center_id
ORDER BY inventory_value DESC;


--- Gross Profit by Category
SELECT 
    p.category,
    SUM(p.retail_price - p.cost) AS gross_profit
FROM inventory_items i
JOIN products p ON i.product_id = p.id
WHERE i.sold_at IS NOT NULL
GROUP BY p.category
ORDER BY gross_profit DESC;

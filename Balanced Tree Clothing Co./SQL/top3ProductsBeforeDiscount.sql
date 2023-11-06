SELECT s.prod_id, p.product_name, SUM(s.qty * s.price) AS revenueBeforeDiscount
FROM balanced_tree.sales s
JOIN balanced_tree.product_details p ON s.prod_id = p.product_id
GROUP BY s.prod_id, p.product_name
ORDER BY revenueBeforeDiscount DESC
LIMIT 3;
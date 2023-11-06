SELECT
    DISTINCT ON (p.category_name)
    p.category_name AS segment,
    p.product_name,
    SUM(s.qty) AS totalQuantity
FROM balanced_tree.sales s
    JOIN balanced_tree.product_details p ON s.prod_id = p.product_id
GROUP BY p.category_name, p.product_name
ORDER BY p.category_name, totalQuantity DESC;

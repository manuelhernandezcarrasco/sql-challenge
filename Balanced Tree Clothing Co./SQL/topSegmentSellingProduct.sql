SELECT
    DISTINCT ON (p.segment_name)
    p.segment_name AS segment,
    p.product_name,
    SUM(s.qty) AS totalQuantity
FROM balanced_tree.sales s
    JOIN balanced_tree.product_details p ON s.prod_id = p.product_id
GROUP BY p.segment_name, p.product_name
ORDER BY p.segment_name, totalQuantity DESC;
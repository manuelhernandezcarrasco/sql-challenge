SELECT
    p.product_name AS product,
    SUM(s.qty) / COUNT(DISTINCT s.txn_id) AS penetration
FROM balanced_tree.product_details p
         JOIN balanced_tree.sales s ON p.product_id = s.prod_id
GROUP BY p.product_name;

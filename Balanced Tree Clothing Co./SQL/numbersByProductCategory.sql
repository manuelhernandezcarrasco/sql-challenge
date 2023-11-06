SELECT
    p.category_name AS category,
    SUM(s.qty) AS totalQuantity,
    SUM(s.qty * s.price) AS totalRevenue,
    ROUND(CAST(SUM(s.qty * s.price * FLOAT4DIV(s.discount, 100)) AS NUMERIC), 2) AS totalDiscount
FROM balanced_tree.sales s
         JOIN balanced_tree.product_details p ON s.prod_id = p.product_id
GROUP BY p.category_name;

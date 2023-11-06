SELECT
    p.category_name AS category,
    ROUND(CAST(SUM(s.qty * s.price * FLOAT4DIV(s.discount, 100)) / SUM(SUM(s.qty * s.price * FLOAT4DIV(s.discount, 100))) OVER () AS NUMERIC), 2) AS percentageSplit
FROM balanced_tree.sales s
         JOIN balanced_tree.product_details p ON s.prod_id = p.product_id
GROUP BY p.category_name;

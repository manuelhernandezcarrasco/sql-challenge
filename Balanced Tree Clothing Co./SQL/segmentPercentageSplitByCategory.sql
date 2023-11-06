SELECT
    p.category_name AS category,
    p.segment_name as segment,
    ROUND(CAST(SUM(s.qty * s.price * FLOAT4DIV(s.discount, 100)) / SUM(SUM(s.qty * s.price * FLOAT4DIV(s.discount, 100))) OVER (PARTITION BY p.category_name) AS NUMERIC), 2) AS percentageSplit
FROM balanced_tree.product_details p
         JOIN balanced_tree.sales s ON p.product_id = s.prod_id
GROUP BY p.category_name, p.segment_name;

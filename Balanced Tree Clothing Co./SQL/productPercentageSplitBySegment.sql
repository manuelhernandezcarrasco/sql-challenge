SELECT
    p.segment_name AS segment,
    p.product_name AS product,
    ROUND(CAST(SUM(s.qty * s.price * FLOAT4DIV(s.discount, 100)) / SUM(SUM(s.qty * s.price * FLOAT4DIV(s.discount, 100))) OVER (PARTITION BY p.segment_name) AS NUMERIC), 2) AS percentageSplit
FROM balanced_tree.product_details p
         JOIN balanced_tree.sales s ON p.product_id = s.prod_id
GROUP BY p.segment_name, p.product_name;


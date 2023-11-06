SELECT ROUND(CAST(SUM(s.qty * s.price * FLOAT4DIV(s.discount, 100)) AS NUMERIC), 2) AS totalDiscount
FROM balanced_tree.sales s;
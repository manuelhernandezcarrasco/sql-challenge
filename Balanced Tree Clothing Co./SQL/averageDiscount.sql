SELECT ROUND(AVG(CAST(s.qty * s.price * FLOAT4DIV(s.discount, 100) AS NUMERIC)), 2) AS averagediscount
FROM balanced_tree.sales s;

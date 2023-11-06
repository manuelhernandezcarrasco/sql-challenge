SELECT
    s.member,
    ROUND(AVG(CAST(s.qty * s.price * FLOAT4DIV(s.discount, 100) AS NUMERIC)), 2) AS averageRevenue
FROM balanced_tree.sales s
GROUP BY s.member;

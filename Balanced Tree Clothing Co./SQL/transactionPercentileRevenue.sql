SELECT
    salesRevenue.transactionId,
    PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY salesRevenue.revenue) AS p25,
    PERCENTILE_CONT(0.50) WITHIN GROUP (ORDER BY salesRevenue.revenue) AS p50,
    PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY salesRevenue.revenue) AS p75
FROM (
    SELECT s.txn_id AS transactionId, ROUND(s.qty * s.price * FLOAT4DIV(s.discount, 100)) AS revenue
    FROM balanced_tree.sales s
    ) AS salesRevenue
GROUP BY salesRevenue.transactionId;

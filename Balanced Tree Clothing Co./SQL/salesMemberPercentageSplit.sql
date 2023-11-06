SELECT
    s.member,
    (COUNT(DISTINCT s.txn_id) / SUM(COUNT(DISTINCT s.txn_id)) OVER ()) * 100 AS percentageSplit
FROM balanced_tree.sales s
GROUP BY s.member;

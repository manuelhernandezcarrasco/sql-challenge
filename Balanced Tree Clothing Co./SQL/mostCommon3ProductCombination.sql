SELECT COUNT(DISTINCT product1.txn_id) AS combinationCount
FROM balanced_tree.sales product1
JOIN balanced_tree.sales product2 ON product1.txn_id = product2.txn_id AND product1.prod_id != product2.prod_id
JOIN balanced_tree.sales product3 ON product2.txn_id = product3.txn_id AND (product1.prod_id != product3.prod_id AND product2.prod_id != product3.prod_id)
GROUP BY
    product1.prod_id,
    product2.prod_id,
    product3.prod_id
ORDER BY combinationCount DESC
LIMIT 1;
SELECT COUNT(DISTINCT s.txn_id) AS totalTransactions
FROM balanced_tree.sales s;
SELECT SUM(s.qty * s.price) AS revenueBeforeDiscount
FROM balanced_tree.sales s;
SELECT ROUND(AVG(products)) AS averageProducts
FROM (
     SELECT COUNT(s.prod_id) AS products
     FROM balanced_tree.sales s
     GROUP BY s.txn_id
 ) AS countProducts;
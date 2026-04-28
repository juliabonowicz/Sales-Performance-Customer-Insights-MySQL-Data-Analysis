WITH calc AS (SELECT p.productLine, SUM(od.priceEach*od.quantityOrdered) AS revenue 
FROM products p 
LEFT JOIN orderdetails od
ON od.productCode=p.productCode
GROUP BY p.productLine)
SELECT productLine,revenue, 
ROUND(revenue / SUM(revenue) OVER () * 100, 2) AS revenue_share_pct
FROM calc
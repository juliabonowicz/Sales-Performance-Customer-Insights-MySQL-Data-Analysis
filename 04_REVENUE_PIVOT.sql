WITH before_pivot AS (SELECT p.productLine, YEAR(o.orderDate) AS year, SUM(od.priceEach*od.quantityOrdered) AS revenue
FROM products p 
INNER JOIN orderdetails od
ON od.productCode=p.productCode
INNER JOIN orders o
ON o.orderNumber=od.orderNumber
GROUP BY p.productLine,year)
SELECT productLine,
SUM(CASE WHEN year = 2003 THEN revenue END) AS `2003`,
SUM(CASE WHEN year = 2004 THEN revenue END) AS `2004`,
SUM(CASE WHEN year = 2005 THEN revenue END) AS `2005` 
FROM before_pivot
GROUP BY productLine
ORDER BY productLine
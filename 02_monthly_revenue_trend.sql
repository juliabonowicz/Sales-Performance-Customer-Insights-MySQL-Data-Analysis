WITH calculations AS (SELECT YEAR(o.orderDate) AS year ,MONTH(o.orderDate) AS month, 
SUM(ROUND((od.quantityOrdered*od.priceEach),2)) AS monthly_revenue
FROM orders o
LEFT JOIN orderdetails od
ON od.orderNumber=o.orderNumber
GROUP BY year,month)
SELECT year,month,monthly_revenue, LAG(monthly_revenue) OVER (ORDER BY year,month)
FROM calculations
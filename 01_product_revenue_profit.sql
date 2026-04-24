WITH sales as (SELECT p.productName, sum( od.priceEach * od.quantityOrdered ) as total_revenue, sum(( od.priceEach - p.buyPrice)* od.quantityOrdered ) as total_profit FROM products p 
LEFT JOIN orderdetails od
ON p.productCode = od.productCode
GROUP BY p.productName )

SELECT productName, total_revenue, total_profit, round(total_profit/total_revenue*100,2) as profit_margin
FROM sales
ORDER BY total_revenue DESC
LIMIT 5;
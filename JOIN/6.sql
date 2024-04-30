SELECT LastName
FROM customers c, sales s, sales_items s_i
WHERE c.CustomerId = s.CustomerId and s.SalesId = s_i.SalesId
GROUP BY c.CustomerId
HAVING SUM(s_i.Quantity) > 30;

SELECT LastName
FROM customers
WHERE customerId IN (
    SELECT c.customerId
    FROM customers c
    JOIN sales s ON c.customerId = s.customerId
    JOIN sales_items si ON s.SalesId = si.SalesId
    GROUP BY c.customerId
    HAVING COUNT(si.Quantity) > 30
);
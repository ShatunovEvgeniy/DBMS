SELECT FirstName, LastName 
FROM customers c 
WHERE Country = "Germany" AND c.CustomerId IN (
	SELECT s.CustomerId 
	FROM sales s
	WHERE date(s.SalesDate) > DATE('2009-01-01') AND DATE(s.SalesDate) < DATE('2009-12-31') AND s.ShipCity = "Berlin"
	); 
	
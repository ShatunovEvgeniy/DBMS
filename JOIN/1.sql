SELECT sum(UnitPrice * Quantity) 
FROM sales_items JOIN sales
ON sales.SalesId = sales_items.SalesId
WHERE ShipCountry = "USA" AND SalesDate >= "2012-01-01" AND SalesDate < "2012-04-01";

SELECT sum(UnitPrice * Quantity)
FROM sales_items WHERE (sales_items.SalesId IN (
	SELECT sales.SalesId FROM sales
	WHERE ShipCountry = "USA" AND SalesDate >= "2012-01-01" AND SalesDate < "2012-04-01" AND sales.SalesId IN (
		SELECT sales_items.SalesId FROM sales_items
		WHERE sales.SalesId = sales_items.SalesId 
		)
	)		
);

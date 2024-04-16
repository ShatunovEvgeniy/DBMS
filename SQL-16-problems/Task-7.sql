SELECT ShipCity
FROM sales
WHERE strftime('%m', SalesDate) IN ('08', '09') and ShipCountry = 'Canada'
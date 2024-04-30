SELECT customers.FirstName 
FROM customers
WHERE(customers.FirstName NOT IN (
	SELECT employees.FirstName FROM employees))
GROUP BY customers.FirstName;


SELECT customers.FirstName 
FROM customers LEFT JOIN employees ON customers.FirstName = employees.FirstName
WHERE employees.FirstName IS NULL
GROUP BY customers.FirstName;  


SELECT c.FirstName 
FROM customers c
EXCEPT
SELECT e.FirstName
FROM employees e;

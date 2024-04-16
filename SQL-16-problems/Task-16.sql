SELECT LastName
FROM employees
WHERE HireDate = (SELECT MIN(HireDate) FROM employees);
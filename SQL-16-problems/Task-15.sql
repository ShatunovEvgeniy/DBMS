SELECT LastName
FROM employees
WHERE strftime('%m', HireDate) in ('10');
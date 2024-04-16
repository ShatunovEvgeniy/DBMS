SELECT LastName ||','|| FirstName
FROM employees
where city='Calgary' and HireDate >= date('2002-01-01') and HireDate < date('2003-01-01');
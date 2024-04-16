SELECT LastName ||','|| FirstName
FROM employees
where HireDate - BirthDate >= 40;
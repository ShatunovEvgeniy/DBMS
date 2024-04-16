SELECT Country, AVG(Age) AS AverageAge
FROM customers
GROUP BY Country;
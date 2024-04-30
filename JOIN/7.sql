SELECT g.Name, AVG(t.UnitPrice) AS AveragePrice
FROM genres g JOIN tracks t ON t.GenreId =  g.GenreId 
GROUP BY g.Name; 
SELECT a.Title, (SELECT COUNT(*) 
	FROM tracks t
	WHERE t.AlbumId = a.AlbumId) AS CountOfTrack
FROM albums a;

SELECT a.Title, COUNT(*) AS CountOfTrack
FROM albums a JOIN tracks t ON a.AlbumId = t.AlbumId
GROUP BY a.Title;
SELECT ROUND(AVG(average_personally.value), 2) AS Average FROM(
	WITH first_times AS (
		SELECT user_id, MIN(time) AS first_time
	    FROM LOG
	    GROUP BY user_id
	),
	bet_times AS (
	    SELECT user_id, MIN(time) AS bet_time
		FROM LOG	
		WHERE bet != ""
		GROUP BY user_id
	)
	SELECT AVG(julianday(bet_time) - julianday(first_time)) AS value
	FROM bet_times
	JOIN first_times ON bet_times.user_id = first_times.user_id
	GROUP BY first_times.user_id) AS average_personally;

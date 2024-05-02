SELECT AVG(sub.avg_win_percentage) FROM (
	SELECT
	    user_id, AVG(100.0 * (win - bet) / bet) AS avg_win_percentage
	FrOM LOG
	GROUP BY user_id) AS sub;
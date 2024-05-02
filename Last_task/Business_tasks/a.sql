SELECT ROUND(AVG(sub.count), 0) FROM
    (SELECT COUNT(DISTINCT time) as count
    FROM LOG
    GROUP BY user_id) as sub;
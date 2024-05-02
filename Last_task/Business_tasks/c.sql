SELECT
    user_id,
    SUM(win - bet) AS balance
FROM LOG
GROUP BY user_id;
SELECT
    USERS.geo AS city,
    ROUND(AVG(LOG.bet), 2) AS avg_bet
FROM LOG JOIN USERS ON LOG.user_id = USERS.user_id
GROUP BY USERS.geo
ORDER BY avg_bet DESC;
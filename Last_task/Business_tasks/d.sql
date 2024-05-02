SELECT
    USERS.geo AS city,
    SUM(LOG.win - LOG.bet) AS total_profit,
    SUM(LOG.bet) AS total_bet,
    ROUND(SUM(LOG.win - LOG.bet) / SUM(LOG.bet), 2) AS profitability_ratio
FROM LOG JOIN USERS ON LOG.user_id = USERS.user_id
GROUP BY USERS.geo
ORDER BY profitability_ratio DESC;

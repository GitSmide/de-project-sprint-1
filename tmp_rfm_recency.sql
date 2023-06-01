INSERT INTO analysis.tmp_rfm_recency (user_id, recency)
SELECT user_id, NTILE(5) OVER (ORDER BY "date") AS recency
FROM (
	SELECT id AS user_id, COALESCE("date", '1970-01-01') AS "date"
	FROM (
		SELECT user_id, MAX(CAST(order_ts AS date)) AS "date"
		FROM analysis.orders
		WHERE status = 4
		GROUP BY user_id) AS dates 
	RIGHT JOIN analysis.users AS u ON u.id=dates.user_id) AS null_dates
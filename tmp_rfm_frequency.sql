INSERT INTO analysis.tmp_rfm_frequency (user_id, frequency)
SELECT user_id, NTILE(5) OVER (ORDER BY "count") AS frequency
FROM (
	SELECT id AS user_id, COALESCE("count", 0) AS "count"
	FROM (
		SELECT user_id, COUNT(*) AS "count"
		FROM analysis.orders
		WHERE status = 4
		GROUP BY user_id) AS counts
	RIGHT JOIN analysis.users AS u ON u.id=counts.user_id) AS null_counts
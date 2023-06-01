INSERT INTO analysis.tmp_rfm_monetary_value (user_id, monetary_value)
SELECT user_id, NTILE(5) OVER (ORDER BY "sum") AS monetary_value
FROM (
	SELECT id AS user_id, COALESCE("sum", 0) AS "sum"
	FROM (
		SELECT user_id, SUM(payment) AS "sum"
		FROM analysis.orders
		WHERE status = 4
		GROUP BY user_id) AS sums
	RIGHT JOIN analysis.users AS u ON u.id=sums.user_id) AS null_sums
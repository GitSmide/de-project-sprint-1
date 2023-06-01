CREATE OR REPLACE VIEW analysis.orders AS
SELECT o.order_id, o.order_ts, o.user_id, o.bonus_payment,
o.payment, o.cost, o.bonus_grant ,ol.status_id AS status
FROM analysis.orders AS o 
RIGHT JOIN (
	SELECT order_id, status_id, MAX(dttm) AS "date"
	FROM analysis.orderstatuslog
	GROUP BY order_id, status_id)
AS ol ON o.order_id = ol.order_id
WHERE "date"=order_ts
-- удаляем старое представление. логика описана в txt файле
-- DROP VIEW analysis.orders;

-- создаем новое представление с помощью уже двух таблиц
CREATE VIEW analysis.orders AS
SELECT o.order_id, o.order_ts, o.user_id, o.bonus_payment, 
o.payment, o.cost, o.bonus_grant ,a.status_id
FROM (SELECT	order_id ,status_id ,dttm
		,max(dttm) OVER(PARTITION BY order_id) AS max_dt
	FROM production.orderstatuslog
	ORDER  BY order_id) AS a 
JOIN production.orders AS o ON a.order_id=o.order_id
WHERE dttm=max_dt
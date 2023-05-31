-- создаем новый столбец для orders
ALTER TABLE analysis.orders
ADD status_id int2 CHECK(status_id >= 1 AND status_id <= 5)

-- заполняем столбец
UPDATE analysis.orders AS o 
SET status_id = f.status_id
FROM (
    SELECT a.order_id, b.status_id
FROM 
(SELECT order_id, MAX(dttm) AS "date"
FROM analysis.orderstatuslog
GROUP BY order_id) a 
LEFT JOIN analysis.orderstatuslog AS b ON a.order_id=b.order_id
WHERE "date"=dttm
    ) AS f
WHERE o.order_id = f.order_id;


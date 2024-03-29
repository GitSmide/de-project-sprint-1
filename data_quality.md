# 1.3. Качество данных

## Оцените, насколько качественные данные хранятся в источнике.
Проверяем данные с таблиц которые мы будем использовать, а это **order** и **user**. Проверим на дубли, соответвие кол-ва уникальных ключей к общему числу строк, ограничения, типы данных и null-данные в таблицах.

Вывод: В результате проверки дублей не найдено, null значения не найдены, ограничения допустимые, типы данных соотвествуют.

## Укажите, какие инструменты обеспечивают качество данных в источнике.
Ответ запишите в формате таблицы со следующими столбцами:
- `Наименование таблицы` - наименование таблицы, объект которой рассматриваете.
- `Объект` - Здесь укажите название объекта в таблице, на который применён инструмент. Например, здесь стоит перечислить поля таблицы, индексы и т.д.
- `Инструмент` - тип инструмента: первичный ключ, ограничение или что-то ещё.
- `Для чего используется` - здесь в свободной форме опишите, что инструмент делает.


| Таблицы             | Объект                      | Инструмент      | Для чего используется |
| ------------------- | --------------------------- | --------------- | --------------------- |
| production.orders | order_id int NOT NULL PRIMARY KEY | Первичный ключ  | Оставляет только уникальые значения заказа |
|production.orders|CHECK ((cost = (payment + bonus_payment)))|Проверка|Проверяет что итоговая сумма равна сумме + чай|
|production.users|order_id int NOT NULL PRIMARY KEY| Первичный ключ  | Оставляет только уникальые значения клиента|
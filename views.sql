CREATE TABLE analysis.orders AS SELECT * FROM production.orders;
CREATE TABLE analysis.users AS SELECT * FROM production.users;
CREATE TABLE analysis.orderitems AS SELECT * FROM production.orderitems;
CREATE TABLE analysis.products AS SELECT * FROM production.products;
CREATE TABLE analysis.orderstatuses AS SELECT * FROM production.orderstatuses;
CREATE TABLE analysis.orderstatuslog AS SELECT * FROM production.orderstatuslog;
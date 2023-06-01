CREATE TABLE analysis.dm_rfm_segments (
client_id int4 NOT NULL PRIMARY KEY,
recency int2 NOT NULL CHECK(recency >= 1 AND recency <= 5),
frequency int2 NOT NULL CHECK(frequency >= 1 AND frequency <= 5),
monetary_value int2 NOT NULL CHECK(monetary_value >= 1 AND monetary_value <= 5)
);
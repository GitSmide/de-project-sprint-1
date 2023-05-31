INSERT INTO analysis.dm_rfm_segments (client_id, recency, frequency, monetary_value)
SELECT r.user_id, recency, frequency, monetary_value 
FROM analysis.tmp_rfm_recency AS r 
JOIN analysis.tmp_rfm_frequency AS f ON r.user_id=f.user_id
JOIN analysis.tmp_rfm_monetary_value AS m ON r.user_id=m.user_id
/*
id  r   f   mv
0	1	3	4
1	4	3	3
2	2	3	5
3	2	4	3
4	3	3	3
5	4	5	5
6	1	3	5
7	4	2	2
8	1	1	3
9	1	2	2
*/

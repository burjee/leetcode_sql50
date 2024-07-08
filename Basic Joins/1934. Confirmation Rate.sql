SELECT s.user_id,
       ROUND(AVG(CASE
                     WHEN c.action = 'confirmed' THEN 1
                     ELSE 0
                 END), 2) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c ON s.user_id = c.user_id
GROUP BY s.user_id;

-- SELECT s.user_id,
--        COALESCE(ROUND(c2.c::NUMERIC / c1.c::NUMERIC, 2), 0) AS confirmation_rate
-- FROM Signups s
-- LEFT JOIN
--     (SELECT user_id,
--             COUNT(user_id) c
--      FROM Confirmations
--      GROUP BY user_id) c1 ON s.user_id = c1.user_id
-- LEFT JOIN
--     (SELECT user_id,
--             COUNT(user_id) c
--      FROM Confirmations
--      WHERE action = 'confirmed'
--      GROUP BY user_id) c2 ON s.user_id = c2.user_id;
SELECT ROUND(COUNT(player_id) FILTER (
                                      WHERE a2_date IS NOT NULL)::DECIMAL / COUNT(player_id)::DECIMAL, 2) AS fraction
FROM
    (SELECT DISTINCT ON (a1.player_id) a1.player_id,
                        a1.event_date AS a1_date,
                        a2.event_date AS a2_date
     FROM Activity a1
     LEFT JOIN Activity a2 ON a1.player_id = a2.player_id
     AND a1.event_date + INTERVAL '1 DAY' = a2.event_date
     ORDER BY a1.player_id ASC, a1.event_date ASC);

-- SELECT ROUND(COUNT(player_id)::DECIMAL /
--                  (SELECT COUNT(DISTINCT player_id)
--                   FROM Activity)::DECIMAL, 2) AS fraction
-- FROM Activity
-- WHERE (player_id,
--        event_date) IN
--         (SELECT player_id,
--                 MIN(event_date) + INTERVAL '1 DAY'
--          FROM Activity
--          GROUP BY player_id);
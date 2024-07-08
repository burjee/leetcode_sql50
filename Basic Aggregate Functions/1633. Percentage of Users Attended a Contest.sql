SELECT contest_id,
       ROUND (COUNT(user_id)::DECIMAL /
                  (SELECT COUNT(*)
                   FROM Users)::DECIMAL * 100, 2) AS percentage
FROM Register
GROUP BY contest_id
ORDER BY percentage DESC,
         contest_id ASC;
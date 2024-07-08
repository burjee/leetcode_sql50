SELECT person_name
FROM
    (SELECT person_name,
            SUM(weight) OVER (
                              ORDER BY turn ASC) AS total_weight
     FROM Queue)
WHERE total_weight <= 1000
ORDER BY total_weight DESC
LIMIT 1;

-- SELECT q1.person_name
-- FROM Queue q1
-- LEFT JOIN Queue q2 ON q1.turn >= q2.turn
-- GROUP BY q1.person_name
-- HAVING SUM(q2.weight) <= 1000
-- ORDER BY SUM(q2.weight) DESC
-- LIMIT 1;
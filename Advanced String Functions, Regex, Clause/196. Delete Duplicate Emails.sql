DELETE
FROM Person p1 USING Person p2
WHERE p1.id > p2.id
    AND p1.email = p2.email;

-- DELETE
-- FROM Person
-- WHERE id NOT IN
--         (SELECT MIN(id)
--          FROM Person
--          GROUP BY email);
 -- DELETE
-- FROM Person
-- WHERE id IN
--         (SELECT id
--          FROM
--              (SELECT id,
--                      ROW_NUMBER() OVER (PARTITION BY email
--                                         ORDER BY id ASC) AS n
--               FROM Person)
--          WHERE n > 1);
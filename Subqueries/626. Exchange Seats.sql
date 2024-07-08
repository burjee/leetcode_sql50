SELECT id,
       COALESCE(CASE id % 2
                    WHEN 1 THEN LEAD(student) OVER (
                                                    ORDER BY id ASC)
                    WHEN 0 THEN LAG(student) OVER (
                                                   ORDER BY id ASC)
                END, student) AS student
FROM Seat
ORDER BY id ASC;

-- SELECt (CASE
--             WHEN id % 2 = 1
--                  AND id =
--                      (SELECT MAX(id)
--                       FROM Seat) THEN id
--             WHEN id % 2 = 1 THEN id + 1
--             WHEN id % 2 = 0 THEN id - 1
--         END) AS id,
--        student
-- FROM Seat
-- ORDER BY id ASC;
 --
-- SELECT s1.id,
--        (CASE s1.id % 2
--             WHEN 1 THEN COALESCE(s2.student, s1.student)
--             WHEN 0 THEN s3.student
--         END) AS student
-- FROM Seat s1
-- LEFT JOIN Seat s2 ON s1.id + 1 = s2.id
-- AND s1.id % 2 = 1
-- LEFT JOIN Seat s3 ON s1.id - 1 = s3.id
-- AND s1.id % 2 = 0
-- ORDER BY s1.id ASC;
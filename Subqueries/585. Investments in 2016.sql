SELECT ROUND(SUM(tiv_2016)::DECIMAL, 2) AS tiv_2016
FROM Insurance
WHERE (lat,
       lon) IN
        (SELECT lat,
                lon
         FROM Insurance
         GROUP BY lat,
                  lon
         HAVING COUNT(lat) = 1)
    AND tiv_2015 IN
        (SELECT tiv_2015
         FROM Insurance
         GROUP BY tiv_2015
         HAVING COUNT(tiv_2015) > 1);

-- SELECT ROUND(SUM(i1.tiv_2016)::DECIMAL, 2) AS tiv_2016
-- FROM
--     (SELECT pid,
--             tiv_2016,
--             COUNT(tiv_2015) OVER (PARTITION BY tiv_2015) AS c
--      FROM Insurance) i1
-- INNER JOIN
--     (SELECT MIN(pid) AS pid,
--             MIN(tiv_2016) AS tiv_2016
--      FROM Insurance
--      GROUP BY lat,
--               lon
--      HAVING COUNT(tiv_2016) = 1) i2 ON i1.pid = i2.pid
-- WHERE c > 1;
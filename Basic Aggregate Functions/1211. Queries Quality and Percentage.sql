SELECT query_name,
       ROUND(AVG(rating::DECIMAL / position::DECIMAL), 2) AS quality,
       ROUND((COUNT(rating) FILTER(
                                   WHERE rating < 3)::DECIMAL / COUNT(rating)::DECIMAL * 100), 2) AS poor_query_percentage
FROM Queries
WHERE query_name IS NOT NULL
GROUP BY query_name;

-- SELECT query_name,
--        ROUND(AVG(rating::DECIMAL / position::DECIMAL), 2) AS quality,
--        ROUND((SUM(CASE
--                       WHEN rating < 3 THEN 1
--                       ELSE 0
--                   END)::DECIMAL / COUNT(rating)::DECIMAL * 100), 2) AS poor_query_percentage
-- FROM Queries
-- WHERE query_name IS NOT NULL
-- GROUP BY query_name;
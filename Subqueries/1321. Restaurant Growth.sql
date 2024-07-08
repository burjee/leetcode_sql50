WITH skip_6_days AS
    (SELECT DISTINCT visited_on
     FROM Customer
     ORDER BY visited_on ASC
     OFFSET 6)
SELECT s.visited_on,
       SUM(c.amount) AS amount,
       ROUND(SUM(c.amount)::DECIMAL / 7::DECIMAL, 2) AS average_amount
FROM skip_6_days s
LEFT JOIN Customer c ON c.visited_on BETWEEN s.visited_on + INTERVAL '-6 DAY' AND s.visited_on
GROUP BY s.visited_on
ORDER BY s.visited_on ASC;
SELECT TO_CHAR(trans_date, 'YYYY-MM') AS month,
       country,
       COUNT(id) AS trans_count,
       COUNT(id) FILTER(
                        WHERE state = 'approved') AS approved_count,
       SUM(amount) AS trans_total_amount,
       SUM(CASE
               WHEN state = 'approved' THEN amount
               ELSE 0
           END) AS approved_total_amount
FROM Transactions
GROUP BY month,
         country;
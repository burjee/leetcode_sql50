SELECT ROUND(COUNT(customer_id) FILTER (
                                        WHERE order_date = customer_pref_delivery_date )::DECIMAL / COUNT(customer_id) * 100, 2) AS immediate_percentage
FROM
    (SELECT customer_id,
            order_date,
            customer_pref_delivery_date,
            ROW_NUMBER() OVER(PARTITION BY customer_id
                              ORDER BY order_date ASC) AS n
     FROM Delivery)
WHERE n = 1;

-- SELECT ROUND(COUNT(customer_id) FILTER (
--                                         WHERE order_date = customer_pref_delivery_date )::DECIMAL / COUNT(customer_id) * 100, 2) AS immediate_percentage
-- FROM
--     (SELECT DISTINCT ON (customer_id) customer_id,
--                         order_date,
--                         customer_pref_delivery_date
--      FROM Delivery
--      ORDER BY customer_id,
--               order_date ASC);
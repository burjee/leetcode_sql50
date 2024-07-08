SELECT name
FROM Customer
WHERE referee_id <> 2
    OR referee_id IS NULL;

-- SELECT name
-- FROM Customer
-- WHERE referee_id IS DISTINCT
--     FROM 2;
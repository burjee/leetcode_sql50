SELECT e1.name
FROM Employee e1
LEFT JOIN
    (SELECT managerId,
            COUNT(managerId) AS c
     FROM Employee
     GROUP BY managerId) e2 ON e1.id = e2.managerId
WHERE e2.c >= 5;
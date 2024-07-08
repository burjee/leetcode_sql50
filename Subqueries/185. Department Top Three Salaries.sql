SELECT d.name AS Department,
       e.Employee,
       e.Salary
FROM
    (SELECT name AS Employee,
            Salary,
            departmentId,
            DENSE_RANK() OVER (PARTITION BY departmentId
                               ORDER BY salary DESC) AS rk
     FROM Employee) e
LEFT JOIN Department d ON e.departmentId = d.id
WHERE e.rk <= 3;
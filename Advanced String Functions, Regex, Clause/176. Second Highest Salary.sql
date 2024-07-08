SELECT COALESCE(
                    (SELECT DISTINCT salary
                     FROM Employee
                     ORDER BY salary DESC
                     OFFSET 1
                     LIMIT 1), NULL) AS SecondHighestSalary;

-- SELECT MAX(salary) AS SecondHighestSalary
-- FROM Employee
-- WHERE salary <
--         (SELECT MAX(salary)
--          FROM Employee);
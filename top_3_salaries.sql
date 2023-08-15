SELECT
    D.name AS Department,
    E.name AS Employee,
    E.salary AS Salary
FROM
    Department D
JOIN
    Employee E ON D.id = E.departmentId
WHERE
    (
        SELECT COUNT(DISTINCT salary)
        FROM Employee E2
        WHERE E2.departmentId = E.departmentId AND E2.salary >= E.salary
    ) <= 3
ORDER BY
    D.name, E.salary DESC;

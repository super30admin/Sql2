SELECT 
    Department.name AS "Department", 
    Employee.name AS "Employee", 
    Employee.salary AS "Salary"
FROM (
    SELECT 
        *, 
        DENSE_RANK() OVER (
            PARTITION BY departmentId 
            ORDER BY salary DESC
        ) AS salary_rank
    FROM Employee
) AS Employee
LEFT JOIN Department 
    ON Employee.departmentId = Department.id
WHERE salary_rank <= 3
ORDER BY Department.name, Employee.salary DESC, Employee.name;

-- withcte 
WITH cte AS (
    SELECT 
        d.name AS Department, 
        e.name AS Employee, 
        e.salary AS Salary,
        DENSE_RANK() OVER (
            PARTITION BY e.departmentId 
            ORDER BY e.salary DESC
        ) AS salary_rank
    FROM Employee e 
    LEFT JOIN Department d 
        ON e.departmentId = d.id
)
SELECT 
    Department, 
    Employee, 
    Salary
FROM cte 
WHERE salary_rank <= 3
ORDER BY Department, Salary DESC;


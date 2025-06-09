WITH ranks AS (
  SELECT
    d.name AS department,
    e.name AS employee,
    e.salary,
    DENSE_RANK() OVER(PARTITION BY d.id ORDER BY e.salary DESC) AS salary_rank
  FROM employee e
  JOIN department d
    ON d.id = e.departmentId
)
SELECT
  department,
  employee,
  salary
FROM ranks
WHERE salary_rank <= 3;

--Problem 4 

--Department top three salaries

--firstly join the two tables
--sort the rows by thier dense_rank as a new table
--then select top 3 of every department


SELECT department, employee, salary
FROM (
    SELECT e.name AS employee, e.salary, d.name AS department, dense_rank() OVER(PARTITION BY d.id ORDER BY e.salary DESC) AS `rank`
    FROM employee e
    INNER JOIN Department d ON e.departmentId = d.id
) AS new_table
WHERE `rank` <= 3;

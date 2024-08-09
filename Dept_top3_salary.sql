WITH CTE as (
    SELECT D.name as "Department", E.name as "Employee", E.Salary as "Salary", 
        Dense_rank() over(partition by D.name order by E.salary desc) as "rnk"
        From Employee E
        Left join Department D
        On D.id = E.departmentId
)

SELECT Department, Employee, Salary from CTE 
where rnk <=3
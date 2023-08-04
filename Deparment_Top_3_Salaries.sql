-- Using Window functions with cte

with cte as (
select d.name as Department, e.name as Employee,salary,DENSE_RANK() over (partition by d.name order by e.salary desc ) 
as rnks from Employee e 
join Department  d 
on e.departmentId =d.id 
)
select Department,Employee,salary from cte 
where rnks<=3
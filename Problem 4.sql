# Write your MySQL query statement below

with cte as(
    select e.id,e.name as Employee,e.salary as Salary,d.name as Department,dense_rank() over(partition by d.   name order by e.salary desc) as dens_col
    from employee e
    join Department d on e.departmentId = d.id)
    
    select Department,Employee,Salary
    from cte
    where dens_col <=3;
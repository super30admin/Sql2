/*
select d.name as Department, e.name as Employee, e.salary as Salary from employee e join department d on e.departmentid= d.id group by d.name order by salary desc;    

dense rank- ranks including the third rank for third value
rank()- leaves rank 3 for the third value 
with cte as(
select *, dense_rank() over(partition by departmentid order by salary desc) as rnk from employee order by id)
select d.name as department , cte.name as employee, cte.salary as salary from cte left join department d on cte.departmentid= d.id where cte.rnk<= 3; */


select d.name as department, e1.name as employee, e1.salary as salary from employee e1 join department d on e1.departmentid = d.id where 3> 
(select count(distinct e2.salary) from employee e2 where e2.salary > e1.salary and e1.departmentid = e2.departmentid);  
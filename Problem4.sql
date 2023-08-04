/*
1. First fetch the Department and Employee and Salary details with an inner join of Employee and Department tables
2. Use Dense_rank function to fetch the rank of Salaries by partitioning on Department and descending ordered by Salary.
3. To get the top 3 salaries of each dept. Just fetch those records whose rank is less than or equal to 3
-- Solved on Leetcode: Yes
-- Problems faced: None
*/

with
    cte
    as
    (
        select
            res.Department, res.Employee, res.Salary,
            DENSE_RANK() OVER (PARTITION BY res.Department ORDER BY res.Salary desc) 'Rank'
        from
            (
    select d.name 'Department', e.name 'Employee', e.salary 'Salary'
            from
                Employee e join Department d
                on e.departmentId = d.id
            order by d.name
    ) res
    )
select Department, Employee, Salary
from cte
where cte.Rank <=3


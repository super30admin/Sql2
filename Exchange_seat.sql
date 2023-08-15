# Write your MySQL query statement below
#The CASE statement is used to determine whether to swap the seat ID or not based on the conditions you've specified.
#When id % 2 = 0, it means the seat ID is even. In this case, we subtract 1 to swap the seat ID with the previous student.
#When id % 2 = 1 and the id is less than the maximum id value in the Seat table (indicating that we're not at the last student), we add 1 to swap the seat ID with the next student.



SELECT CASE
        WHEN mod(id, 2) != 0 and id < (select max(id) from Seat) THEN id + 1
        WHEN mod(id, 2) = 0 THEN id - 1 
        ELSE id
    END AS id,
    student
FROM Seat 
ORDER BY id ASC;

-- We create a CTE table which get the id, student and total count of students in the table - We us count over as we want total present in all rows
-- Then we use CASE WHEN - 
-- 1st condition is if mod of 2 is not zeo (i.e. the id is odd) and the id is not equal to the total, that means the id is odd and its not the last id, id + 1
-- 2nd condition if id mod of 2 is not zero and the id is equal to total, if that's the case then we keep the id as it is
-- else we do id - 1 for even numbers
-- We order by id as we want the output in ascending order 


WITH CTE AS (SELECT id, student, COUNT(*) OVER () AS total 
FROM Seat)

SELECT 
  CASE
    WHEN MOD(id,2) != 0 AND id != total THEN id + 1
    WHEN MOD(id,2) != 0 AND id = total THEN id
    ELSE id - 1
 END AS id, student 
 FROM CTE
 ORDER BY id;
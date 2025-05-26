# Write your MySQL query statement below
-- SELECT  count(id) from FROM seats;
-- SELECT MOD(id,2) AS 'mod' from seat;
-- SELECT  (
--     CASE
--         WHEN mod(id,2) !=0 AND id!=cnts THEN id+1
--         WHEN mod(id,2) !=0 AND id =cnts THEN id
--         ELSE id-1
--     END) AS 'id' ,student FROM Seat, (SELECT COUNT(*) as 'cnts' FROM Seat) AS SEAT_COUNTS  ORDER BY ID;
select s1.id, COALESCE (s2.student, s1.student) AS'student' FROM seat s1 LEFT JOIN seat s2 ON (s1.id +1)^1-1 = s2.id ORDER BY s1.id;
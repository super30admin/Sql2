# Write your MySQL query statement below
SELECT (
    CASE 
        WHEN mod(id,2) != 0 AND id != cnt THEN id+1
        WHEN mod(id,2) != 0 AND id = cnt THEN id
        ELSE id-1
    END
)AS 'id' , student FROM seat, (Select COUNT(*) AS cnt FROM SEAT) AS seat_counts ORDER BY id
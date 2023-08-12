-- We use a window function - dense_rank to rank the scores
-- we use rank in quotes as rank is a reserved keyword in MYSQL

SELECT score, DENSE_RANK() OVER (ORDER BY SCORE DESC) as 'rank'
FROM Scores;
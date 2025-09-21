/* Write your PL/SQL query statement below */
SELECT 
    score,
    DENSE_RANK() over(order by score desc) rank
FROM Scores;
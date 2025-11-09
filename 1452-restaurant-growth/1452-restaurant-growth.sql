/* Write your PL/SQL query statement below */
WITH daily_total AS (
    SELECT 
        visited_on, 'yyyy-mm-dd',
        SUM(amount) AS amount
    FROM Customer
    GROUP BY visited_on
)
SELECT 
    TO_CHAR(a.visited_on, 'yyyy-mm-dd') visited_on,
    SUM(b.amount) AS amount,
    ROUND(AVG(b.amount), 2) AS average_amount
FROM daily_total a
JOIN daily_total b
  ON b.visited_on BETWEEN a.visited_on - INTERVAL '6' DAY AND a.visited_on
GROUP BY a.visited_on
HAVING COUNT(b.visited_on) = 7
ORDER BY a.visited_on;
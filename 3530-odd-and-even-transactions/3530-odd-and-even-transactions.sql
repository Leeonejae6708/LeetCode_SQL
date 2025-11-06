/* Write your PL/SQL query statement below */
WITH even AS(
    SELECT transaction_date, SUM(amount) even_sum
    FROM transactions
    WHERE mod(amount, 2) = 0
    GROUP BY transaction_date
),
odd AS(
    SELECT transaction_date, SUM(amount) odd_sum
    FROM transactions
    WHERE mod(amount, 2) = 1
    GROUP BY transaction_date
)

SELECT 
    TO_CHAR(COALESCE(e.transaction_date, o.transaction_date), 'YYYY-MM-DD') transaction_date,
    CASE
        WHEN o.odd_sum IS NULL THEN 0
        ELSE o.odd_sum
    END odd_sum,
    CASE
        WHEN e.even_sum IS NULL THEN 0
        ELSE e.even_sum
    END even_sum
FROM even e FULL OUTER JOIN odd o
ON (e.transaction_date = o.transaction_date)
ORDER BY 1;
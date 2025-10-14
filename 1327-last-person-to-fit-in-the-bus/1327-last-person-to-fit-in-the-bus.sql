/* Write your PL/SQL query statement below */
WITH weight_summary AS (
    SELECT 
        person_name,
        SUM(weight) OVER (ORDER BY turn) AS total_weight
    FROM Queue
),
filtered AS (
    SELECT 
        person_name,
        total_weight
    FROM weight_summary
    WHERE total_weight <= 1000
    ORDER BY total_weight DESC
)
SELECT person_name
FROM filtered
WHERE ROWNUM = 1;

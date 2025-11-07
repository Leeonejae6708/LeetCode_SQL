/* Write your PL/SQL query statement below */
SELECT id, cnt AS num
FROM (
    SELECT id,
           COUNT(*) AS cnt,
           ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS rn
    FROM (
        SELECT requester_id AS id FROM RequestAccepted
        UNION ALL
        SELECT accepter_id AS id FROM RequestAccepted
    )
    GROUP BY id
)
WHERE rn = 1;
/* Write your PL/SQL query statement below */
SELECT user_id, MAX(time_stamp) AS last_stamp
FROM Logins
WHERE TO_CHAR(time_stamp, 'yyyy') = '2020'
GROUP BY user_id;
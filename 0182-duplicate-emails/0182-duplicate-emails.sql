/* Write your PL/SQL query statement below */
SELECT Email
FROM Person
GROUP BY email
HAVING count(*) > 1;
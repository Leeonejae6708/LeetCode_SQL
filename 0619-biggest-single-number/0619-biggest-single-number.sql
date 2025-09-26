/* Write your PL/SQL query statement below */
SELECT max(num) num
FROM (SELECT num
      FROM MyNumbers 
      GROUP BY num
      HAVING count(*) = 1);
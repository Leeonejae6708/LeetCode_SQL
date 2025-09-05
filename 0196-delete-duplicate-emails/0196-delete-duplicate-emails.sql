/* Write your PL/SQL query statement below */
DELETE FROM Person where id NOT IN (SELECT MIN(id) FROM Person GROUP BY Email)
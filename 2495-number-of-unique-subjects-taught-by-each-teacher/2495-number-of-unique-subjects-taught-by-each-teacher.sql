/* Write your PL/SQL query statement below */
SELECT DISTINCT teacher_id, count(DISTINCT subject_id) cnt
FROM Teacher
GROUP BY teacher_id;
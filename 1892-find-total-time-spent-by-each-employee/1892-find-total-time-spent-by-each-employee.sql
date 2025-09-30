/* Write your PL/SQL query statement below */
SELECT to_char(event_day, 'yyyy-mm-dd') day, emp_id, SUM(out_time - in_time) total_time
FROM Employees
GROUP BY emp_id, event_day
ORDER BY 2, 1;
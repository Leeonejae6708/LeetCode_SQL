/* Write your PL/SQL query statement below */
SELECT employee_id
FROM Employees 
WHERE employee_id NOT IN (SELECT employee_id FROM Salaries)
UNION ALL
SELECT employee_id
FROM Salaries
WHERE employee_id NOT IN (SELECT employee_id FROM Employees)
ORDER BY 1;
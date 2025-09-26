/* Write your PL/SQL query statement below */
SELECT p.project_id, round(sum(experience_years) / count(*), 2) average_years
FROM Project p, Employee e
WHERE p.employee_id = e.employee_id
GROUP BY p.project_id
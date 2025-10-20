/* Write your PL/SQL query statement below */
WITH
    max_sal as (
        SELECT d.name Department, d.id department_id, MAX(e.salary) max_sal
        FROM Employee e, Department d
        WHERE e.departmentId = d.id
        GROUP BY d.name, d.id
    )

SELECT DISTINCT m.Department, e.name Employee, e.salary Salary
FROM max_sal m, Employee e, Department d
WHERE m.department_id = e.departmentId
AND m.max_sal = e.salary;
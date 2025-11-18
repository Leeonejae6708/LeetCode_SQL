/* Write your PL/SQL query statement below */
SELECT d.name Department, e.name Employee, e.salary
FROM (
    SELECT 
        id, 
        name,
        DENSE_RANK() over(partition by departmentId order by salary desc) sal_rank,
        salary,
        departmentId
    FROM Employee
    ORDER BY 3) e, Department d
WHERE e.departmentId = d.id
AND e.sal_rank <= 3;
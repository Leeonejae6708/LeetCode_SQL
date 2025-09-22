/* Write your PL/SQL query statement below */
SELECT u.UNIQUE_ID, e.NAME
FROM EmployeeUNI u, Employees e
WHERE u.id(+) = e.id
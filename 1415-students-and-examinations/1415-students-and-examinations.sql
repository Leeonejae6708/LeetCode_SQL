/* Write your PL/SQL query statement below */
SELECT s.student_id, s.student_name, b.subject_name, count(e.student_id) attended_exams
FROM Students s CROSS JOIN Subjects b LEFT JOIN Examinations e
ON s.student_id = e.student_id
AND b.subject_name = e.subject_name
GROUP BY s.student_id, s.student_name, b.subject_name
ORDER BY 1, 3;
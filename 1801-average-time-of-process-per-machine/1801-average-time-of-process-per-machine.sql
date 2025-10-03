/* Write your PL/SQL query statement below */
SELECT s.machine_id, round(sum(e.timestamp - s.timestamp)/count(*), 3) processing_time
FROM (SELECT * FROM Activity WHERE activity_type = 'start') s, (SELECT * FROM Activity WHERE activity_type = 'end') e
WHERE s.machine_id = e.machine_id
AND s.process_id = e.process_id
GROUP BY s.machine_id;
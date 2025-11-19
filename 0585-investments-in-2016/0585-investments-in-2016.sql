/* Write your PL/SQL query statement below */
SELECT ROUND(SUM(i1.tiv_2016), 2) AS tiv_2016
FROM Insurance i1
WHERE i1.tiv_2015 IN (
    SELECT i2.tiv_2015
    FROM Insurance i2
    WHERE i1.pid <> i2.pid
)
AND (i1.lat, i1.lon) IN (
    SELECT lat, lon
    FROM Insurance
    GROUP BY lat, lon
    HAVING COUNT(*) = 1
);
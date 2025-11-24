/* Write your PL/SQL query statement below */
SELECT s1.product_id, s1.first_year, s2.quantity, s2.price
FROM (
    SELECT product_id, MIN(year) first_year
    FROM Sales
    GROUP BY product_id) s1, Sales s2
WHERE s1.product_id = s2.product_id
AND s1.first_year = s2.year
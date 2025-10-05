/* Write your PL/SQL query statement below */
SELECT customer_id
FROM Customer
GROUP BY customer_id
HAVING count(Distinct product_key) = (SELECT count(product_key) FROM Product);
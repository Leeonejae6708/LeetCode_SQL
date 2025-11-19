/* Write your PL/SQL query statement below */
WITH order_2019 AS(
    SELECT to_char(order_date, 'yyyy') order_2019, buyer_id, count(*) cnt
    FROM Orders
    WHERE to_char(order_date, 'yyyy') = '2019'
    GROUP BY to_char(order_date, 'yyyy'), buyer_id 
)

SELECT 
    u.user_id buyer_id , 
    to_char(u.join_date, 'yyyy-mm-dd') join_date, 
    CASE
        WHEN o.cnt IS NULL THEN 0
        ELSE o.cnt
    END orders_in_2019
FROM Users u, order_2019 o
WHERE u.user_id = o.buyer_id(+);
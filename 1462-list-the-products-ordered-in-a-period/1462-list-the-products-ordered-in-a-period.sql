/* Write your PL/SQL query statement below */
SELECT p.product_name, o.unit
FROM Products p, (SELECT product_id, sum(unit) unit
                    FROM Orders
                    WHERE to_char(order_date, 'yyyy-mm') = '2020-02'
                    GROUP BY product_id
                    HAVING sum(unit) >= 100) o
WHERE p.product_id = o.product_id;
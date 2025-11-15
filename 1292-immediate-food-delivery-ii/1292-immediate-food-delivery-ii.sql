/* Write your PL/SQL query statement below */
SELECT
    ROUND(100.0 * SUM(is_immediate) / COUNT(*), 2) AS immediate_percentage
FROM (SELECT
        CASE 
            WHEN order_date = customer_pref_delivery_date THEN 1
            ELSE 0
        END AS is_immediate
    FROM (SELECT *
          FROM (SELECT
                   delivery_id,
                   customer_id,
                   order_date,
                   customer_pref_delivery_date,
                   ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS rn
                FROM Delivery)
        WHERE rn = 1)
);
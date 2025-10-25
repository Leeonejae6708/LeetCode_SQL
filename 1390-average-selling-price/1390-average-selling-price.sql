/* Write your PL/SQL query statement below */
WITH matched AS (
  SELECT
    p.product_id,
    u.units,
    p.price
  FROM Prices p, UnitsSold u
  WHERE p.product_id = u.product_id
    AND u.purchase_date BETWEEN p.start_date AND p.end_date
),
agg AS (
  SELECT
    product_id,
    SUM(units * price) AS total_sum,
    SUM(units) AS units_sum
  FROM matched
  GROUP BY product_id
)
SELECT
  pr.product_id,
  ROUND(NVL(a.total_sum / a.units_sum, 0), 2) AS average_price
FROM (SELECT DISTINCT product_id FROM Prices) pr, agg a
WHERE pr.product_id = a.product_id(+)
ORDER BY pr.product_id;
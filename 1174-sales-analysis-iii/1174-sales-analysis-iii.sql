/* Write your PL/SQL query statement below */
SELECT /*+ USE_HASH(p s1) USE_NL(p s2) */
       p.product_id,
       p.product_name
FROM   product p
WHERE  EXISTS (
           SELECT 1
           FROM   sales s1
           WHERE  s1.product_id = p.product_id
           AND    s1.sale_date BETWEEN DATE '2019-01-01' AND DATE '2019-03-31'
       )
AND    NOT EXISTS (
           SELECT 1
           FROM   sales s2
           WHERE  s2.product_id = p.product_id
           AND    (s2.sale_date < DATE '2019-01-01' OR s2.sale_date > DATE '2019-03-31')
       );
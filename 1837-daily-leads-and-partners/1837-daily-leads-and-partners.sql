/* Write your PL/SQL query statement below */
SELECT
    to_char(date_id, 'yyyy-mm-dd') date_id,
    make_name,
    count(distinct lead_id) unique_leads,
    count(distinct partner_id) unique_partners
FROM DailySales
GROUP BY to_char(date_id,'yyyy-mm-dd') , make_name
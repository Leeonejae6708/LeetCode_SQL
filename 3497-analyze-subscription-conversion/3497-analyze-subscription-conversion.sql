/* Write your PL/SQL query statement below */
WITH tri_avg AS(
    SELECT user_id, round(avg(activity_duration), 2) trial_avg_duration
    FROM UserActivity
    WHERE activity_type = 'free_trial'
    GROUP BY user_id
    ),
paid_avg AS(
    SELECT user_id, round(avg(activity_duration), 2) paid_avg_duration
    FROM UserActivity
    WHERE activity_type = 'paid'
    GROUP BY user_id
)

SELECT t.user_id, t.trial_avg_duration, p.paid_avg_duration
FROM tri_avg t, paid_avg p
WHERE t.user_id = p.user_id
ORDER BY 1;
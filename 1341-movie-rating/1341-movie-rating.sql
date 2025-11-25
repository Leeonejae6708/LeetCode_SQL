WITH rr AS (
    SELECT
        m.user_id,
        ROW_NUMBER() OVER(
            ORDER BY COUNT(m.user_id) DESC, u.name ASC
        ) AS rank
    FROM MovieRating m
    JOIN Users u ON u.user_id = m.user_id
    GROUP BY m.user_id, u.name
),
feb_avg AS (
    SELECT
        m.movie_id,
        m.title,
        AVG(mr.rating) AS avg_rating
    FROM MovieRating mr
    JOIN Movies m ON m.movie_id = mr.movie_id
    WHERE mr.created_at BETWEEN DATE '2020-02-01' AND DATE '2020-02-29'
    GROUP BY m.movie_id, m.title
),
top_movie AS (
    SELECT movie_id, title
    FROM (
        SELECT movie_id, title, avg_rating
        FROM feb_avg
        ORDER BY avg_rating DESC, title ASC
    )
    WHERE ROWNUM = 1
)

SELECT u.name AS results
FROM rr r
JOIN Users u ON r.user_id = u.user_id
WHERE r.rank = 1
UNION ALL
SELECT t.title AS results
FROM top_movie t;

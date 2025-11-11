/* Write your PL/SQL query statement below */
SELECT 
    l.book_id,
    l.title,
    l.author,
    l.genre,
    l.publication_year,
    b.current_borrowers
FROM(
    SELECT book_id, COUNT(*) AS current_borrowers
    FROM borrowing_records
    WHERE return_date IS NULL
    GROUP BY book_id) b, library_books l
WHERE b.book_id = l.book_id
AND l.total_copies - b.current_borrowers = 0
ORDER BY b.current_borrowers DESC, l.title ASC;
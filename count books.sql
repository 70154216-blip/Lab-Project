SELECT genre, COUNT(*) AS total_books, SUM(total_copies) AS absolute_copy_count
FROM Books
GROUP BY genre
ORDER BY total_books DESC;
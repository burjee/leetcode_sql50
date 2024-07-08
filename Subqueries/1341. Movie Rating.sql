
    (SELECT u.name AS results
     FROM MovieRating m
     LEFT JOIN Users u ON m.user_id = u.user_id
     GROUP BY u.name
     ORDER BY COUNT(m.user_id) DESC, u.name ASC
     LIMIT 1)
UNION ALL
    (SELECT mv.title AS results
     FROM MovieRating mr
     LEFT JOIN Movies mv ON mr.movie_id = mv.movie_id
     WHERE mr.created_at BETWEEN '2020-02-01' AND '2020-02-29'
     GROUP BY mv.title
     ORDER BY AVG(mr.rating) DESC, mv.title ASC
     LIMIT 1);
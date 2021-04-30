-- SELECT queries

SELECT column_1, column_2
FROM table_name

-- SELECT + where (filtering)

SELECT t1.column_1, t1.column_2, t2.column_something
FROM table_name t1, another_table_name t2
WHERE t1.column_1 >= 'Something'
AND t1.column_2 LIKE '%Something'

-- 1:N - 1:1
-- N:N -> We will have a join table

SELECT tracks.name
FROM tracks
JOIN albums ON tracks.album_id = albums.id

-- ORDER BY field_name ASC / DESC (this field needs to be in the select)
-- GROUP BY field_name (this field needs to be in the select)

-- If we want to only get X rows instead of all of them
-- We use LIMIT 10
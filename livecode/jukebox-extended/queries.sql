-- query 1
-- List all customers (name + email), ordered alphabetically (no extra information)
SELECT first_name, last_name, email
FROM customers
ORDER BY first_name ASC


-- query 2
-- List tracks (Name + Composer) of the Classical playlist
SELECT tracks.name, tracks.composer
FROM tracks
JOIN playlist_tracks ON tracks.id = playlist_tracks.track_id
JOIN playlists ON playlist_tracks.playlist_id = playlists.id
WHERE playlists.name = "Classical"

-- query 3
-- List the 10 artists mostly listed in all playlists
SELECT ar.name, COUNT(pt.track_id) as num
FROM artists ar
JOIN albums al ON ar.id = al.artist_id
JOIN tracks t ON al.id = t.album_id
JOIN playlist_tracks pt ON pt.track_id = t.id
GROUP BY ar.name
ORDER BY num DESC
LIMIT 10

-- query 4
-- List the tracks which have been purchased at least twice, ordered by number of purchases
SELECT t.name, COUNT(il.tracK_id) num
FROM tracks t
JOIN invoice_lines il ON t.id = il.track_id
GROUP BY il.track_id
HAVING num >= 2
ORDER BY num DESC
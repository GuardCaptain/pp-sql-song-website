--===== JOINED TABLE =====--

-- Artist Join
SELECT *
FROM events e
INNER JOIN songs s ON e.artist = s.artist_name

-- Song Join
SELECT *
FROM events e
INNER JOIN songs s ON e.song = s.title

-- Was able to Join the two tables on artist or song
-- But there doesn't seem to be any interesting connections
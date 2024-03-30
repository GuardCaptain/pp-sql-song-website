--== Songs Table Analysis ==--
-------------------------------------

-- Taking a look at the data
SELECT *
FROM songs

--- 79 Songs in database
SELECT COUNT(*)
FROM songs

--- 34 Songs with artist latitude/longitude 
SELECT COUNT(*)
FROM songs
WHERE artist_longitude IS NOT NULL

--- Locations that contain long/lat (Alphabetical)
SELECT artist_location
FROM songs
WHERE artist_longitude IS NOT NULL
ORDER BY artist_location ASC

--- Checking artist_name column ---
-----------------------------------
SELECT artist_name
FROM songs

---  69 different artists
SELECT COUNT(DISTINCT artist_name)
FROM songs

--- Grouping and ordering the 69 artists by the number of songs
SELECT artist_name, COUNT(artist_name) AS number_of_songs
FROM songs
GROUP BY artist_name
ORDER BY number_of_songs DESC

--- Duration column ---
-----------------------

-- Average duration of all songs by the artist
SELECT artist_name, COUNT(artist_name) AS number_of_songs,
AVG(duration) AS Average_song_duration
FROM songs
GROUP BY artist_name
ORDER BY Average_song_duration DESC

--- Year column ---
-------------------
SELECT *
FROM songs
ORDER BY year DESC

--- Count of years with '0' (48)
SELECT COUNT(year) AS Amount_of_zeros
FROM songs
WHERE year = 0

--- Check out the data for rows with year 0
SELECT *
FROM songs
WHERE year = 0

--- Check out rows for year NOT 0
SELECT *
FROM songs
WHERE year != 0
ORDER BY year DESC

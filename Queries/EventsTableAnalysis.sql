--=== Events Table Analysis ===--
------------------------------------

-- Taking a look at the table
SELECT *
FROM events

-- Counting rows (8056)
SELECT COUNT(*)
FROM events

-- Curious queries (Must double quote column names in select clause because of postgres casing)
-----------------------------------------------------------------------------------------------

-- Narrowing table to look for potential patterns, and ordering by userId
SELECT "userId","firstName", "lastName", level, artist, song
FROM events
ORDER BY "userId"

-- Count of unique userId (noticed a few missing userId numbers (31,46,93))
SELECT DISTINCT "userId"
FROM events
ORDER BY "userId"

-- Count of songs searched by unique userId
SELECT DISTINCT "userId", "firstName", "lastName",
COUNT("song") OVER (PARTITION BY "userId") as songs_searched
FROM events
ORDER BY "userId"


-- User ID errors? (Discovered that userID = null means auth = logged out)
SELECT COUNT(*)
FROM events
WHERE "userId" IS NULL

SELECT COUNT(*)
FROM events
WHERE "auth" = 'Logged Out'

--- Events table artist/songs analysis ---
------------------------------------------

-- Most searched artist 
SELECT artist, COUNT(song) AS number_of_searches
FROM events
GROUP BY artist
ORDER BY number_of_searches DESC

-- Querying the most searched artist
SELECT *
FROM events
WHERE artist = 'Coldplay'

-- Top users that searched Coldplay (The most searched artist)
SELECT DISTINCT "userId", "firstName", "lastName", COUNT(*) OVER (PARTITION BY "userId") AS number_of_coldplay_searches
FROM events
WHERE artist = 'Coldplay'
ORDER BY number_of_coldplay_searches DESC

-- Most searched song (You're The One caused errors due to the ' in You're) Fixed it
------------------------------------------------------------------------------------
SELECT song, COUNT(song)
FROM events
GROUP BY song
ORDER BY count DESC

-- List of all rows where the song is "You're The One"
SELECT *
FROM events
WHERE song = 'You''re The One'

-- Top users that searched the song "You're The One" (Most searched song)
SELECT DISTINCT "userId", "firstName", "lastName", COUNT(*) OVER (PARTITION BY "userId")
FROM events
WHERE song = 'You''re The One'
ORDER BY count DESC

-- Noticed that Kate Harrell (userId 97) is number 1 in top users for both song searched and artist searched
------------------------------------------------------------------------------------------------------------

-- Checking to see where userId 97 ranks in count of total searches
SELECT "userId", COUNT(*) AS total_searches
FROM events
GROUP BY "userId"
ORDER BY total_searches DESC

-- Check her searches (Null artist/song might mean they log in and didn't listen to any songs)
SELECT DISTINCT "artist", COUNT(*) OVER (PARTITION BY "artist") AS total_searches
FROM events
WHERE "userId" = 97
ORDER BY total_searches DESC

-- This seems to support the above query
SELECT *
FROM events
WHERE artist IS NULL
ORDER BY "userId"

-- itemInSession seems to have connection with level (free members seems to have a limit of itemInSession)
----------------------------------------------------------------------------------------------------------
-- Free session
SELECT level, "itemInSession"
FROM events
WHERE "level" = 'free'
ORDER BY "itemInSession" DESC

-- Paid session
SELECT level, "itemInSession"
FROM events
WHERE "level" = 'paid'
ORDER BY "itemInSession" DESC
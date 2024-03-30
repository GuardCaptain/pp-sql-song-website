# pp-sql-song-website
SQL Personal Project

Dataset was obtained from https://github.com/MinaElkholy42/Song-Website-Data-Analysis/tree/main

Getting the csv into a database in PostgreSQL

Steps:
1) Downloaded the two CSV files 'songs' and 'events' and placed them into the 'Data' folder
2) Opened up pgAdmin and created a database called 'song_website_db'
3) Created two tables, 'songs' and 'events', with their respective column names.
4) Events table contain columns: artist(varchar), auth(varchar), firstName(varchar), gender(varchar), itemInSession(numeric), lastName(varchar), length(numeric), level(varchar), method(varchar), page(varchar), registration(numeric), session(numeric), song(varchar), status(numeric), ts(numeric), userAgent(varchar), userId(numeric)
5) Songs table contain columns: artist_id(varchar), artist_latitude(numeric), artist_location(varchar), artist_longitude(numeric), artist_name(varchar), duration(numeric), num_songs(integer), song_id(varchar), title(varchar), year(integer)
6) Imported the values from the csv files into their respective tables. --- Songs file imported successfully, but events file ran into issues. It turns out that the 'Escape' in the Options tab (when importing data into the table) had to be a double quote (") for it to successfully import into the events table. ---
7) Tested to see if data was imported successfully with queries,  SELECT * FROM Public."events" and SELECT * FROM Public."songs"

After successfully creating the database and tables, I began my analysis with SQL queries

# Analysis
---------
To start off the analysis, I took at look at the events table. I first ran a select all and counted all the rows to see how much data we have. There was a total of 8056 rows with multiple null values in many of the columns. After taking a quick glance at the data I decided that these null values would not be deterimental to the analysis and kept them in instead of removing them. I continued to query and discovered that the null values for 'userId' aligned with the 'auth' column equating to the value 'Logged Out'. This piqued my interest and I decided to count how many instances of this occurs. This ended up accounting for 286 log outs. After discovering this, I proceeded to see how many songs each user searched. I was able to successfully query this then became interested in what song or artist was searched the most. This lead to the discovery of 'Coldplay' being the most searched artist, and "You're The One" being the most searched song. I then broke down these two to see what users searched them up and how often, and it turned out that userId 97 (Kate Harrell) was the top searcher for both the artist 'Coldplay' and the song "You're The One". Doing some more querying on userId 97, I found that she has the 3rd most searches and is a paid member. This was quite interesting to conclude as she isn't the user with the most searches and actually falls behind the other two by almost 200 searches, but contributes a lot to the most searched song and artist.  

After concluding my analysis of the events table, I proceeded to the songs table. The songs table has only 79 rows of data and is significantly smaller than the events table. The songs table however, had some interesting columns. One being a longtitude and latitude column that shows where the artist possibly performed or recorded the song. These coordinates could possibly be useful information for someone who wants to map out the songs or artists. One problem though, is that there are a lot of missing values (nulls), over half of the data has no coordinates. Moving onto the other columns, we see duration and year. I notice that there is a lot of missing years in the year column. We conducted more queries to see if this was intended or not. We believe that it was not intended, and that this data can be found with a simple search in the search engine. This is important data that we may actually need to conduct a thorough analysis and may want to contact our stakeholders about this. Overall, we can conclude that this table/file is missing information, that if founded, can help us do a complete analysis.  

We also joined thet two tables, but with one table having 8000+ rows while the other only having 79 rows, we cannot get much information. Also, we are only able to merge the two tables based off the artist name and song titles. There is no key ID that connects both tables, thus concluding our joined table analysis. 
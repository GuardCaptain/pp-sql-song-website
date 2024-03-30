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

Analysis
---------


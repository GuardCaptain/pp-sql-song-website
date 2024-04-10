# Song-Website Data Analysis

## Table of Contents
- [Project Overview](#project-overview)
- [Data Sources](#data-sources)
- [Preprocessing](#preprocessing)
- [Exploratory Data Analysis](#exploratory-data-analysis)
- [Analysis](#analysis)
- [Results](#results)
- [Visualization](#visualization)

### Project Overview
This data analysis project aims to provide insights into the website page containing data about songs. By analyzing various aspects of the website data, we seek to identify trends, gain a deeper understanding of the data, and provide data-driven reccomendations.

### Data Sources
The two primary datasets used for this analysis was the "songs.csv" and "events.csv"  
Data was obtained from [here](https://github.com/MinaElkholy42/Song-Website-Data-Analysis/tree/main)

### Preprocessing  
Steps:
1. Downloaded the two CSV files 'songs' and 'events' and placed them into the 'Data' folder
2. Opened up pgAdmin and created a database called 'song_website_db'
3. Created two tables, 'songs' and 'events', with their respective column names.
4. Events table contain columns: artist(varchar), auth(varchar), firstName(varchar), gender(varchar), itemInSession(numeric), lastName(varchar), length(numeric), level(varchar), method(varchar), page(varchar), registration(numeric), session(numeric), song(varchar), status(numeric), ts(numeric), userAgent(varchar), userId(numeric)
5. Songs table contain columns: artist_id(varchar), artist_latitude(numeric), artist_location(varchar), artist_longitude(numeric), artist_name(varchar), duration(numeric), num_songs(integer), song_id(varchar), title(varchar), year(integer)
6. Imported the values from the csv files into their respective tables.  *Songs file imported successfully, but events file ran into issues. It turns out that the 'Escape' in the Options tab (when importing data into the table) had to be a double quote (") for it to successfully import into the events table*. 
7. Tested to see if data was imported successfully with queries,  ```SELECT * FROM Public."events"``` and ```SELECT * FROM Public."songs"```

After successfully creating the database and tables, I began my analysis.

### Exploratory Data Analysis
Questions to keep in mind:
- What pattern/trends can we find?
- What are the top songs/artists?
- Are there any users that stand out?

### Analysis
To start off the analysis, I took at look at the events table. I first ran a ```SELECT COUNT(*) FROM events``` to see how much data we have. There was a total of 8056 rows with multiple null values in many of the columns. After taking a quick glance at the data I decided that these null values would not be deterimental to the analysis and kept them instead of removing them. I continued to query and discovered that the null values for 'userId' aligned with the 'auth' column equating to the value 'Logged Out'. This piqued my interest and I decided to count how many instances of this occurred with ```SELECT COUNT(*) FROM events WHERE "userId" IS NULL``` This ended up accounting for 286 log outs. After discovering this, I proceeded to see how many songs each user searched with the query ```SELECT "userId", COUNT(*)
FROM events
GROUP BY "userId"
ORDER BY count DESC ``` After successfully querying this, I became curious as to what song or artist was searched the most. This lead to the discovery of 'Coldplay' being the most searched artist, and "You're The One" being the most searched song. I then broke down these two to see what users searched them up and how often, and it turned out that userId 97 (Kate Harrell) was the top searcher for both the artist 'Coldplay' and the song "You're The One". Doing some more querying on userId 97, I found that she has the 3rd most searches and is a paid member. This was quite interesting to conclude as she isn't the user with the most searches and actually falls behind the other two by almost 200 searches, but contributes a lot to the most searched song and artist.  

After concluding my analysis of the events table, I proceeded to the songs table. The songs table has only 79 rows of data and is significantly smaller compared to the 8000+ rows of the events table. The songs table however, had some interesting columns. One being a longtitude and latitude column that shows where the artist possibly performed or recorded the song. These coordinates could possibly be useful information for someone who wants to map out the songs or artists. One problem though, is that there are a lot of missing values (nulls), over half of the data has no coordinates. Moving onto the other columns, we see duration and year. I notice that there is a lot of missing years in the year column. After conducting the query ```SELECT *
FROM songs
ORDER BY year DESC``` we believe that the rows with a value of 0 in the year column was not intended, and that this data can be found with a simple search on the search engine. This is important information that we may need to conduct a thorough analysis and may want to contact our stakeholders about this. Overall, we can conclude that this table/file is missing information, that if founded, can help us do a complete analysis.

We also joined thet two tables ```SELECT *
FROM events e
INNER JOIN songs s ON e.artist = s.artist_name``` but with one table having 8000+ rows while the other only having 79 rows, we cannot get much information. Also, we are only able to merge the two tables based off the artist name and song titles. There is no key ID that connects both tables, thus concluding our joined table analysis. 

### Results

The analysis results are summarized as follows:
1. Paid members have more song searches than free members.
2. Coldplay is the most searched artist, and "You're The One" is the most searched song.
3. Kate Harrell (userId 97) has the most searches for Coldplay and "You're The One".

### Visualization  
Here is a dashboard created on Tableau that displays Users information in a easy to navigate way.  

https://public.tableau.com/app/profile/mitchell1520/viz/SongsWebsiteDashboard/WebsiteDashboard?publish=yes 

### Limitations

There were a lot of missing values in the songs table, which limited our analysis on that table. There also wasn't enough rows in the songs table to combine the two tables together effectively to gain further insight.

### References

1. [Sql Tutorial](https://www.sqltutorial.org/sql-window-functions/sql-partition-by/)

-- Summary Analytics (MIN, MAX, AVG, GROUP BY)

/* getting min, max, avg rating for marvel studios 
rounding to 2 decimal places */

SELECT ROUND(MIN(imdb_rating),2) AS Min ,
	   ROUND(MAX(imdb_rating),2) AS Max,
       ROUND(AVG(imdb_rating),2) AS Avg
	FROM movies ;
    
-- selecting no of films and there Max, Min, Avg retings

SELECT industry,COUNT(*) AS cnt,
	ROUND(MIN(imdb_rating),2) AS Min ,
	ROUND(MAX(imdb_rating),2) AS Max,
	ROUND(AVG(imdb_rating),2) AS Avg
	FROM movies
    GROUP BY industry ;
    
/* Exercise - Summary analytics (MIN, MAX, AVG, GROUP BY)

1. How many movies were released between 2015 and 2022
2. Print the max and min movie release year
3. Print a year and how many movies were released in that year
   starting with the latest year */
   
-- 1
SELECT COUNT(*)
	FROM movies 
    WHERE release_year BETWEEN 2015 AND 2022 ;
    
-- 2
SELECT MAX(release_year) AS max_year ,
	   MIN(release_year) AS min_year 
	FROM movies  ;
    
SELECT release_year, COUNT(DISTINCT movie_id) AS num_of_movies
	FROM movies 
    GROUP BY release_year
    ORDER BY release_year DESC ;
    
/*   Print a year and how many movies were released in that year
     where num_of_movies is greter than 1 starting with the latest year */
     
SELECT release_year, COUNT(DISTINCT movie_id) AS num_of_movies
	FROM movies 
    GROUP BY release_year
    HAVING num_of_movies > 1
    ORDER BY release_year DESC ;
    
-- Execution order FROM->WHERE->GROUP BY->HAVING->SELECT->ORDER BY->TOP
   

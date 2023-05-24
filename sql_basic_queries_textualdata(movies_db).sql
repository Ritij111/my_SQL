/* Basic queries on textual data using 
USE, SELECT, FROM, WHERE, DISTINCT, COUNT() */

-- selecting the default schema
USE moviesdb ;

SELECT *
	FROM movies ;
    
SELECT title, industry
	FROM movies ;
    
SELECT title, industry
	FROM movies
    WHERE industry = "Bollywood";
    
SELECT COUNT(*)
	FROM movies ;
    
SELECT DISTINCT industry
	FROM movies ;
    
SELECT COUNT(DISTINCT industry)
	FROM movies ;

-- wildcard (LIKE "_","%") 
SELECT *
	FROM movies
    WHERE title LIKE  "%america%" ;
    
-- Checking where studio is null

SELECT * 
	FROM movies 
    WHERE studio = "" ;
    
/* Write SQL queries for the following:

1. Print all movie titles and release year for all Marvel Studios movies.
2. Print all movies that have Avenger in their name.
3. Print the year when the movie "The Godfather" was released.
4. Print all distinct movie studios in the Bollywood industry.*/

-- 1
	SELECT title, release_year
		FROM movies
        WHERE studio = "Marvel Studios" ;
        
-- 2
	SELECT * 
		FROM movies
		WHERE title LIKE "%Avenger%";
        
-- 3
	SELECT release_year
		FROM movies
        WHERE title = "The Godfather";

-- 4
	SELECT DISTINCT studio
		FROM movies
        WHERE industry = "Bollywood";


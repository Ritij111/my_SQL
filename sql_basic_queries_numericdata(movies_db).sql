-- USING basic queries for numeric data

SELECT * 
	FROM movies
    WHERE imdb_rating >= 9 ;
    
SELECT * 
	FROM movies
    WHERE imdb_rating <= 6 ;
    
    
-- getting the movies having rating between 6 & 8

SELECT * 
	FROM movies
    WHERE imdb_rating >= 6 AND imdb_rating <= 8 ;
    
-- doing the same using BETWEEN 

SELECT * 
	FROM movies 
    WHERE imdb_rating BETWEEN 6 AND 8 ;
    
-- getting all the movies released in year 2018, 2019 & 2020  

SELECT * 
	 FROM movies 
     WHERE release_year = 2018 OR release_year = 2019 OR release_year = 2020 ;
     
-- doing same using IN operator 

SELECT *
	FROM movies
    WHERE release_year IN (2018, 2019, 2020) ;
    
-- finding NULL values in rating 

SELECT * 
	FROM movies
    WHERE imdb_rating IS NULL ;
    
SELECT * 
	FROM movies
    WHERE imdb_rating IS NOT NULL ;
    
-- getting the results in order of imdb_rating

SELECT * 
	FROM movies 
    ORDER BY imdb_rating ;
    
-- getting top 5 movies by imdb_rating

SELECT * 
	FROM movies 
    ORDER BY imdb_rating DESC
    LIMIT 5;
    
-- getting top 5 movies by imdb_rating excluding the top 1

SELECT * 
	FROM movies 
    ORDER BY imdb_rating DESC
    LIMIT 5 OFFSET 1;
    
/* Write SQL queries for the following:

1. Print all movies in the order of their release year (latest first)
2. All movies released in the year 2022
3. Now all the movies released after 2020
4. All movies after the year 2020 that have more than 8 rating
5. Select all movies that are by Marvel studios and Hombale Films
6. Select all THOR movies by their release year
7. Select all movies that are not from Marvel Studios */

-- 1
SELECT * 
	FROM movies 
    ORDER BY release_year DESC ;
    
-- 2
SELECT * 
	FROM movies 
    WHERE release_year = 2022 ;
    
-- 3
SELECT * 
	FROM movies 
    WHERE release_year > 2020 ;
    
-- 4
SELECT * 
	FROM movies 
    WHERE release_year > 2020 AND imdb_rating > 8 ;
    
-- 5
SELECT * 
	FROM movies
    WHERE studio IN ("Marvel Studios" , "Hombale Films");
    
-- 6
SELECT *
	FROM movies 
    WHERE title LIKE "%THOR%"
    ORDER BY release_year ;
    
-- 7
SELECT * 
	FROM movies
    WHERE studio NOT IN ("Marvel Studios") ;


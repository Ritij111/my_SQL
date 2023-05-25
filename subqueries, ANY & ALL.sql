-- SUBQUERIES

-- Returning single value

-- select the movie having highest rating

SELECT *
	FROM movies 
    WHERE imdb_rating = 
    (SELECT MAX(imdb_rating) FROM movies) ;
    
-- Returning a list of values

SELECT *
	FROM movies 
    WHERE imdb_rating IN ( (SELECT MAX(imdb_rating) FROM movies),
						(SELECT MIN(imdb_rating) FROM movies)) ;
                        
-- Returning a table

SELECT * 
	FROM 
		(SELECT * 
		, (YEAR(CURDATE())-birth_year) AS age 
		FROM actors ) AS actors_age
	WHERE age BETWEEN 70 AND 85 ;
    
    
    -- ANY & ALL
    
    -- ANY works same as IN operator
    -- find the actors works in any of these movies 112, 116 & 106
    SELECT * 
		FROM actors
		WHERE actor_id = 
        ANY (SELECT actor_id FROM movie_actor WHERE movie_id IN (112,116,106)) ;
    
    -- select all movies whose rating is greater than *any* of marvel movies rating
    
SELECT *
	FROM movies 
    WHERE imdb_rating >  ANY (SELECT imdb_rating
							FROM movies
							WHERE studio LIKE "%marvel%");

-- Alternate
SELECT *
	FROM movies 
    WHERE imdb_rating >  (SELECT MIN(imdb_rating)
							FROM movies
							WHERE studio LIKE "%marvel%");

 -- select all movies whose rating is greater than *all* of marvel movies rating
SELECT *
	FROM movies 
    WHERE imdb_rating >  ALL (SELECT imdb_rating
							FROM movies
							WHERE studio LIKE "%marvel%");
                            
-- Alternate
SELECT *
	FROM movies 
    WHERE imdb_rating >  (SELECT MAX(imdb_rating)
							FROM movies
							WHERE studio LIKE "%marvel%");

-- Co-related subqueries (we refer the outer table in subquery)
-- provide the actors name and the no of movies they had done

SELECT name ,
	(SELECT count(movie_id) FROM movie_actor 
    WHERE actor_id = actors.actor_id) AS movie_cnt 
	FROM actors
    ORDER by movie_cnt DESC ;

-- Alternate

SELECT name,COUNT(movie_id) AS movie_cnt
	FROM actors 
    LEFT JOIN movie_actor 
    USING (actor_id)
    GROUP BY actor_id
    ORDER BY movie_cnt DESC ;
    
/* Write SQL queries for the following,

1. Select all the movies with minimum and maximum release_year.
 Note that therecan be more than one movie in min and a max year
 hence output rows can be more than 2
    
2. Select all the rows from the movies table whose imdb_rating
 is higher than the average rating */
 
 -- 1
SELECT 
	title, release_year
FROM 
	movies
WHERE
	release_year 
    IN ((SELECT MAX(release_year) FROM movies),
		(SELECT MIN(release_year) FROM movies)) ;
        
-- 2
SELECT
	* 
FROM 
	movies 
WHERE
	imdb_rating > (SELECT AVG(imdb_rating) FROM movies);
 
 

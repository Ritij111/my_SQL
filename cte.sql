-- CTE

-- Get the movies which made the 500% + profit despite of haveing rating less than avg

WITH 
	movie_profit_pct (movie_id, profit_pct)  AS
	(SELECT 
		movie_id,
        (revenue-budget)*100/budget
	FROM 
		financials
	WHERE
		(revenue-budget)*100/budget>500),
	
    movies_imdb (movie_id,title) AS
    (SELECT 
		movie_id,title
	FROM 
		movies 
	WHERE imdb_rating < (SELECT AVG(imdb_rating) FROM movies))
	
SELECT 
	*
FROM 
	movie_profit_pct
    JOIN
    movies_imdb
    USING(movie_id)
 ;
 
 
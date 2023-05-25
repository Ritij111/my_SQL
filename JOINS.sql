-- JOINS

-- getting movie_id, title, budget, unit, currency in a single table

/* INNER JOIN
we are using inner join so we will get only the common records 
we are grtting movie_id from movies table */

SELECT m.movie_id, m.title, f.budget, f.unit, f.currency
	FROM movies m 
	INNER JOIN financials f
    ON m.movie_id = f.movie_id ;
	
/* LEFT JOIN
we are using left join so we will be getting all the records
from left table and only the common ones from right table */    
    
SELECT m.movie_id, m.title, f.budget, f.unit, f.currency
	FROM movies m 
	LEFT JOIN financials f
    ON m.movie_id = f.movie_id ;    
    
/* RIGHT JOIN
we are using right join so we will be getting all the records
from left table and only the common ones from left table */    
    
SELECT f.movie_id, m.title, f.budget, f.unit, f.currency
	FROM movies m 
	RIGHT JOIN financials f
    ON m.movie_id = f.movie_id ;   
    
-- FULL JOIN (UNION of left & right join) 

SELECT m.movie_id, m.title, f.budget, f.unit, f.currency
	FROM movies m 
	LEFT JOIN financials f
    ON m.movie_id = f.movie_id   
    
UNION

SELECT f.movie_id, m.title, f.budget, f.unit, f.currency
	FROM movies m 
	RIGHT JOIN financials f
    ON m.movie_id = f.movie_id ; 
    
-- USING we dont need to specify from which table our movie_id is comming
SELECT movie_id, m.title, f.budget, f.unit, f.currency
	FROM movies m 
	RIGHT JOIN financials f
    USING (movie_id) ;
-- we can put multiple columns in bracket and perform join on multiple columns

/* Multiple column join using ON
SELECT f.movie_id, m.title, f.budget, f.unit, f.currency
	FROM movies m 
	RIGHT JOIN financials f
    ON m.movie_id = f.movie_id AND m.col1 = f.col1; 
    
Write SQL queries for the following,

1. Show all the movies with their language names
2. Show all Telugu movie names (assuming you don't know the language
id for Telugu)
3. Show the language and number of movies released in that language */

-- 1
SELECT title, name
 FROM movies m 
 INNER JOIN languages l
 USING (language_id) ;
 
-- 2 
SELECT title, name
 FROM movies m 
 RIGHT JOIN languages l
 USING (language_id) 
 WHERE name  = 'telugu' ;

-- 3
SELECT name, COUNT(movie_id) as cnt
 FROM movies m 
 RIGHT JOIN languages l
 USING (language_id) 
 GROUP BY name
 ORDER BY cnt DESC;
 
 -- CROSS JOIN (does the cartesian product)
 
 USE food_db ;

SELECT * 
	FROM items 
    CROSS JOIN variants ;
    
--  generating the full name and price 

SELECT * ,
	CONCAT(name," - ",variant_name) AS full_name,
    (price + variant_price) AS full_price
	FROM items 
    CROSS JOIN variants ;

-- getting the movie_id, title, its financials and calculate the profit

USE moviesdb ;

SELECT movie_id, title , budget, revenue, currency, unit,
		CASE 
			WHEN unit = "Thousands" THEN ROUND((revenue-budget)/1000,2)
            WHEN unit = "billions" THEN ROUND((revenue-budget)*1000,2)
            ELSE ROUND((revenue-budget),2)
        END AS profit_mln ;
        
-- Join More Than Two Tables

-- print the movie_id, title, actors in the movie seperated by comma

SELECT ma.movie_id, m.title,GROUP_CONCAT(a.name SEPARATOR ', ') AS actors
	FROM movies m
    JOIN movie_actor ma 
		ON m.movie_id = ma.movie_id
	JOIN actors a
		ON ma.actor_id = a.actor_id
	GROUP by title;
    
-- print the actor name, movies he had done

SELECT a.name, 
	GROUP_CONCAT(m.title SEPARATOR ', ') AS movies,
	COUNT(m.title) AS movie_cnt
	FROM movies m
    JOIN movie_actor ma 
		ON m.movie_id = ma.movie_id
	JOIN actors a
		ON ma.actor_id = a.actor_id
	GROUP BY name
    ORDER BY movie_cnt DESC;
    
/* Write SQL queries for the following,

1. Generate a report of all Hindi movies sorted by their revenue amount in millions.
Print movie name, revenue, currency, and unit */

SELECT m.title,
	CASE
		WHEN unit = "Billions" THEN revenue*1000
        WHEN unit = "Thousands" THEN revenue/1000
        ELSE revenue
    END AS revenue_mln
    , f.currency, f.unit
	FROM languages l
    JOIN movies m 
    ON m.language_id = l.language_id
    JOIN  financials f
    ON f.movie_id = m.movie_id
    WHERE l.name = "hindi"
    ORDER BY revenue_mln DESC;


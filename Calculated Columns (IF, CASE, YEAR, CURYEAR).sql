-- Calculated Columns (IF, CASE, YEAR, CURYEAR)

-- Calculating the age of the actors 
SELECT *,YEAR(CURDATE())-birth_year
	FROM actors ;
 
 -- converting revenue in usd to inr
 SELECT * ,
		IF(currency = "USD",revenue*77,revenue)
    AS revenue_inr
	FROM financials ;
 
 -- converting unit of revenue to millions
SELECT * ,
	CASE 
		WHEN unit = "Billions" THEN ROUND(revenue*1000,2)
        WHEN unit = "Thousands" THEN ROUND(revenue/1000,2)
        ELSE revenue
    END AS revenue_mln
	FROM financials ;
    
    
/* Write SQL queries for the following,

1. Print profit % for all the movies */

SELECT *,
	ROUND((revenue-budget)*100/budget,2) AS profit_pct
	FROM financials
  

    

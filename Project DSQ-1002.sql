

/**********************************Mandatory Project***************************************/


/*
1.	Write a SQL query to count the number of characters except the spaces for each actor. 
	Return first 10 actors name length along with their name.
*/
USE mavenmovies;
SELECT 
    actor_id,
    TRIM(CONCAT(first_name, ' ', last_name)) AS Actor_Name,
    LENGTH(TRIM(CONCAT(last_name, first_name))) AS Name_Length_Without_Space
FROM
    actor
LIMIT 10;

/*2.	List all Oscar awardees(Actors who received Oscar award) 
with their full names and length of their names.
*/
SELECT 
    awards,
    TRIM(CONCAT(first_name, ' ', last_name)) AS Actor_Name,
    LENGTH(TRIM(CONCAT(last_name, first_name))) AS Name_length_without_space,
    LENGTH(TRIM(CONCAT(first_name, ' ', last_name))) AS Name_length_with_space
FROM
    actor_award
WHERE
    awards REGEXP 'Oscar';


/*3.	Find the actors who have acted in the film ‘Frost Head’*/

SELECT 
    film_id, title, first_name, last_name
FROM
    actor
        INNER JOIN
    film_actor USING (actor_id)
        INNER JOIN
    film USING (film_id)
WHERE
    title = 'Frost Head';
    

SELECT 
    film_id, title, first_name, last_name
FROM
    film
        INNER JOIN
    film_actor USING (film_id)
        INNER JOIN
    actor USING (actor_id)
WHERE
    first_name = 'will'
        AND last_name = 'wilson';



/*5.	Pull all the films which were rented and return in the month of May.*/

SELECT 
    film_id, title, rental_date, return_date
FROM
    film
        INNER JOIN
    inventory USING (film_id)
        INNER JOIN
    rental USING (inventory_id)
WHERE
    MONTH(rental_date)
        AND MONTH(return_date) = '05';    -- (Numeric Code for May=05)


/*6.	Pull all the films with ‘Comedy’ category.*/

SELECT 
    film_id, title, name
FROM
    film
        INNER JOIN
    film_category USING (film_id)
        INNER JOIN
    category USING (category_id)
WHERE
    Name = 'Comedy';




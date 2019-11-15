-- Question 1
SELECT id,title,genres
FROM movies.movies;
-- Question 2
SELECT id,title
FROM movies.movies
LIMIT 10;
-- Question 3
SELECT id,title
FROM movies.movies
WHERE id = 485;
-- Question 4
SELECT id
FROM movies.movies
WHERE title = 'Made in America (1993)';
-- Question 5
SELECT title
FROM movies.movies
ORDER BY title ASC
LIMIT 10;
-- Question 6
SELECT id,title,genres
FROM movies.movies
WHERE title LIKE '%2002%';
-- Question 7
SELECT id,title,genres
FROM movies.movies
WHERE title  LIKE 'godfather%' AND TITLE NOT LIKE '%PART%';
-- Question 8
SELECT id,title,genres
FROM movies.movies
WHERE genres LIKE '%comedy%';
-- Question 9
SELECT id,title,genres
FROM movies.movies
WHERE genres LIKE '%comedy%'
AND title LIKE '%2000%';
-- Question 10
SELECT id,title,genres
FROM movies.movies
WHERE genres LIKE '%comedy%'
AND title LIKE '%death%';
-- Question 11
SELECT id,title,genres
FROM movies.movies
WHERE (title LIKE '%2001%' OR TITLE LIKE '%2002%')
AND title LIKE '%Super%' ;
-- Question 12
Created Table

-- Question 13
("Andy", "Badguy", "20012210", 11),
("Ben", "Goodguy", "20011110", 12),
("Jason", "Goodguy", "20090210", 13),
("Steve", "Goodguy", "19771210", 14),
("Mary", "Badguy", "19881210", 15),
("Jane", "Goodguy", "19671210", 16),
("Jonny", "Hero", "20081210", 17),
("Joan", "Victim", "200020210", 18),
("Ming", "Badguy", "20011213", 19),
("Abdul", "Victim", "20011214", 20),
("Janet", "Hero", "20091210", 21),
("Emily", "Victim", "19911210", 22),
("Hannah", "Badguy", "19881210", 23),
("Leah", "Badguy", "20021109", 24),
("Abby", "Goodguy", "20041110", 25),
("Phoebe", "Hero", "20001010", 26),
("Chloe", "Victim", "20041109", 27),
("Ryan", "Badguy", "19760210", 28),
("Mike", "Goodguy", "19881110", 29),
("Jeremy", "Hero", "19660410", 30),
("Mario", "Badguy", "19881110", 31),
("Luigi", "Hero", "19561210", 32),
("Adam", "Goodguy", "19871010", 33),
("Ali", "Victim", "20011219", 34),
("Dee", "Badguy", "20041010", 36),
("Cindy", "Hero", "20021110", 37),
("Jimmy", "Goodguy", "20010210", 38),
("Danielo", "Victim", "20041219", 39),
("Alex", "Badguy", "20011118", 40),
("Ainoho", "Hero", "20041210", 41),
("Laz", "Victim", "20051110", 42);

-- question 14
UPDATE movie.movies
SET MPAA_rating = "3.0"
WHERE id=3 or id=4 or id=5 or id=6 or id=7;

-- Question 15

SELECT m.title, r.rating
from movie.movies m
 LEFT JOIN movie.ratings r ON m.id = r.movie_id
where m.title like "godfather, the%";

-- question 16
SELECT m.title, r.rating
from movie.movies m
 LEFT JOIN movie.ratings r ON m.id = r.movie_id
where m.title like "godfather, the%"
order by r.timestamp DESC;

-- question 17
SELECT m.title, l.imdb_Id
from movie.movies m
 LEFT JOIN movie.links l ON m.id = l.movie_id
where m.genres like "%comedy%"  and m.title like "%2005%" ;

-- question 18
SELECT title 
FROM movie.movies, movie.ratings
where movies.id  != ratings.movie_id;

-- question 19
SELECT m.title, AVG (r.rating)
FROM movie.ratings r
left join movie.movies m on m.id=r.movie_id
group by m.title

-- question 20
SELECT m.title, count(r.movie_id) as totalRatings
FROM movie.ratings r
left join movie.movies m on m.id=r.movie_id
group by m.title

-- question 21
SELECT m.genres, count(m.genres) as "Total movies/genre"  FROM movie.movies m 
group by m.genres;

-- Question 22
SELECT r.user_id, avg(r.rating) FROM movie.ratings r
group by r.user_id;

-- Question 23
SELECT r.user_id, COUNT(r.rating) as ratingperson
FROM  movie.ratings r
group by r.user_id 
order by ratingperson DESC
LIMIT 1;

-- question 24
SELECT r.user_id, avg(r.rating) as "AVG ratings"	
FROM movie.ratings r
GROUP BY r.user_id
ORDER BY ratings DESC
LIMIT 1

-- question 25
SELECT r.user_id, avg(r.rating) as "AVG ratings", count(r.rating) as timesRated
FROM movie.ratings r
GROUP BY r.user_id
having timesRated> 50
ORDER BY AVG (timesRated) DESC
LIMIT 1;

-- question 26
SELECT  m.title, AVG(r.rating) as avgRating
FROM movie.ratings r
left join movie.movies m on m.id=r.movie_id
group by m.title
having avgRating > 4;

create table Netflix
(
show_id	varchar(10),
_type varchar(15),
title varchar(250),
director varchar(400),	
casts	varchar(1000),
country	varchar(250),
date_added	varchar(100),
release_year	int,
rating	varchar(20),
duration	varchar(50),
listed_in	varchar(100),
_description varchar(250)
);
select * from netflix;
select count(*) as total_content from netflix;
select distinct _type from netflix;


-- 11 buisness Problems

-- 1. Count the number of Movies vs TV Shows 
select count(_type) as Total_content from netflix
group by _type;


-- 2.Find the most common rating for movies and tv shows 
select _type,rating,count(*),
Rank() over(Partition by _type order by count(*)) as ranking
from netflix
group by 1,2;

-- 3. List all movies released in a specific year  (e.g.2020)
select * from netflix
where _type='Movie'
and release_year=2020;


-- 4.Find the top 5 countries with the most content on Netflix
select country,
count(show_id) as total_content
from netflix
group by 1
order by total_content desc
limit 5;


-- 5. identify the longest movie?
select * from netflix
where _type='Movie'
and duration=(select max(duration) from netflix);

-- 6. Find all the movies/tv shows by director 'Masahiko Murata'
select * from netflix
where director='Masahiko Murata';
  
-- 7.List Tv Shows shows with more than 5 seasons
select * from netflix
where _type="TV Show" and duration > "5 seasons";

-- 8.Count the number of content items in each genre
select 
listed_in as genre,
count(show_id) as total_content
from netflix
group by 1;


-- 9. Find content release by india on netflix.
 select * from netflix
 where country='India';
 
 -- 10. List all movies that ae documentary.
select * from netflix
where listed_in like'%Documentaries%';
 
 -- 11. find all the content without a director.
 select * from netflix
 where director is null;
  
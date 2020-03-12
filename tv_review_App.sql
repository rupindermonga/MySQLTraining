create database tv_review_app;

use tv_review_App;

create table Reviewers
	(
		id int auto_increment primary key,
		first_name varchar(100),
		last_name varchar(100)
    );
    
create table Series
	(
		id int auto_increment primary key,
        title varchar(100),
        released_year int,
        genre varchar(100)
	);

create table Reviews
	(
		id int auto_increment primary key,
        series_id int,
        reviewer_id int,
        rating decimal(2,1),
        foreign key(series_id) references Series(id),
        foreign key(reviewer_id) references Reviewers(id)
	);

INSERT INTO series (title, released_year, genre) VALUES
    ('Archer', 2009, 'Animation'),
    ('Arrested Development', 2003, 'Comedy'),
    ("Bob's Burgers", 2011, 'Animation'),
    ('Bojack Horseman', 2014, 'Animation'),
    ("Breaking Bad", 2008, 'Drama'),
    ('Curb Your Enthusiasm', 2000, 'Comedy'),
    ("Fargo", 2014, 'Drama'),
    ('Freaks and Geeks', 1999, 'Comedy'),
    ('General Hospital', 1963, 'Drama'),
    ('Halt and Catch Fire', 2014, 'Drama'),
    ('Malcolm In The Middle', 2000, 'Comedy'),
    ('Pushing Daisies', 2007, 'Comedy'),
    ('Seinfeld', 1989, 'Comedy'),
    ('Stranger Things', 2016, 'Drama');

INSERT INTO reviewers (first_name, last_name) VALUES
    ('Thomas', 'Stoneman'),
    ('Wyatt', 'Skaggs'),
    ('Kimbra', 'Masters'),
    ('Domingo', 'Cortes'),
    ('Colt', 'Steele'),
    ('Pinkie', 'Petit'),
    ('Marlon', 'Crafford');
    
INSERT INTO reviews(series_id, reviewer_id, rating) VALUES
    (1,1,8.0),(1,2,7.5),(1,3,8.5),(1,4,7.7),(1,5,8.9),
    (2,1,8.1),(2,4,6.0),(2,3,8.0),(2,6,8.4),(2,5,9.9),
    (3,1,7.0),(3,6,7.5),(3,4,8.0),(3,3,7.1),(3,5,8.0),
    (4,1,7.5),(4,3,7.8),(4,4,8.3),(4,2,7.6),(4,5,8.5),
    (5,1,9.5),(5,3,9.0),(5,4,9.1),(5,2,9.3),(5,5,9.9),
    (6,2,6.5),(6,3,7.8),(6,4,8.8),(6,2,8.4),(6,5,9.1),
    (7,2,9.1),(7,5,9.7),
    (8,4,8.5),(8,2,7.8),(8,6,8.8),(8,5,9.3),
    (9,2,5.5),(9,3,6.8),(9,4,5.8),(9,6,4.3),(9,5,4.5),
    (10,5,9.9),
    (13,3,8.0),(13,4,7.2),
    (14,2,8.5),(14,3,8.9),(14,4,8.9);
    
select title, rating from series 
join reviews 
	on reviews.series_id = series.id;
    
select title, avg(rating) as "avg_rating" from series 
join reviews 
	on reviews.series_id = series.id
    group by title
    order by avg_rating;
    
select first_name, last_name, rating from reviewers 
join reviews 
	on reviews.reviewer_id = reviewers.id;

select title, rating from series 
left join reviews 
	on reviews.series_id = series.id
    where rating is Null;

select genre, avg(rating) as "avg_rating" from series 
join reviews 
	on reviews.series_id = series.id
    group by genre;


select 
	first_name, 
    last_name, 
    count(rating) as count, 
    ifnull(min(rating),0) as min, 
    ifnull(max(rating),0) as max,
    round(ifnull(avg(rating),0),2) as avg, 
		case 
			when count(rating) = 0 
			then "Inactive" 
			Else "Active" 
        End as Status 
from reviewers 
	left join reviews 
		on reviewer_id= Reviewers.id 
group by Reviewers.id;
    

select 
		title, 
        rating, 
        concat(first_name, " ", last_name) as reviewer 
from reviewers 
	join reviews 
		on reviewer_id= Reviewers.id 
	join series 
		on series.id = series_id 
order by title;
    
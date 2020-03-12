select * from users order by created_at limit 5;

select 
	dayname(created_at) as day_nu, 
    count(weekday(created_at)) as "#_of_users" 
from users 
group by 
	day_nu 
order by 
	"#_of_users"
limit 2;

select 
	username 
from users 
left join 
	photos 
on users.id = photos.user_id 
where 
	photos.id is Null
    ;
    
select 
	username  
from likes 
join photos 
on likes.photo_id = photos.id 
join users 
on photos.user_id = users.id 
group by photo_id 
order by count(photo_id) desc 
limit 1
;


select username, count(photos.id) from users 
left join photos 
	on photos.user_id = users.id 
group by username;

select (select count(*) from photos)/ (SELECT count(*) from users);

select tag_name, count(tag_id) from photo_tags 
join tags 
	on tag_id = tags.id 
group by tag_id 
order by count(tag_id) desc 
limit 5;

select username, count(user_id) from likes 
join users 
	on users.id = user_id 
group by user_id 
having count(user_id) = (select count(id) from photos);


insert into table_name 
select username, count(photos.id) from users 
left join photos 
	on photos.user_id = users.id 
group by username;

SELECT @@GLOBAL.secure_file_priv;

select username, count(photos.id) from users 
left join photos 
	on photos.user_id = users.id 
group by username 
INTO OUTFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/username.csv'
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n';


load data infile 
'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/username.csv' 
into table newtable 
COLUMNS TERMINATED BY ',' 
OPTIONALLY ENCLOSED BY '"'
ESCAPED BY '"' 
LINES TERMINATED BY '\n';

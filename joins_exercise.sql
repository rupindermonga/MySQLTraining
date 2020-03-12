create database student_papers;

use student_papers;

create table students 
	(
		id int auto_increment primary key,
        first_name varchar(100)
	);

create table paper 
	(
		student_id int,
        title varchar(100),
        grade int,
        foreign key(student_id) references students(id)
	);
    
INSERT INTO students (first_name)
VALUES 
	('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

INSERT INTO paper (student_id, title, grade )
VALUES
	(1, 'My First Book Report', 60),
	(1, 'My Second Book Report', 75),
	(2, 'Russian Lit Through The Ages', 94),
	(2, 'De Montaigne and The Art of The Essay', 98),
	(4, 'Borges and Magical Realism', 89);
    
    
select first_name, title, grade from students
inner join paper
	on paper.student_id = students.id;

select first_name, title, grade from students
left join paper
	on paper.student_id = students.id;

select first_name, ifnull(title, "Missing"), ifnull(grade,0) from students
left join paper
	on paper.student_id = students.id;

select first_name, ifnull(avg(grade),0) from students
left join paper
	on paper.student_id = students.id
    group by first_name;

select first_name, ifnull(avg(grade),0) as average,
case when average >= 75 then "Passing"
	Else "Failing" 
    End as "passing_status"
from students
left join paper
	on paper.student_id = students.id
    group by first_name
    order by average desc;

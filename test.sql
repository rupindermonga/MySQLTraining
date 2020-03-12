drop database test;

create database test;

use test;

create table employees 
	(
		emp_id int auto_increment primary key, 
		name varchar(100), 
		salary int
	);
    
create table departments 
	(
		dept_id int auto_increment primary key, 
        dept_name varchar(100) 
	);

alter table departments 
	auto_increment = 101;

create table register 
	(
		emp_id int not null, 
		dept_id int not null, 
        foreign key(emp_id) references employees(emp_id), 
        foreign key(dept_id) references departments(dept_id)
	);

insert into employees 
	(name, salary) 
    values ("James", 2000), 
    ("Jack", 4000), 
    ("Henry", 6000);

insert into departments 
	(dept_name) 
    values 
    ("Sales"), ("Marketing"), ("Finance");
    
insert into register 
	(emp_id, dept_id) 
    values (1, 103), 
    (2, 101), 
    (2, 102);


select name, dept_name 
from employees 
join register 
on employees.emp_id = register.emp_id 
join departments on register.dept_id = departments.dept_id;

select name 
from employees 
left join register 
on employees.emp_id = register.emp_id 
where dept_id is Null;

select dept_name 
from departments 
left join register 
on departments.dept_id = register.dept_id 
where register.emp_id is null;
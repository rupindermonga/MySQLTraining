create table customers(
	id int auto_increment primary key,
    first_name varchar(100),
	last_name varchar(100),
	email varchar(100)
);

create table orders(
	id int auto_increment primary key,
	order_date date,
	amount decimal(8,2),
	customer_id int,
    foreign key(customer_id) references customers(id)
);

insert into customers (first_name, last_name, email)
values ('Boy', 'George', 'george@gmail.com'),
	('George', 'Michael', 'gm@gmail.com'),
	('David', 'Bowie', 'david@gmail.com'),
	('Blue', 'Steele', 'blue@gmail.com'),
    ('Bette', 'Davis', 'bette@gmail.com');

insert into orders (order_date, amount, customer_id)
values ('2016/02/10', 99.1, 1),
		('2017/11/11', 35.5, 1),
		('2014/12/12', 800.67, 2),
		('2015/01/03', 12.5, 2),
		('1999/04/11', 450.25, 5);
        
select id from customers where last_name = 'George';
select * from orders where customer_id = 1;

select * from orders where customer_id = 
	(
		select id from customers
        where last_name = 'George'
	);
    
select sum(amount) from orders where customer_id = 
	(
		select id from customers
        where last_name = 'George'
	);

select * from customers, orders where customer_id = customers.id;

Select first_name, last_name, order_date, amount from customers
Join orders
	On orders.customer_id = customers.id;

Select first_name, last_name, ifnull(sum(amount),0) as total from customers
left Join orders
	On orders.customer_id = customers.id group by customer_id order by total desc;

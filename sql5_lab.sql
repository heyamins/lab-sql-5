-- Drop column picture from staff.

use sakila;
select * from staff;
alter table staff
drop column picture;

-- A new person is hired to help Jon. Her name is TAMMY SANDERS, and she is a customer. Update the database accordingly.
select * from customer
where first_name = 'tammy';
use sakila;
select * from staff;

insert into staff
values
(3,'tammy','sanders',79,'TAMMY.SANDERS@sakilacustomer.org',2,1,'','','2006-02-15 04:57:20');

-- Add rental for movie "Academy Dinosaur" by Charlotte Hunter from Mike Hillyer at Store 1. 
select * from customer;
select * from staff;
select max(rental_id) from sakila.rental;

-- inventory id is 1~4
select * from inventory
where store_id = 1 and film_id = 1 order by inventory_id;

-- rental id 16050
select max(rental_id)+1 from sakila.rental;

-- customer id is 130
select * from customer where first_name = 'charlotte';

-- staff_id is 1 
select staff_id from staff
where first_name = 'mike' and last_name = 'Hillyer';

select now();
select * from rental
where rental_id=16052;

insert into rental
values 
(16051,now(),1,130,null,1,now());

-- for some errors refreshing the data change.
delete from rental
where rental_id > 16050;

/*
4. Delete non-active users, but first, create a backup table deleted_users to 
store customer_id, email, and the date for the users that would be deleted. Follow these steps:
*/

-- Create a table backup table as suggested
create table backup_table (
`customer_id` char(20) default null,
`email` char(20) default null,
`date` date default null);

select * from backup_table;

-- Check if there are any non-active users
-- Insert the non active users in the table backup table
-- Delete the non active users from the table customer

select * from customer
where active =0;

create table deleted_users2
select customer_id, email, now() from customer where active =0;

select * from deleted_users2;

select * from customer
where active = 0;

-- alter table restriction 

alter table payment
drop foreign key fk_payment_customer;

alter table payment
add constraint fk_payment_customer
foreign key (customer_id)
references customer (customer_id)
on delete cascade;

alter table rental
drop foreign key fk_rental_customer;

alter table rental
add constraint fk_rental_customer
foreign key (customer_id)
references customer (customer_id)
on delete cascade;

delete from customer
where active = 0;

select * from customer
where active = 0;
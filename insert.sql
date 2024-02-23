/*WAQ to insert a record with your own values in table against each column*/
/*(DATA MANIPULATION LANGUAGE)*/

use abcsolutions;

insert into countries values('C1',"India",1000);

/* WAQ to insert one row into the table country_id and country_name*/

insert into countries (country_id,country_name) values ("C2","Italy");

/* WAQ to duplicate table with it's structure and it's data*/

create table if not exists country_new as select * from countries;

/* WAQ to insert null value against regionid for a row of countries table*/

insert into countries (country_id,country_name,regionid) values("C3","China",null);

/* WAQ to insert three row at a time in table without using multiple insert statement*/

insert into countries values("C4","USA",200),("C5","Japan",2002),("C6","India",2001);

/* WAQ to insert one row in jobs table and ensure that no duplicate value inside of job_id column*/
use abcsolutions;
drop table job_history;
drop table jobs;
drop table employees;

create table if not exists jobs(
job_id integer not null unique,
job_title varchar(40) not null,
min_salary decimal(7,0));

insert into jobs values(1001,"Officer",8000);
insert into jobs values(1001,"ADMIN",8001);
select * from jobs;

/* write a query to insert into one row of table and ensure that no duplication
in job_id column of table*/

drop table jobs;
create table if not exists jobs(
job_id integer not null unique primary key,
job_title varchar (40) not null,
min_salary decimal (7,0));

insert into jobs values(1001,"Officer",8000);

/* WAQ to insert a record into table countries to ensure that country_id and regionid
combination once in table*/
drop table countries;
create table if not exists countries(
country_id integer not null,
country_name varchar(50) not null,
regionid integer not null,
primary key(country_id,regionid));

insert into countries values(501,"India",185);
insert into countries values(501,"Italy",185);

/* WAQ to insert into countries in which country_id will be integer and auto increament*/
drop table countries;
create table countries(country_id integer not null auto_increment primary key,
country_name varchar(50) not null,
regionid integer not null);

insert into countries(country_name,regionid) values ("India",185);
select * from countries;

/* WAQ to insert record into table countries to ensure that country_id will not contain
any duplicate data and this will be automatically increamented and country_name will be
automatically filled with 'NA' if  no values is assigned to it*/

drop table countries;
create table if not exists countries (
country_id integer not null primary key auto_increment,
country_name varchar(50) not null default 'N/A',
regionid integer not null);

insert into countries values(501,"India",102);
insert into countries (regionid) values (203);
select * from countries;

/* WAQ to insert rows in job_history table in which one column job_id is containing those
values which are exists in job_id column of jobs table*/

drop table jobs;
create table if not exists jobs(
job_id integer not null unique primary key,
job_title varchar(40) not null default ' ',
min_salary decimal(7,0) default 8000,
max_salary decimal(7,0) default 20000
);

insert into jobs(job_id,job_title) values (1001,"Officer");
insert into jobs(job_id,job_title) values (1002,"Clerk");
select * from jobs;

/*Creating Job history table for foreign key constraint*/

create table if not exists job_history(
employee_id integer not null primary key,
job_id integer not null,
department_id integer default null,
foreign key(job_id) references jobs(job_id)
);

insert into job_history values(501,1001,60);
insert into job_history values(502,1004,60);

/* WAQ to insert rows into employess table in which set of column department_id and
manager_id contain unique value and that values have exist into department table*/

drop table departments;

create table if not exists departments(
department_id integer not null unique,
department_name varchar(35) not null,
manager_id integer not null,
location_id integer default null,
primary key (department_id,manager_id));

insert into departments values(60,'SALES',201,89);
insert into departments values(61,'ACCOUNTS',201,89);
insert into departments values(80,'FINANCE',211,90);

select * from departments;

create table employees(
employee_id integer not null primary key,
first_name varchar(50) not null,
last_name varchar(50) not null,
job_id varchar(15) not null,
salary decimal(9,2) default null,
manager_id integer default null,
department_id integer default null,
foreign key(department_id,manager_id) references departments(department_id,manager_id));

insert into employees values(510,"ALEX","HANES","CLERK",18000,201,60);
insert into employees values(511,"KIM","LEON","CLERK",18000,211,80);

/* WAQ to insert into rows  table employees in which a set of columns manager_id ,department_id
 contain unique values and that combined values must have exist into table department*/
 drop table departments;
 drop table employees;
 
 create table departments(
 department_id integer not null unique,
 department_name varchar(35) not null,
 manager_id int default null,
 location_id integer default null,
 primary key (department_id));
 
 insert into departments values(60,"SALES",201,89);
 insert into departments values(61,"ACCOUNTS",201,89);

drop table job_history;
drop table jobs;

create table jobs(
job_id integer not null unique primary key,
job_title varchar(40) not null default ' ',
min_salary decimal(7,0) default 8000,
max_salary decimal(7,0) default 20000);

insert into jobs(job_id,job_title) values(1001,"OFFICER");
insert into jobs(job_id,job_title) values(1002,"CLERK");

create table employees(
employee_id integer not null primary key,
first_name varchar(30) default null,
last_name varchar(30) not null,
department_id integer default null,
foreign key(department_id) references departments(department_id),
job_id integer not null,
foreign key(job_id) references jobs(job_id),
salary decimal (9,2) default null);

insert into employees values(501,"ALEX","HANES",60,1001,18000);

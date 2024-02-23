/* WAQ to create a simple table name countries including columns
fields as
country_id,country_name and regionid*/

/* create database name ABC*/
create database ABCSolutions;

show databases;
use abcsolutions;

/* WAQ to create a simple table name countries having fields as
country_id,country_name and regionId we are using decimal where 1 value
show the total number of digit should be allowed and 2 number shows the precision value*/
create  table countries (
country_id varchar(4),
country_name varchar(50),
regionid decimal(12,0)
);

/* another approach to create table with having same column that already exist by using
if not keyword this is a controll flow statement*/

create table if not exists countries(
country_id varchar(4),
country_name varchar(50),
regionid decimal(12,0));

/* create structure of new table using existing table with the use of like clauese*/
/* like keyword is use whithin where clause for pattern matching*/

create table if not exists dup_countries like countries;

/*(DUPLICATE COPY OF TABLE)
 To create same structure of table countries with all data of that table into new table
using as and select keyword use as alias for table column name*/

create table if not exists dup_countries as select * from countries;

/* to delete the table we use drop keyword
it is a irreversible operation*/

drop table countries;

/* create table with constraint to it not null constraint*/

create table if not exists countries(
country_id varchar(4) not null,
country_name varchar(50) not null,
regionid decimal(12,0) not null);

/*WAQ to create table name job table having field job_id,job_title,min_salary,
max_salary and check whether the max_salary amount is exceeding the Upper limit
25000
The check constraint ensures that the values
in the specified column meet a specific condition or set of conditions.*/

create table if not exists jobs(
job_id varchar(12) not null,
job_title varchar(40) not null,
min_salary decimal(7,0),
max_salary decimal(7,0) check(max_salary<=25000));
use  abcsolutions;
drop table countries;

/* WAQ to create table countries using check constraint as only Italy,India,China will be 
entered*/

create table if not exists countries(
country_id varchar(4) not null,
country_name varchar(50)  check(country_name in("Italy","India","China")) not null,
regionid decimal(12,0));

/* WAQ to create table named job_history including columns emp_id,stat_date,end_date,job_id,
dept_id and value in column end_date will in formate of "--/--/----"*/

create table if not exists job_history (
employee_id decimal(7,0) not null,
state_date date not null,
end_date date not null check(end_date like "--/--/----" ),
job_id varchar(12) not null,
dept_id decimal(5,0) not null);

/* alter the table  by adding unique constraint to country_id to 
countries table to make sure that no duplication is allowed
*/
alter table countries
add unique(country_id);

drop table jobs;

/* WAQ to create table jobs having columns as job_id,job_title,min_sal,max_sal
make sure that default value for job title is blank and min salary would be 8000
and max salary is null will be entered at time of insertion if no value is entered for specific
columns
*/
create table if not exists jobs(
job_id varchar(12) not null unique,
job_title varchar(20) not null default ' ',
min_sal decimal(7,0) default 8000,
max_sal decimal(7,0) default null);


drop table countries;

/* WAQ to create table name countries having fields country_id,country_name,region_id
and make sure that the country_id column will be a key and do not contain any duplicate data
at time of insertion
By adding primary key constraint to it*/

create table if not exists countries(
country_id varchar(4) not null primary key unique,
country_name varchar(50) not null,
regionid decimal(12,0) not null);


/* create table countries having all the three field as well as country id must be
not null primary key and unique and also include feature of auto increament 
to do this we have to set data type as integer
*/
drop table countries;
create table if not exists countries(
country_id integer not null unique primary key auto_increment,
country_name varchar(50) not null,
regionid decimal(12,0) not null);

/* to view the schema of the table that was created use command desc which means
describe the table*/

desc countries;

drop table job_history;

/* WAQ to create table job_history including columns emp_id,start_date,end_date,job_id,dept_id
make sure that emp_id column does not contain any duplicate value foreign key job_id
here we are  using foriegn key first time
*/

create table if not exists job_history(
employee_id decimal(7,0) not null primary key,
start_date date not null,
end_date date not null,
job_id integer not null,
dept_id decimal(5,0) default null,
foreign key(job_id) references jobs(job_id));

desc job_history;

/* create a table having columns as department_id,department_name,manager_id,location_id
having two primary key in this table on department_id and manager_id and 
key is not assign on column level it will be assign after all the fields
*/
create table if not exists department(
dept_id decimal(5,0),
dept_name varchar(35) not null,
manager_id decimal(7,0),
location_id decimal (5,0) not null,
primary key(dept_id,manager_id));

/* create table employee having columns as employee_id,first_name,last_name
email,phone_number,hire_date,job_id,salary,commision_pct,manager_id,dept_id
foriegn key having combination of dept and manager id*/

create table if not exists employee(
employee_id decimal(7,0) not null,
first_name varchar(30) default null,
last_name varchar(30) not null,
email varchar(30) not null,
phone_number varchar(25) default null,
hire_date date not null,
job_id varchar(15) not null,
salary decimal(9,2) default null,
commision_pct decimal(3,2) default null,
manager_id decimal(7,0) default null,
dept_id decimal(5,0) default null,
foreign key(dept_id,manager_id) references department(dept_id,manager_id));
show tables ;
desc employee;

drop table employee;
drop table department;

/* create table department with single primary key*/
create table if not exists departments(
department_id decimal(5,0) primary key,
department_name varchar(30) not null,
manager_id decimal(7,0),
location_id decimal(5,0));
desc jobs;

/* creating table employee with two foreign key from differnt table*/
create table if not exists employee(
employee_id decimal(7,0) not null,
first_name varchar(30) default null,
last_name varchar(30) not null,
email varchar(30) not null,
phone_number varchar(25) default null,
hire_date date not null,
job_id varchar(15) not null,
salary decimal(9,2) default null,
commision_pct decimal(3,2) default null,
manager_id decimal(7,0) default null,
department_id decimal(5,0) default null,
foreign key(department_id) references departments(department_id),
foreign key(job_id) references jobs(job_id) );

drop table employee;

/* add a clause on delete cascade on update restrict; inside of employee table
When a foreign key relationship has the "ON DELETE CASCADE" constraint, it means that if a referenced row in the parent table is deleted, the corresponding rows in the child table will also be automatically deleted.
This ensures that there are no orphaned child records left without a corresponding parent record.
When a foreign key relationship has the "ON UPDATE RESTRICT" constraint, it means that if a referenced key in the parent table is updated, the update will be restricted if there are corresponding rows in the child table.
This prevents the update of the parent key if it would result in orphaned child records.

*/
create table if not exists employees(	
employee_id decimal(7,0) not null primary key,
first_name varchar(30) default null,
last_name varchar(30) not null,
job_id varchar(12) not null,
salary decimal(9,2) default null,
foreign key(job_id)
references jobs(job_id)
on delete cascade on update restrict);

/* different method for on delete cascade and on update restrict*/
drop table employees;
create table if not exists employees(
employee_id decimal(7,0) not null primary key,
first_name varchar(30) default null,
last_name varchar(30) not null,
job_id varchar(12) not null,
salary decimal(9,2) default null,
foreign key(job_id)
references jobs(job_id)
on delete set null
on update set null);

drop table job_history;
drop table jobs;

/* we are creating job_id as integer having autoincreament feature
*/
create table jobs(
job_id integer not null primary key unique,
job_title varchar(40) not null default ' ',
min_salary decimal(7,0) default 8000,
max_salary decimal(7,0) default null);

create table if not exists employees(
employee_id decimal(7,0) not null primary key,
first_name varchar(30) default null,
last_name varchar(30) not null,
job_id integer,
salary decimal(9,2) default null,
foreign key(job_id)
references jobs(job_id)
on delete set null
on update set null);

drop table employees;

/* another way to use on delete and on update statement this constraints are given
on the foreign key*/
create table employees(employee_id decimal(7,0) not null primary key,
first_name varchar(30) default null,
last_name varchar(30) not null,
job_id integer,
salary decimal(9,2) default null,
foreign key(job_id) references jobs(job_id)
on delete no action
on update no action);

/* drop country for the new task of insert query
and then create same table with no constraint in it*/

drop table countries;
create table countries(
country_id varchar(4),
country_name varchar(50),
regionid decimal(12,0));





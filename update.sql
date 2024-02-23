/* for UPDATE keyword or update query in SQL*/

/*WAQ to change the email column of employees table with "Not Available" for all employees
*/
drop table employees;

create table employees (
employee_id decimal(7,0) not null primary key,
first_name varchar(30) default null,
last_name varchar(30) not null,
email varchar(30) default null,
phone_number varchar(25) default null,
hire_date date,
job_id integer not null,
salary decimal (9,2) default null,
commission_pct decimal(9,2) default null,
manager_id decimal(9,0) default null,
department_id integer default null,
foreign key(department_id) references departments(department_id),
foreign key(job_id) references jobs(job_id));

desc employees;
insert into employees(employee_id,first_name,last_name,job_id,department_id) values
(100, 'ABCI','ATC',1001,60);
insert into employees(employee_id,first_name,last_name,job_id,department_id) values
(104, 'TCR','BCA',1002,61);

select * from employees;

update employees set email='NOT AVAILABLE';

/* WAQ to change commisionpct to 0.10 for all employees;*/
update employees set commission_pct=0.10;

select * from employees;
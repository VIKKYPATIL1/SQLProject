create database THEMEPARK;
use themepark;

create table themepark(
park_code varchar(10) primary key,
park_name varchar(35) not null,
park_city varchar(50) not null,
park_country char(2) not null);

create table employee(
emp_num numeric(4) primary key,
emp_title varchar(4),
emp_lname varchar(15) not null,
emp_fname varchar(15) not null,
emp_dob date not null,
emp_hire_date date,
emp_area_codee varchar(4) not null,
emp_phone varchar(12) not null,
park_code varchar(10),
index(park_code),
constraint fk_emp_park foreign key(park_code) references themepark(park_code));

create table attraction(
attract_no numeric(10) primary key,
attract_name varchar(35),
attract_age numeric(3) default 0 not null,
attract_capacity numeric(3) not null,
park_code varchar(10),
index(park_code),
constraint fk_attract_park foreign key(park_code) references themepark(park_code)); 

create table ticket(
ticket_no numeric(10) primary key,
ticket_price numeric(4,2) default 00.00 not null,
ticket_type varchar(10),
park_code varchar(10),
index (park_code),
constraint fk_ticket_park foreign key(park_code) references themepark(park_code));

create table hours(
emp_num numeric(4),
attract_no numeric(10),
hour_per_attract numeric(2) not null,
hour_rate numeric(4,2) not null,
date_worked date not null,
index(emp_num),
index(attract_no),
constraint pk_hours primary key(emp_num,attract_no,date_worked),
constraint fk_hours_attract foreign key(attract_no)
references attraction(attract_no));

create table sales(
transaction_no numeric primary key,
park_code varchar(10),
sale_date date not null,
index(park_code),
constraint fk_sales_park foreign key(park_code)
references themepark(park_code));


create table sales_line(
transaction_no numeric,
line_no numeric(2,0) not null,
ticket_no numeric(10) not null,
line_qty numeric(4) default 0 not null,
line_price numeric(9,2) default 0.00 not null,
index(transaction_no),
index(ticket_no),
constraint pk_sales_line primary key(transaction_no),
constraint fk_sales_line_sales foreign key(transaction_no)
references sales(transaction_no) on delete cascade,
constraint fk_sales_line_ticket foreign key(ticket_no)
references ticket(ticket_no));

/* creating indexes on table employee*/
create index emp_lname_index on employee(emp_lname(8));
desc attraction;

/* Modifing the data type of column using alter command*/

alter table attraction
modify attract_capacity numeric(4);
desc attraction;


insert into themepark values("fr1001","fairyland","paris","fr");
insert into themepark values("uk3452","pleasureland","stoke","uk");

insert into ticket values(13001,18.99,'child',"fr1001");
insert into ticket values(13002,20.99,'adult',"fr1001");
insert into ticket values(13003,34.99,'senior',"fr1001");
insert into ticket values(88567,22.50,'child',"uk3452");
insert into ticket values(88568,42.10,'adult',"uk3452");
insert into ticket values(88569,10.99,'senior',"uk3452");

select * from themepark;
insert into themepark values("nl1202","efling","noord","nl");	
insert into themepark values("sp4553","adventureport","barcelona","sp");
insert into themepark values("sq2323","labyrinthe","lausanne","sw");
insert into themepark values("uk2622","miniland","windor","uk");
insert into themepark values("za1342","goldtown","johannesburg","za");

select attract_no,attract_name,attract_capacity,park_code from attraction;

desc attraction;

insert into attraction values(10034,"thundercoaster",11,34,"FR1001");
insert into attraction values(10056,"spinningteacups",4,62,"FR1001");
insert into attraction values(10067,'FlightToStars',11,24,'FR1001');
insert into attraction values(10078,'Ant-Trao',23,30,'FR1001');
insert into attraction values(10098,'Carnival',3,120,'FR1001');
insert into attraction values(20056,'3D-Lego_show',3,200,'UK3452');
insert into attraction values(30011,'BlackHole2',12,34,'UK3452');
insert into attraction values(30012,'Pirates',10,42,'UK3452');
insert into attraction values(30044,'UnderSeaWorld',4,80,'UK3452');
insert into attraction values(98764,'GoldRush',5,80,'ZA1342');
use themepark;
select * from employee;

insert into employee values(100,'Ms.','Sharma','Richa','1972-06-15','1992-03-15',0181,'324-9134','FR1001');
insert into employee values(101,'Ms.','Chaugule','Shraddha','1978-03-19','1996-04-25',0181,'324-4472','UK3452');
insert into employee values(102,'Mr.','Paul','John','1969-11-14','1990-12-14',7253,'675-8993','FR1001');
insert into employee values(103,'Ms.','Shah','Reema','1974-10-16','1994-08-16',0181,'898-3456','UK3452');
insert into employee values(104,'Mr.','Patel','Enrica','1980-11-08','2001-11-08',7253,'324-9134','ZA1342');
insert into employee values(105,'Ms.','Shirke','Sneha','1990-03-14','2006-11-08',0181,'890-3243','FR1001');
insert into employee values(106,'Mrs.','Pillai','Hema','1968-02-12','1989-01-05',0181,'324-7845','ZA1342');

insert into ticket values(11001,24.99,'Adult','SP4553');
insert into ticket values(11002,14.99,'Child','SP4553');
insert into ticket values(11003,10.99,'Senior','SP4553');
insert into ticket values(67832,18.56,'Child','ZA1342');
insert into ticket values(67833,28.67,'Adult','ZA1342');
insert into ticket values(67834,12.12,'Senior','ZA1342');

insert into hours values(100,10034,6,6.5,'2007-05-18');
insert into hours values(100,10034,6,6.5,'2007-05-20');
insert into hours values(101,10034,6,6.5,'2007-05-18');
insert into hours values(102,30012,3,5.99,'2007-05-23');
insert into hours values(102,30044,6,5.99,'2007-05-21');
insert into hours values(102,30044,3,5.99,'2007-05-22');
insert into hours values(104,30011,6,7.2,'2007-05-21');
insert into hours values(104,30012,6,7.2,'2007-05-22');
insert into hours values(105,10078,3,8.5,'2007-05-18');
insert into hours values(105,10098,3,8.5,'2007-05-18');
insert into hours values(105,10098,6,8.5,'2007-05-19');

select * from hours;

select * from sales;

insert into sales values(12781,'FR1001','2007-05-18');
insert into sales values(12782,'FR1001','2007-05-18');
insert into sales values(12783,'FR1001','2007-05-18');
insert into sales values(12784,'FR1001','2007-05-18');
insert into sales values(12785,'FR1001','2007-05-18');
insert into sales values(12786,'FR1001','2007-05-18');

insert into sales values(34534,'UK3452','2007-05-18');
insert into sales values(34535,'UK3452','2007-05-18');
insert into sales values(34536,'UK3452','2007-05-18');
insert into sales values(34537,'UK3452','2007-05-18');
insert into sales values(34538,'UK3452','2007-05-18');
insert into sales values(34539,'UK3452','2007-05-18');
insert into sales values(34540,'UK3452','2007-05-18');
insert into sales values(34541,'UK3452','2007-05-18');

insert into sales values(67589,'ZA1342','2007-05-18');
insert into sales values(67590,'ZA1342','2007-05-18');
insert into sales values(67591,'ZA1342','2007-05-18');
insert into sales values(67592,'ZA1342','2007-05-18');
insert into sales values(67593,'ZA1342','2007-05-18');

desc sales_line;
insert into sales_line values(12781,1,13002,2,69.98);
insert into sales_line values(12781,2,13001,1,14.99);
insert into sales_line values(12782,1,13002,2,69.98);
insert into sales_line values(12783,1,13003,2,41.98);
insert into sales_line values(12783,1,13003,2,14.99);
insert into sales_line values(12784,2,13001,1,14.99);
insert into sales_line values(12785,1,13001,1,14.99);
insert into sales_line values(12785,2,13002,1,34.99);
insert into sales_line values(12785,3,13002,4,139.96);

insert into sales_line values(34534,1,88568,4,168.40);
insert into sales_line values(34534,2,88567,1,22.50);
insert into sales_line values(34534,3,89720,2,21.98);
insert into sales_line values(34535,1,88568,2,84.20);
insert into sales_line values(34536,1,89720,2,21.98);
insert into sales_line values(34537,1,88568,2,84.20);
insert into sales_line values(34537,3,88567,1,22.50);
insert into sales_line values(34538,1,89720,2,21.98);
insert into sales_line values(34539,1,89720,2,21.98);
insert into sales_line values(34539,2,88568,2,84.20);
insert into sales_line values(34540,1,88568,4,168.40);
insert into sales_line values(34540,2,88567,1,22.50);
insert into sales_line values(34540,2,89720,2,21.98);
insert into sales_line values(34541,2,88568,2,84.20);

insert into sales_line values(67589,1,67833,2,57.34);
insert into sales_line values(67589,2,67832,2,37.12);
insert into sales_line values(67590,1,67833,2,57.34);
insert into sales_line values(67590,2,67832,2,37.12);
insert into sales_line values(675891,1,67832,1,18.56);
insert into sales_line values(67591,2,67855,1,12.12);
insert into sales_line values(67592,1,67833,4,114.68);
insert into sales_line values(67593,1,67833,2,57.34);
insert into sales_line values(67593,2,67832	,2,37.12);

select * from sales_line;
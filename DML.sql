/*(DATA MANIPULATION LANGUAGE)*/
select * from attraction where attract_no=10034;
/* here we are now updating the capacity to 38 */

update attraction set attract_capacity=38 where attract_no=10034;

/* TO make age same for whole column using update command*/

update attraction set attract_age=14;
select * from attraction;

/* designing a view having the column that show increase in price by 10%
using the function round
also we use alise name for the column of increase price
This will not affect the database*/

select park_code,ticket_no,ticket_type,ticket_price,ticket_price+round((ticket_price*0.1),2) from ticket;
/* now time to give alias name to column*/

select park_code,ticket_no,ticket_type,ticket_price,ticket_price+round((ticket_price*0.1),2) Ticket_Increase_Price from ticket;

/* show data having ticket value greater than 20*/

select park_code,ticket_no,ticket_type,ticket_price from ticket where ticket_price>20 ;
/* Here we are comparing the acci value of park_code*/
select park_code,ticket_no,ticket_type,ticket_price from ticket where park_code<"UK2262";

/* if you want to see a listing for all ticket whose prices are between 30 and 50 */
/* between Command*/
use themepark;
select * from ticket where ticket_price between 30.00 and 50.00;

/* WAQ which display the employee number,attraction no the hour work per attraction
and the date worked where the hours worked per attraction is between 5 and 10;*/

select emp_num,attract_no,hour_per_attract from hours
where hour_per_attract between 5 and 10;

/* WAQ to find the rows in sales_line table that match up to the specific sales transaction
i.e transaction_no is either 12781 or 67593*/

select * from sales_line where transaction_no in(12781,67593);

/*WAQ to display all the tickets that are of type senior or child*/

select * from ticket where ticket_type in('Child','Senior');

/* WAQ to find all employee rows whose first name begins with letter A*/

select emp_lname,emp_fname,emp_num from employee
where emp_fname like 'S%';

/* WAQ to find all themepark that have a name ending in land*/

select * from themepark where park_name like '%land';

/* WAQ to list all attraction that do not have an attraction name was not assign*/

select * from attraction where attract_name is null;

/* WAQ to display the employee number (EMP_num) and attraction number (Attract_num)
for which numbr of  hours worked (hours_per_attract) by the employee is greater than 3 and date worked
(Date_worked) is after 18th may 2007*/

select emp_num,attract_no from hours where hour_per_attract>3 and
date_worked > '2007-05-18';

/* WAQ to display the details of all the attraction which are suitable for children
aged 14 or under and have a capacity of less than 100, do not display any information
for attraction which currently have no name
AND operator/clause */

select * from attraction where attract_age <= 14 and attract_capacity<100 and attract_name is not null;

/* WAQ to list the names and countries of all theme park where invoice
number where park_country='FR' or park_country='UK'
OR clause/operator*/

select park_name,park_country from themepark where park_country='UK'
or park_country='FR';

select * from attraction where (park_code like 'FR%' and attract_capacity <50)
or (attract_capacity>100);

/* WAQ to see the listing of all the rows for which emp_num is not 106
NOT operator/ clause*/

select * from employee where not(emp_num=106);

/* WAQ to display all the employee listed by EMP_hire_Date in decending order
DESC keyword for decending order*/

select * from employee order by emp_hire_date desc;

/* WAQ to which contain an example of  cascading  order
sequence, order emp_lname, emp_fname
fist time it follow lname  then fname*/

select * from employee order by emp_lname,emp_fname;

/* WAQ to check your output against the result
i.e ticket_price should be more than 15 and ticket_type should be
like child also order and ticket_no in descending*/

select ticket_type,park_code from ticket
where (ticket_price>15 and ticket_type like 'Child') order by ticket_no desc;

/* distinct operator
WAQ to list only the different themepark from attraction table*/

select distinct(park_code) from attraction;

/* aggregate count function
WAQ to find  out how many different theme park contained attraction from attraction table*/

select count(park_code) from attraction;

select count(distinct(park_code)) from attraction;

/* WAQ to display the number of distinct employee in hours name the column alias as number of employees
*/

select count(distinct(emp_num)) 'Number of employees' from hours;

select count(*) from attraction;

select* from attraction;
select count(attract_name) from attraction;

/* WAQ which illustrate the use of min or max function (aggrigate)*/

select min(ticket_price) 'Minimum ticket price', max(ticket_price)'Maximum ticket price' from ticket;

/* WAQ to display the avg amount spent on theme park ticket_per_customer (line_Price) and the total number of tickets
purchage(Line_qty)*/

select avg(line_price)'Average of line price',sum(line_qty)'Sum of line quantities' from sales_line;

/* WAQ to display the minimum and maximum ticket price of all price
group by clause for park_code*/

select park_code,min(ticket_price),max(ticket_price) from ticket group by park_code;

/*WAQ tp supposing you wanted to list the avg ticket price but 
wanted to limit the listing to themepark whose average ticket price
greater than or equal to 24.99
having clause 
to display on those record of aggrigate values that are greater than24.99*/

select park_code,avg(ticket_price)
from ticket group by park_code
having avg(ticket_price) >=24.99;

desc hours;
select emp_num,attract_no,avg(hour_per_attract) from hours
group by emp_num,attract_no
having avg(hour_per_attract)>=5;

/* Natural join example*/

select themepark.park_code,park_name,ticket_no,ticket_type,ticket_price
from themepark,ticket
where themepark.park_code=ticket.park_code;

select themepark.park_code,park_name,attract_name,attract_capacity from themepark,attraction
where themepark.park_code=attraction.park_code;

/* Using alias name*/

select p.park_code,park_name,ticket_no,ticket_type,ticket_price
from themepark p,ticket t where p.park_code=t.park_code;

/* using keyword*/

select transaction_no,sale_date,line_no,line_qty,line_price from sales 
join sales_line using(transaction_no);

/*on keyword*/

select sales.transaction_no,sale_date,line_no,line_qty,line_price from sales 
join sales_line on sales.transaction_no=sales_line.transaction_no;

/*left outer join*/

select themepark.park_code,park_name,attract_name from themepark left join attraction
on themepark.park_code=attraction.park_code;

/* Right outer join*/

select themepark.park_code,park_name,attract_name from themepark right join attraction
on themepark.park_code=attraction.park_code
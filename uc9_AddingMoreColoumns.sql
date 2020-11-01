--Creating Database
--uc1
Create Database payroll_services

--creating table 
--uc2
create table employee_payroll
(
id int NOT NULL IDENTITY(1,1) PRIMARY KEY ,
name varchar(150) NOT NULL,
salary float NOT NULL ,
start date NOT NULL
);

 --inserting values into table
 --uc3
insert into employee_payroll(name,salary,start)
values
('kajal',540987533,'2019-01-01'),
('kareena',67897644,'2020-09-06'),
('katrina',764455669,'2018-06-02');

--selecting values from table
--uc4
select * from employee_payroll;

--selecting with a condition
--uc5
select name,salary from employee_payroll where name ='kajal';
--getdate gives us present date 
select name from employee_payroll where start between CAST('2019-06-02' AS date) and GETDATE();

--altering the table
--uc6
alter table employee_payroll add gender char(1);
update employee_payroll set gender = 'M' where name ='kareena' or name = 'katrina';
update employee_payroll set gender = 'F' where name ='kajal';

--finding min max sum from salary
--finding count of people
--uc7
select gender,avg(salary) from employee_payroll group by gender ;
select count(name) from employee_payroll;
select min(salary) from employee_payroll;
select max(salary) as maxsalary from employee_payroll;
select sum(salary) from employee_payroll where gender ='M';

--adding coloumns in table
--uc8
alter table employee_payroll add phonenumber int ;
alter table employee_payroll add address varchar(50) default 'Pune';
alter table employee_payroll add department varchar(50) not null default 'HR' ;

--adding further coloumns
--uc9
alter table employee_payroll add Deductions float , taxable_pay float ,income_tax float , net_pay float ;
select * from employee_payroll;
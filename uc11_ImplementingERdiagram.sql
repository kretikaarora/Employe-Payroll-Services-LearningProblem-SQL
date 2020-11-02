--Welcome to employee payroll Services

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
('kajal',90000,'2019-01-01'),
('kareena',10000,'2020-09-06'),
('katrina',20000,'2018-06-02');

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

--Adding Duplicate entry for one contact with diff department
--uc10

--inserting values into table
update employee_payroll set address='Mumbai',phonenumber=708265478, department = 'Marketing',salary=10000,taxable_pay=500,Deductions=100, income_tax= 0.2*(salary) ,net_pay= salary-2600 where name ='kareena';
update employee_payroll set address='Pune',phonenumber=987265478,department = 'Sales',salary=20000,taxable_pay=500,Deductions=100, income_tax=  0.2*(salary) ,net_pay= salary-4600 where name ='kajal';
update employee_payroll set address='Bangalore',phonenumber=765265478, department = 'HR',salary=40000,taxable_pay=700,Deductions=100, income_tax= 0.2*(salary) ,net_pay= salary-8800 where name ='katrina';

--adding duplicate contact for diff department
insert into employee_payroll(name,salary,start,phonenumber,gender,address,department,Deductions,taxable_pay,income_tax,net_pay)
values
('kajal',20000,'2019-01-01',987265478,'F','Pune', 'Marketing',100,500,4000 ,15400);

--creating different tables for normalization using er relation
--uc11

--Creating company table 
create table company 
(CompanyId int primary key  not null ,
CompanyName varchar(150) not null);
--inserting values into company table 
insert into company(CompanyId , CompanyName)
values
(100,'Capgemini');


--creating department table 
create table department
(DepartmentId int Primary Key not null,
DepartmentName varchar(150) not null,
);
--inserting into department table
insert into department(DepartmentId,DepartmentName)
values
(001,'Sales'),
(002,'Marketing'),
(003,'HR'),
(004,'Operations');


--creating payroll table
create table payroll
(EmployeeID int not null primary key,
salary decimal not null,
Deductions decimal not null,
taxable_pay decimal not null,
income_tax decimal not null, 
net_pay decimal not null);
--inserting into payroll table
insert into payroll
values
(1,20000,100,500,4000,15400),
(2,10000,100,500,2000,7400),
(3,40000,100,700,8000,31200);


--creating EmployeeDepartment table for link
create table EmployeeDepartment
(EmployeeID int not null,
DepartmentId int not null);
--inserting into employeedepartment
insert into EmployeeDepartment
values
(1,001),
(2,002),
(3,003),
(1,002);



--altering employee payroll table and making it employee table by renaming and droping salary rows
alter table employee_payroll drop column Deductions,taxable_pay,income_tax,net_pay,salary;
exec sp_rename 'employee_payroll', 'employee'
--renaming employeeid for convinience
EXEC sp_rename 'employee_payroll.EmployeeId', 'EmployeeID', 'COLUMN';
--deleting redundant rows with name kajal
delete from employee where EmployeeID=9;
--deleting department rows by first removing constraint
alter table employee drop constraint DF__employee___depar__267ABA7A;
alter table employee drop column department;
--adding companyid to employee table with default value 100
alter table employee add CompanyId int not null default 100;
select *from employee;







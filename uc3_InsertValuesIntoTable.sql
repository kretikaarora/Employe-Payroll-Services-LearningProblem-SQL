Create Database payroll_services

create table employee_payroll
(
id int NOT NULL IDENTITY(1,1) PRIMARY KEY ,
name varchar(150) NOT NULL,
salary float NOT NULL ,
start date NOT NULL
);
 
insert into employee_payroll(name,salary,start)
values
('kajal',540987533,'2019-01-01'),
('kareena',67897644,'2020-09-06'),
('katrina',764455669,'2018-06-02');
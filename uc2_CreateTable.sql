Create Database payroll_services

create table employee_payroll
(
id int NOT NULL IDENTITY(1,1) PRIMARY KEY ,
name varchar(150) NOT NULL,
salary float NOT NULL ,
start date NOT NULL
);
---------UC1------------

------------Create Database---------

create database payroll_services;

use payroll_services;
----------------------------------
--------------UC2--------------

--------Create Tabel------------

create table employee_payroll
(
empId int identity(1,1) primary key,
name varchar(20) not null,
salary float,
startDate date,
emailId varchar(20)
);

--------------------------------------
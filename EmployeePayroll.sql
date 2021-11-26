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
-------------UC3 Inserting the values in table-----------

Insert into employee_payroll values ('Ashok',70000,'2021-05-15','ashok32@gmail.com'),('Karthick',55000,'2021-02-13','karthi21@gmail.com'),('Gayatri',45000,'2021-07-13','gaya@gmail.com'),('Divya',30000,'2021-08-23','divya2000@gmail.com');

-----------------------------------------------

-------------------UC4--------------------

select * from employee_payroll;

--------------------------------------


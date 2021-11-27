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
------------------UC5----------------

select name,salary from employee_payroll where name='Karthick';

select name,salary from employee_payroll where startDate between ('2021-02-01') and getdate();
-----------------------------------------------------------------
------------------UC6 Altered the table to add gender column---------------------

alter table employee_payroll add Gender char(1);

update employee_payroll set Gender='M' where name='Ashok' or name='Karthick';

update employee_payroll set Gender='F' where name='Gayatri' or name='Divya';
--------------------------------------------------------------
-------------------UC7 Using Aggregate Functions and GroupBy--------------------------------

select sum(salary) as TotalSalary from employee_payroll;

select sum(salary)as TotalSalary ,gender  from employee_payroll where Gender='F' group by Gender;

select sum(salary)as TotalSalary,gender from employee_payroll group by Gender;

select avg(salary)as TotalSalary,gender  from employee_payroll group by Gender;

select min(salary) as minSalary ,gender from employee_payroll   group by gender;

select count(salary) as CountofGender ,gender from employee_payroll   group by gender;

select max(salary) as maxSalary ,gender from employee_payroll   group by gender;
---------------------------------------------------------
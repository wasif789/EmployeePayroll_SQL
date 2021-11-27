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
----------------------UC8 Adding phone number, department and address columns-----------------

alter table employee_payroll add PhoneNumber bigint;

alter table employee_payroll add Department varchar(25) not null default 'HR';

update employee_payroll set PhoneNumber=8945125478 where name='Ashok';
update employee_payroll set PhoneNumber=9845127810 where name='Karthick';
update employee_payroll set PhoneNumber=8745123654 where name='Gayatri';
update employee_payroll set PhoneNumber=9874512458 where name='Divya';

update employee_payroll set Department='HR' where name='Ashok';
update employee_payroll set Department='Product development' where name='Gayatri';
update employee_payroll set Department='Business development' where name='Divya';
update employee_payroll set Department='Research development' where name='Karthick';


alter table employee_payroll add Address varchar(25) default 'Not Provided';


update employee_payroll set Address='Chennai' where name='Ashok';
update employee_payroll set Address='Bangalore' where name='Karthick';
update employee_payroll set Address='Cochin' where name='Gayatri';
update employee_payroll set Address='Hyderbad' where name='Divya';


select * from employee_payroll;
---------------------------------------------------------------------
--------------------UC9 Extended with basic pay, deductions, taxablepay,incometax,netpay--------------------


Exec sp_rename 'employee_payroll.salary','Basic Pay','COLUMN';

alter table employee_payroll add Deductions float,TaxablePay float,IncomeTax float,NetPay float;

update employee_payroll set Deductions=2000 where Department='HR';
update employee_payroll set Deductions=1200 where Department='Product development';
update employee_payroll set Deductions=1770 where Department='Business development' ;
update employee_payroll set Deductions=1112 where Department='Research development';


update employee_payroll set NetPay=65500 where name='Ashok';
update employee_payroll set NetPay=45300 where name='Gayatri';
update employee_payroll set NetPay=56900 where name='Karthick';
update employee_payroll set NetPay=62430 where name='Divya';


update employee_payroll set IncomeTax=1500;

update employee_payroll set TaxablePay=500;
---------------------------------------------------------------------------
--------------------UC10 Redundancy---------------------------

Insert into employee_payroll values('Ashok',70000,'2021-05-15','ashok32@gmail.com','M',8945125478,'HR','Chennai',2000,500,1500,65500);

select * from employee_payroll; 
------------------------------------------------------------------
---------------------UC11 ER Diagram---------------

---Company Table

Create Table Company(CompanyID int identity(1,1) primary key,CompanyName varchar(100));

---Insert the values
Insert into Company values ('Kishore'),('Kavya');
---Retrieve the data
select * from company;

--Create Employee Table
create table Employee
(EmployeeID int identity(1,1) primary key,
Company_Id int,
EmployeeName varchar(200),
EmployeePhoneNum bigInt,
EmployeeAddress varchar(200),
StartDate date,
Gender char,
Foreign key (Company_Id) references Company(CompanyID)
);
---Insert the employee table
insert into Employee (Company_Id,EmployeeName,EmployeePhoneNum,EmployeeAddress,StartDate,Gender)values
(1,'Vedhashni','9823567453','678 Greenwich street','2020-09-03','F'),
(2,'Nivetha','8954785124',' 456 Fith Avenue','2021-03-12','F'),
(1,'Kavin','9874587158','4682 Stone Street','2018-02-06','M'),
(2,'Rajkumar','8974587197','5678 Convent Avenue','2019-01-16','M');

update Employee set EmployeeName='Deepak' where EmployeePhoneNum='8974587197';
---Retrieve the data
Select * from employee;

--Create Payroll Table
create table PayRollCalculate
(
Employee_Id int,
BasicPay float,
TaxablePay float,
IncomeTax float,
NetPay float,
Deductions float,
Foreign key (Employee_Id) references Employee(EmployeeID)
);
---Insert the values in payrollcalculate table
Insert into PayRollCalculate (Employee_Id,BasicPay,IncomeTax,Deductions)values
(1,50000,1000,1500),
(2,60000,1432,1700),
(3,75000,1300,1870),
(4,80000,3000,2300);
---Retrieve the data
Select * from PayRollCalculate;

--Set the taxablepay and netpay value using update
update PayRollCalculate set TaxablePay=BasicPay-Deductions;

update PayRollCalculate set NetPay=TaxablePay-IncomeTax;

--Create Department Table
create table DepartmentTable
(
DepartmentId int identity(1,1) primary key,
DepartName varchar(100)
);
--Insert the value
Insert into DepartmentTable values
('HR'),
('Research development'),
('Product development');
--Retrieve the data
Select * from DepartmentTable;

----Create Employee Department table
create table EmpDept
(
Dept_Id int ,
Employee_Id int,
Foreign key (Employee_Id) references Employee(EmployeeID),
Foreign key (Dept_Id) references DepartmentTable(DepartmentID)
);
------Insert the values in employeedept table
Insert into EmpDept(Dept_Id,Employee_Id) values
(1,2),
(2,3),
(3,4),
(2,1);
--Retrieve the data
select * from EmpDept;
--------------------------------------------------------------------
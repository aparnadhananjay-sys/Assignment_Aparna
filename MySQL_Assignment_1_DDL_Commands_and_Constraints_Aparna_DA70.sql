-- DDL Commands : 

/* 1. Table Creation (CREATE):
Write the SQL statements to create a database named 
“employee” and the following tables based on the provided schema: 
⦿   Departments 
⦿   Location 
⦿   Employees 
*/

create database Employee;
use Employee;
show tables;

select * from employees;
select * from departments;
select * from locations;

-- Department Table Creation
create table departments (
    department_id   int primary key,
    department_name varchar(100) not null unique
);

insert into departments (department_id, department_name)
values
(1, 'HR'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Sales'),
(5, 'Marketing');

-- Locations Table Creation
create table locations (
    location_id int primary key,
    location varchar(30) not null    
);

insert into locations (location_id,location)
values
(1, 'Mysuru'),
(2, 'Bengaluru'),
(3, 'Hyderabad'),
(4, 'Chennai');

-- Employee Table Creation
create table employees (
    employee_id int primary key,
    employee_name varchar(50),
    gender enum ("M","F"),
    age int,
    hire_date date,
    designation varchar(100),
    department_id int,
    location_id int,
    salary decimal(10,2),
	constraint fk_employees_department
		foreign key (department_id) references departments(department_id),
    constraint fk_employees_location
        foreign key (location_id) references locations(location_id)
);

insert into employees (employee_id, employee_name, gender, age, hire_date,designation,department_id,location_id,salary)
values
(1,  'Ammu',     'F',  30,   '2020-01-10', 'Software Engineer',   3, 1, 650000),
(2,  'Anchu',    'F',  35,   '2019-03-15', 'HR Manager',          1, 2, 800000),
(3,  'Akhil',    'M',  29,   '2021-07-01', 'Sales Executive',     4, 3, 480000),
(4,  'Nehal',    'F',  40,   '2018-11-20', 'Finance Manager',     2, 2, 1100000),
(5,  'Arnav',    'M',  25,   '2022-05-12', 'Junior Developer',    3, 1, 420000),
(6,  'Arjun',    'M',  37,   '2021-02-18', 'Senior Developer',    3, 2, 950000),
(7,  'Kavitha',  'F',  27,   '2020-09-05', 'Marketing Executive', 5, 4, 500000),
(8,  'Mounik',   'M',  42,   '2019-06-25', 'Sales Manager',       4, 3, 1200000),
(9,  'Swathi',   'F',  28,   '2021-12-10', 'Accountant',          2, 1, 520000),
(10, 'Manohar',  'M',  32,   '2018-04-30', 'Team Lead',           3, 2, 900000),
(11, 'Poojitha', 'F',  40,   '2022-08-14', 'Marketing Manager',   5, 4, 1000000),
(12, 'Anmol',    'M',  31,   '2017-01-19', 'Business Analyst',    3, 3, 780000),
(13, 'Prajisha', 'F',  33,   '2020-11-03', 'HR Executive',        1, 1, 460000),
(14, 'Sundar',   'M',  36,   '2019-05-27', 'Senior Accountant',   2, 4, 750000),
(15, 'Divyank',  'M',  41,   '2023-03-08', 'Project Manager',     3, 2, 1300000),
(16, 'Prabesh',  'M',  NULL, '2021-10-12', 'Sales Executive',     4, 3, 470000),
(17, 'Sindhu',   NULL, 38,   '2020-06-18', 'Recruiter',           1, 1, 440000),
(18, 'Adarsh',   'M',  NULL, NULL,         'Content Strategist',  5, 4, 510000),
(19, 'Mithra',   'F',  37,   NULL,         'QA Engineer',         3, 2, 600000),
(20, 'Ajmal',    NULL, NULL, '2022-02-25', 'Financial Analyst',   2, 3, 680000);

use employee;
show tables;
select * from employees;
select * from departments;
select * from locations;

-- 2 .Table Alteration (ALTER):

/* Add a new column named "email" to the Employees table to store employee email addresses. */
alter table employees add email varchar(100); 
update employees
set email = concat(lower(employee_name), '@abc.com')
where employee_id > 0;

/* Modify the data type of the "designation" column in the Employees table 
   to support a wider range of values.  */
alter table employees modify column designation varchar(200);

/*  Drop the “age” column from the Employees table. */
alter table employees drop column age;

/* Rename the “hire_date” column to “date_of_joining”. */
alter table employees rename column hire_date to date_of_joining;

-- 3. Table Renaming (RENAME).

/*Rename the "Departments" table to "Departments_Info". */
alter table departments rename column department_name to departments_Info;

/*Rename the "Location" table to "Locations". */
alter table locations rename column location to Locations;

-- 4. Table Truncation (TRUNCATE): 
-- Write an SQL statement to truncate the Employees table.
truncate table employees;

-- 5. Database & Table Dropping (DROP): 
-- Write the SQL statements to drop the Employees table and then the “employee” database.
drop table employees;  
drop database employee;


-- Constraints :

-- 1. Drop and recreate the database
drop database if exists employees;
create database employee;
use employee;
select * from departments;
select * from locations;
select * from employees;

-- 2. Departments table
create table departments (
    department_id   int primary key,                
    department_name varchar(100) not null unique 
);

insert into departments (department_id, department_name)
values
(1, 'HR'),
(2, 'Finance'),
(3, 'IT'),
(4, 'Sales'),
(5, 'Marketing');

-- 3. Locations table
create table locations (
    location_id int auto_increment primary key,
    location    varchar(30) not null unique
);

insert into locations (location)
values
('Mysuru'),
('Bengaluru'),
('Hyderabad'),
('Chennai');
 
-- 4. Employees table
create table employees (
    employee_id   int primary key,                  
    employee_name varchar(50) not null,            
    gender        enum('M','F'),                  
    age           int,
    hire_date     date default (current_date),    
    designation   varchar(255),
    department_id int,
    location_id   int,
    salary        decimal(12,2),
    constraint chk_employees_age check (age >= 18),
    constraint fk_employees_department
        foreign key (department_id) references departments(department_id),
    constraint fk_employees_location
        foreign key (location_id) references locations(location_id)
);

insert into employees (employee_id, employee_name, gender, age, hire_date, designation, department_id, location_id, salary)
values
(1,  'Ammu',     'F',  30,   '2020-01-10', 'Software Engineer',   3, 1, 650000),
(2,  'Anchu',    'F',  35,   '2019-03-15', 'HR Manager',          1, 2, 800000),
(3,  'Akhil',    'M',  29,   '2021-07-01', 'Sales Executive',     4, 3, 480000),
(4,  'Nehal',    'F',  40,   '2018-11-20', 'Finance Manager',     2, 2, 1100000),
(5,  'Arnav',    'M',  25,   '2022-05-12', 'Junior Developer',    3, 1, 420000),
(6,  'Arjun',    'M',  37,   '2021-02-18', 'Senior Developer',    3, 2, 950000),
(7,  'Kavitha',  'F',  27,   '2020-09-05', 'Marketing Executive', 5, 4, 500000),
(8,  'Mounik',   'M',  42,   '2019-06-25', 'Sales Manager',       4, 3, 1200000),
(9,  'Swathi',   'F',  28,   '2021-12-10', 'Accountant',          2, 1, 520000),
(10, 'Manohar',  'M',  32,   '2018-04-30', 'Team Lead',           3, 2, 900000),
(11, 'Poojitha', 'F',  40,   '2022-08-14', 'Marketing Manager',   5, 4, 1000000),
(12, 'Anmol',    'M',  31,   '2017-01-19', 'Business Analyst',    3, 3, 780000),
(13, 'Prajisha', 'F',  33,   '2020-11-03', 'HR Executive',        1, 1, 460000),
(14, 'Sundar',   'M',  36,   '2019-05-27', 'Senior Accountant',   2, 4, 750000),
(15, 'Divyank',  'M',  41,   '2023-03-08', 'Project Manager',     3, 2, 1300000),
(16, 'Prabesh',  'M',  NULL, '2021-10-12', 'Sales Executive',     4, 3, 470000),
(17, 'Sindhu',   NULL, 38,   '2020-06-18', 'Recruiter',           1, 1, 440000),
(18, 'Adarsh',   'M',  NULL, DEFAULT,      'Content Strategist',  5, 4, 510000),
(19, 'Mithra',   'F',  37,   DEFAULT,      'QA Engineer',         3, 2, 600000),
(20, 'Ajmal',    NULL, NULL, '2022-02-25', 'Financial Analyst',   2, 3, 680000);

-- Testing the constraints

insert into employees (employee_id, employee_name, age) values (21, 'Test', 17);   -- age < 18 error
insert into employees (employee_id, employee_name) values (1, 'Dup');               -- duplicate id error
insert into employees (employee_id, employee_name) values (22, null);               -- null name error
insert into employees (employee_id, employee_name, gender) values (23, 'X', 'O');   -- invalid gender error
insert into departments values (6, 'HR');                                           -- duplicate dept name error
insert into locations (location) values (null);                                    -- null location error
insert into employees (employee_id, employee_name, department_id) values (24, 'Y', 99); -- bad FK error
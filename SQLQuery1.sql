--1 how to create the sql database
create database order_new
create database employee

--2 how to switch from one db to anther using query
use employee

--3 delete the db
DROP database employee

--4 how to create the table in the db
CREATE table emp1(
	ID INT,
	NAME VARCHAR(30),
	ADDRESS VARCHAR(30),
	SALARY INT,
	bonus float
)

--5 
CREATE table emp2(
	ID INT,
	NAME VARCHAR(30),
	ADDRESS VARCHAR(30),
	SALARY INT,
	bonus float
)
--6 how to insert the values in the tables
insert into emp2 values(1,'prakhar','india',1000000,3.5)
insert into emp2 values(2,'MOHIT','india',2000000,2.5)

--7 how to read any table
select * from emp2

--8 create table and insert only few column values in the table

insert into emp2(id,NAME,bonus) values(3,'RAHUL',4.5)
select * from emp2

--9 not null and unique constraints
-- table - email cant be blank
-- unique phone number
create table emp3(
	id int,
	email varchar(128) NOT NULL,
	phone varchar(28) UNIQUE 
)

insert into emp3 values(1,'prakhar','8887876118')
select * from emp3

insert into emp3(id,email,phone) values(2,'hello1@.com','9839588812')

--10 cheack and the default constraints 
--1. create the emp where age colomn should contain value only greater then 18.
--2. create the table employee where the country value should automatic take default INDIA.
create table emp4(
	id int,
	age int check (age>18),
	country varchar(28) default 'INDIA'
)

insert into emp4(id,age) values(1,20)
insert into emp4(id,age,country) values(1,20,'japan')
select * from emp4

-----------------------primary key -- its uniquely identify each row in the colomn, no two rows can have same PK value 

-- doesn't contain any duplicate value
-- it can not be null
-- we can have only one primary key in the colomn

-- difference b/t unique key and primary key
-- in a table we can have the one primary key but we can have the multiple unique key.
-- in primary key we can not have the NULL value but in the unique key we can have the NULL value.

-- eg..
create table emp6(
	id int primary key,
	email varchar(28)
)
select * from emp6
insert into emp6 values(1,'qwe')

---------------------------------------- EXAMPLE OF FORGIEN KEY

create table department(
		dept_id int PRIMARY KEY,
		dept_name varchar(28)
)

TRUNCATE TABLE student;

create table student1(
	id int primary key,
	name varchar(28),
	dept_id int 
	foreign key (dept_id) references department(dept_id)
)

create table employee(
	id int primary key,
	employee_name varchar(28),
	salary varchar,
	location varchar(28),
	dept varchar(28)
)

insert into employee values(1,'prakhar',1000000,'noida','SDE')
insert into employee values(2,'rohan',10000,'rath','ec')
insert into employee values(3,'mohit',800000,'indore','cs')
insert into employee values(4,'radhe',900000,'delhi','SDE')
insert into employee values(5,'ram pal',600000,'greater noida','aiml')
insert into employee values(6,'daya ram',700000,'mathura','python')
insert into employee values(6,'daya ram',700000,'python')

select * from employee
---------------------------------------------------- filtering and sorting 
-- how to filter the data in sql
-- filter the data from employee table where salary is greater then 70000
select * from employee where salary > 70000
-- filter the data from employee where location is null
select * from employee where location IS NULL

------------------------------------------------------ sort the data
-- sort the data based on highest to lowest salary
select * from employee order by salary desc
-- sort the data based on lowest to highest salary
select * from employee order by salary asc

------------------------------ difference b/t delete v/s drop v/s truncate

--delete - when you want to delete any spacific row or data in the table

delete from employee where id =4 

--------------------------------------------- update in sql
drop table employee3


CREATE TABLE employee3 (
    id INT PRIMARY KEY,
    employee_name VARCHAR(28),
    salary INT,
    location VARCHAR(28),
    dept VARCHAR(28)
);

INSERT INTO employee3 VALUES (1, 'prakhar', 1000000, 'noida', 'SDE');
INSERT INTO employee3 VALUES (2, 'rohan', 10000, 'rath', 'ec');
INSERT INTO employee3 VALUES (3, 'mohit', 800000, 'indore', 'cs');
INSERT INTO employee3 VALUES (4, 'radhe', 900000, 'delhi', 'SDE');
INSERT INTO employee3 VALUES (5, 'ram pal', 600000, 'greater noida', 'aiml');
INSERT INTO employee3 VALUES (6, 'daya ram', 700000, 'mathura', 'python');

SELECT * FROM employee3;
-- update employee location is jhansi where the location is rath
update employee3 set location = 'jhansi' where location = 'rath'
--update the salary 100000 for rohan
update employee3 set salary = 50000 where employee_name = 'rohan'

----------------------------------------- conditional operation
--- AND -- 
-- give me the employee details who are from hr department and also salary is 100000
select * from employee3 where dept = 'SDE' AND salary = 900000
-- the both condition should satisfied

-- give me the employee details who are from SDE department and also location is  noida

select * from employee3 where dept = 'SDE' AND location = 'noida'

-- OR -- one condition should be satisfied. 

-- give me the employee details of employee where id is 2,3,4,6

select * from employee3 where ID = 1 OR ID = 3 OR ID = 4 OR ID = 6 -- or
select * from employee3 where ID in (2,5,6)

 ----------------------------------------- AGGREGETE FUNCTION IN THE SQL

 CREATE TABLE employee4 (
    id INT PRIMARY KEY,
    employee_name VARCHAR(28),
    salary INT,
    location VARCHAR(28),
    dept VARCHAR(28)
);

INSERT INTO employee4 VALUES (7, 'arjun', 850000, 'bangalore', 'ML');
INSERT INTO employee4 VALUES (8, 'shivam', 750000, 'pune', 'cloud');
INSERT INTO employee4 VALUES (9, 'deepak', 950000, 'gurgaon', 'data science');
INSERT INTO employee4 VALUES (10, 'ankit', 550000, 'lucknow', 'iot');
INSERT INTO employee4 VALUES (11, 'sourav', 650000, 'jaipur', 'software engineer');
INSERT INTO employee4 VALUES (12, 'naman', 720000, 'chandigarh', 'cyber security');
INSERT INTO employee4 VALUES (13, 'anushka', 820000, 'mumbai', 'devops');
INSERT INTO employee4 VALUES (14, 'sneha', 770000, 'kolkata', 'full stack');
INSERT INTO employee4 VALUES (15, 'varun', 880000, 'hyderabad', 'SDE');
INSERT INTO employee4 VALUES (16, 'pankaj', 530000, 'kanpur', 'cloud engineer');
INSERT INTO employee4 VALUES (17, 'tanmay', 690000, 'bhopal', 'blockchain');
INSERT INTO employee4 VALUES (18, 'priyanshu', 780000, 'agra', 'software developer');
INSERT INTO employee4 VALUES (19, 'megha', 920000, 'dehradun', 'ai engineer');
INSERT INTO employee4 VALUES (20, 'ritesh', 640000, 'meerut', 'cyber security');
INSERT INTO employee4 VALUES (21, 'sanya', 890000, 'patna', 'big data');
INSERT INTO employee4 VALUES (22, 'himanshu', 570000, 'gwalior', 'backend');
INSERT INTO employee4 VALUES (23, 'ravi', 760000, 'coimbatore', 'frontend');
INSERT INTO employee4 VALUES (24, 'shreya', 910000, 'nagpur', 'data engineer');
INSERT INTO employee4 VALUES (25, 'manoj', 980000, 'chennai', 'SDE');

INSERT INTO employee4 VALUES (26, 'rahul', 800000, 'bangalore', 'AI');
INSERT INTO employee4 VALUES (27, 'sahil', 710000, 'pune', 'Machine Learning');
INSERT INTO employee4 VALUES (28, 'kavita', 940000, 'gurgaon', 'Data Analytics');
INSERT INTO employee4 VALUES (29, 'rohit', 590000, 'lucknow', 'IoT Engineer'); 
INSERT INTO employee4 VALUES (30, 'aisha', 670000, 'jaipur', 'Software Tester'); 
INSERT INTO employee4 VALUES (31, 'karan', 750000, 'mumbai', 'DevOps Engineer'); 
INSERT INTO employee4 VALUES (32, 'pooja', 780000, 'hyderabad', 'SDE-2'); 
INSERT INTO employee4 VALUES (33, 'vikas', 560000, 'kanpur', 'Cloud Security'); 
INSERT INTO employee4 VALUES (34, 'ramesh', 700000, 'bhopal', 'Blockchain Developer');
INSERT INTO employee4 VALUES (35, 'snehal', 850000, 'agra', 'Software Architect'); 

SELECT * FROM employee4;



-- find the max salary of employee from the table 
select max(salary) from employee4
select min(salary) from employee4

-- total salary
select sum(salary) from employee4

-- how many emplooyee we have
select count(id) from employee4

-- avg salary
select avg(salary) from employee4

------------------------------------- Use of GROUP BY in SQL 
-- GROUP BY ---- we use the 'GROUP BY' to group rows based on the value of column
-- find the number of customer in each country
SELECT * FROM employee4;
-- number of employee present in each location
select count(id), location from employee4 group by location

-- find the highest salary employee from each location
select max(salary), location from employee4 group by location

-- find the lowet earning salary from each location
select min(salary) , location from employee4 group by location

-- find the total salary from each location 
select sum(salary) , location from employee4 group by location

-- find the total salary from each dept 
select sum(salary) , dept from employee4 group by dept


--------------------------------------------like operator
CREATE TABLE invoices (
    sno INT PRIMARY KEY,
    invoice_no VARCHAR(20),
    description VARCHAR(255),
    quantity INT,
    invoice_date DATE,
    customer_id INT,
    country VARCHAR(50)
);

INSERT INTO invoices VALUES 
(1, 'INV001', 'Wireless Mouse with Ergonomic Design and Adjustable DPI', 5, '2024-03-01', 101, 'USA'),
(2, 'INV002', 'Mechanical Keyboard with RGB Backlight and Customizable Macros DPI', 3, '2024-03-02', 102, 'Canada'),
(3, 'INV003', 'High-Performance Gaming Laptop with NVIDIA RTX 4070 GPU', 2, '2024-03-03', 103, 'UK'),
(4, 'INV004', 'Wireless Multiport USB-C Hub with HDMI, USB 3.0, and SD Card Reader', 4, '2024-03-04', 104, 'Germany'),
(5, 'INV005', 'Latest 5G Smartphone with AI Camera and 5000mAh Battery', 1, '2024-03-05', 105, 'India'),
(6, 'INV006', '10-inch Android Tablet with Stylus and 128GB Storage DPI', 2, '2024-03-06', 106, 'Australia'),
(7, 'INV007', 'Wireless Noise-Canceling Earbuds with Long Battery Life', 6, '2024-03-07', 107, 'France'),
(8, 'INV008', 'Portable Bluetooth Speaker with Deep Bass and Waterproof Design', 4, '2024-03-08', 108, 'Spain'),
(9, 'INV009', 'Smartwatch with Heart Rate Monitor, GPS, and Fitness Tracking', 3, '2024-03-09', 109, 'Italy'),
(10, 'INV010', '2TB External Hard Drive with Shockproof and Secure Encryption DPI', 5, '2024-03-10', 110, 'Netherlands'),
(11, 'INV011', '27-inch 4K Ultra HD Monitor with Adjustable Stand and HDR', 2, '2024-03-11', 111, 'Brazil'),
(12, 'INV012', 'Wireless High-End Graphics Card with 16GB GDDR6X VRAM for Gamers', 1, '2024-03-12', 112, 'Russia'),
(13, 'INV013', 'Ergonomic Gaming Chair with Adjustable Armrests and Lumbar Support', 3, '2024-03-13', 113, 'China'),
(14, 'INV014', 'Compact Mechanical Keyboard with Hot-Swappable Switches DPI', 2, '2024-03-14', 114, 'Japan'),
(15, 'INV015', 'Wireless Mouse with Silent Clicks and Ultra-Fast Scrolling', 4, '2024-03-15', 115, 'South Korea'),
(16, 'INV016', 'Flagship Smartphone with 200MP Camera and Snapdragon Processor', 1, '2024-03-16', 116, 'Mexico'),
(17, 'INV017', 'Lightweight Tablet with 8-Core Processor and 2K Display', 3, '2024-03-17', 117, 'Argentina'),
(18, 'INV018', 'Rugged Bluetooth Speaker with LED Lights and 24-Hour Playback', 5, '2024-03-18', 118, 'South Africa'),
(19, 'INV019', 'High-Speed USB-C Hub with Ethernet Port and Power Delivery', 2, '2024-03-19', 119, 'New Zealand'),
(20, 'INV020', 'Advanced Smartwatch with ECG, SpO2, and Sleep Monitoring', 4, '2024-03-20', 120, 'UAE');

update invoices set description = 'Flagship Smartphone with 200MP Camera and Snapdragon Processor' where description = 'Customizable Macros DPI'

select * from invoices

-- search all the record where description start with Wireless
	select * from invoices where description like 'Wireless%'
-- search all the record where description end with DPI
	select * from invoices where description like '%DPI'
-- search all the record where description is with
	select * from invoices where description like '%hub%'

------------------------------------ having clause on sql

-- the sql having clause is similar to the where clause	. this filter the row in the colomn for specific criteria

-- the having clause was added to the sql because the where keyword can not be used with aggregate function

-- top 3 rows

	select top 3 * from invoices

--- distinct record from table - when the table have the same rows then it make only one row and remove the remaining

select distinct quantity,invoice_date from invoices

------------------------------------------coalece in SQL

-- when we have to deal with any null value in a table then we use coalesce function 

-- Create the Employees table with NULL values
CREATE TABLE Employees33 (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    address VARCHAR(100),
    salary DECIMAL(10,2)
);

-- Insert sample data with NULL values
INSERT INTO Employees33 (id, name, age, address, salary) VALUES
(101, 'John', 28, 'New York', 50000),
(102, 'Alice', NULL, 'Los Angeles', 60000),
(103, NULL, 25, 'Chicago', 45000),
(104, 'Carol', 40, NULL, 75000),
(105, 'Dave', 29, 'San Francisco', NULL),
(106, NULL, NULL, 'Miami', 67000);

-- Select all data
SELECT * FROM Employees33;

-- remove all the null form the age colomn
select coalesce(age,1) from Employees33

-- select first available email

select name,coalesce(age,salary,111) from Employees33

-- calculate total compensation (id + salary) salary contain some null values so first we have to convert the null to some values

select	id+coalesce(salary,0) from Employees33


-----------------------------------------------JOIN

-- Create the Departments table
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- Create the Employees table
CREATE TABLE Employees12 (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    salary DECIMAL(10,2),
    dept_id INT,  -- Foreign key linking to Departments table
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

-- Insert data into Departments table
INSERT INTO Departments (dept_id, dept_name) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance'),
(4, 'Marketing');

-- Insert data into Employees table with some NULL dept_id values
INSERT INTO Employees12 (emp_id, name, age, salary, dept_id) VALUES
(101, 'John', 28, 50000, 1),
(102, 'Alice', 32, 60000, 2),
(103, 'Bob', 25, 45000, 3),
(104, 'Carol', 40, 75000, NULL),  -- No department assigned
(105, 'Dave', 29, 55000, 2),
(106, 'Eva', 35, 67000, 4),
(107, 'Frank', 30, 48000, NULL);  -- No department assigned

select * from Employees12
select * from Departments
------- inner join
select * from Employees12 inner join Departments on Employees12.dept_id=Departments.dept_id

------ left join
select * from Employees12 left join Departments on Employees12.dept_id=Departments.dept_id

------ right join
select * from Employees12 right join Departments on Employees12.dept_id=Departments.dept_id

------ full join
select * from Employees12 full join Departments on Employees12.dept_id=Departments.dept_id


-- union and union all operations

-- UNION --- to perform union and union all the schema of both table should be same 
select * from Employees12 
union 
select * from Departments

select * from Employees12 
union all 
select * from Departments

--------------------------- alter - when we have to change the structure of the table , like varchar to int or delete the existing table

CREATE TABLE example1 (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
	depy_id int
);

INSERT INTO example1 (emp_id, name,depy_id ) VALUES
(1, 'HR' , 111),
(2, 'IT' , 222),
(3, 'Finance', 333),
(4, 'Marketing' , 444);

select * from example1

-- add new col salary in the existing table without dropping it

alter table example1 ADD salary int 
UPDATE example1 SET salary = 50000 WHERE emp_id = 1;
UPDATE example1 SET salary = 60000 WHERE emp_id = 2;
UPDATE example1 SET salary = 55000 WHERE emp_id = 3;
UPDATE example1 SET salary = 52000 WHERE emp_id = 4;
-- change the schema of salary col int to varchar
alter table example1 alter column salary varchar(128)

-- delete the colomn salary from the existing table 
alter table example1 drop column salary




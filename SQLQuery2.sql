-- advance sql

-- windows function 
create database employee2

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Product VARCHAR(50),
    Category VARCHAR(50),
    Quantity INT,
    Price DECIMAL(10,2),
    OrderDate DATE
);
	INSERT INTO Orders (OrderID, CustomerName, Product, Category, Quantity, Price, OrderDate) VALUES
	(1, 'Alice', 'Laptop', 'Electronics', 1, 60000, '2024-03-01'),
	(2, 'Bob', 'Phone', 'Electronics', 2, 30000, '2024-03-02'),
	(3, 'Alice', 'Chair', 'Furniture', 1, 5000, '2024-03-03'),
	(4, 'Charlie', 'Phone', 'Electronics', 1, 30000, '2024-03-03'),
	(5, 'Bob', 'Table', 'Furniture', 1, 7000, '2024-03-04'),
	(6, 'Alice', 'Laptop', 'Electronics', 1, 60000, '2024-03-05'),
	(7, 'Bob', 'Chair', 'Furniture', 2, 5000, '2024-03-06'),
	(8, 'Charlie', 'Laptop', 'Electronics', 1, 60000, '2024-03-07'),
	(9, 'Alice', 'Phone', 'Electronics', 1, 30000, '2024-03-07');

select * from Orders


-- windows function - types - aggregate function | ranking function | value function

-- aggregate function 
-- find the total price based on category

select category,sum(price) from Orders group by Category

select *,sum(price) OVER(PARTITION BY category) from Orders

-- addreageate function
select *,max(price) OVER(PARTITION BY category) 'max' from Orders -- same from min and same for avg

-- in one line

select *,avg(price) OVER(PARTITION BY category) 'avg',
min(price) OVER(PARTITION BY category)'max',
max(price) OVER(PARTITION BY category) 'min'
from Orders


--  ranking function - ROW NUMBER | RANK | DENSE RANK

-- define the rank or number based on the order define by the order by clause of the over function

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
INSERT INTO employee3 VALUES (7, 'hello', 800000, 'indore', 'cs');
INSERT INTO employee3 VALUES (8, 'riya', 800000, 'indore', 'cs');
 INSERT INTO employee3 VALUES (9, 'miya', 900000, 'indore', 'cs');


INSERT INTO employee3 VALUES (4, 'radhe', 900000, 'delhi', 'SDE');
INSERT INTO employee3 VALUES (5, 'ram pal', 600000, 'greater noida', 'aiml');
INSERT INTO employee3 VALUES (6, 'daya ram', 700000, 'mathura', 'python');

SELECT * FROM employee3;

select *,ROW_NUMBER() OVER(order by salary desc) as rn from employee3

select *,DENSE_RANK() OVER(order by salary desc) as rn from employee3

select *,RANK() OVER(order by salary desc) as rn from employee3

--------------------- value function -- lead and lag funtion

---- lead and lag are use to access the data from next row(lead) or previous row (lag) in a result data
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

-- sort the data bsed on the invoice date
-- lag

select *,lag(quantity) over(order by invoice_date) as lag from invoices
-- previous to the previous 
select *,lag(quantity,2,0) over(order by invoice_date) as lag from invoices

--lead 
select *,lead(quantity) over(order by invoice_date) as lead from invoices
-- previous to the previous 
select *,lead(quantity,2,0) over(order by invoice_date) as lead from invoices

-- cte 
 
 -- syntax 
  with cte as(
	-- complex quary
  )
  select * form cte 


  CREATE TABLE employee5 (
    id INT PRIMARY KEY,
    employee_name VARCHAR(28),
    salary INT,
    location VARCHAR(28),
    dept VARCHAR(28)
);

INSERT INTO employee5 VALUES (1, 'prakhar', 1000000, 'noida', 'SDE');
INSERT INTO employee5 VALUES (2, 'rohan', 10000, 'rath', 'ec');
INSERT INTO employee5 VALUES (3, 'mohit', 800000, 'indore', 'cs');
INSERT INTO employee5 VALUES (7, 'hello', 800000, 'indore', 'cs');
INSERT INTO employee5 VALUES (8, 'riya', 800000, 'indore', 'cs');
 INSERT INTO employee5 VALUES (9, 'miya', 900000, 'indore', 'cs');


 select * from employee5

 -- find the tird thighest salary from the employee table
 -- first i use the windows function to rank the salary

 WITH cte AS(
 select *,ROW_NUMBER() over(order by salary desc) as rn from employee5
 )
 select * from cte where rn = 3    -- now apply the filter


 -- find the second lowest salary
  WITH cte AS(
 select *,ROW_NUMBER() over(order by salary asc) as rn from employee5
 )
 select * from cte where rn = 2 



 ---- views in sql 
 -- it is the virtual table generated by the  quaries
 -- it store the quaries that generate the data on demands

 -- adv
 -- complex quary 
 -- enhance security
 -- maintain data consistancy

 -- limitation 
 -- performance

   CREATE TABLE employee6 (
    id INT PRIMARY KEY,
    employee_name VARCHAR(28),
    salary INT,
    location VARCHAR(28),
    dept VARCHAR(28)
);

INSERT INTO employee6 VALUES (1, 'prakhar', 1000000, 'noida', 'SDE');
INSERT INTO employee6 VALUES (2, 'rohan', 10000, 'rath', 'ec');
INSERT INTO employee6 VALUES (3, 'mohit', 80000, 'indore', 'cs');
INSERT INTO employee6 VALUES (7, 'hello', 80000, 'indore', 'cs');
INSERT INTO employee6 VALUES (8, 'riya', 80000, 'indore', 'cs');
 INSERT INTO employee6 VALUES (9, 'miya', 90000, 'indore', 'cs');


 select * from employee6

 create view emp_info as 
 select employee_name,salary from employee6

 select * from emp_info

 -- delete the view 

 drop view emp_info

 -- stored procedure 

 -- if we want to use the sql code again and again then we use the stored procedure
 -- difference in view and stored procedure is that in stored procedure we can pass the parameter

 -- SYNTAX

 create procedure procedure_name 
 as
 -- sql statement
 go;

 EXEC procedure_name -- call the stored procedure


 -- taking the previous example

 create procedure employ_sp 
 as
 select * from employee6
 go;

 EXEC employ_sp -- call the stored procedure

 -- pass the parameter in the stored procedure

-- like pass the dept_id

create procedure emp_sp1 @dept_id int as 
select * from employee6 where id= @dept_id

exec emp_sp1 2


-- multiple parameter
create procedure emp_sp2 @dept_id int , @salary int as
select * from employee6 where id=@dept_id and salary>@salary
exec emp_sp2 1,10000


-- sub quary -- nested quary or inner quary

-- it allow to use the result of one quary as the input of the other quary


   CREATE TABLE employee7 (
    id INT PRIMARY KEY,
    employee_name VARCHAR(28),
    salary INT,
    location VARCHAR(28),
    dept VARCHAR(28)
);

INSERT INTO employee7 VALUES (1, 'prakhar', 1000000, 'noida', 'SDE');
INSERT INTO employee7 VALUES (2, 'rohan', 10000, 'rath', 'ec');
INSERT INTO employee7 VALUES (3, 'mohit', 80000, 'indore', 'cs');
INSERT INTO employee7 VALUES (7, 'hello', 80000, 'indore', 'cs');
INSERT INTO employee7 VALUES (8, 'riya', 80000, 'indore', 'cs');
 INSERT INTO employee7 VALUES (9, 'miya', 90000, 'indore', 'cs');


 select * from employee7

 -- find the employee who earn more then the avg of the other employee
 select avg(salary) from employee7

 select * from employee7 where salary > ( select avg(salary) from employee7)

 -- list employee who worked in the department loacted in indore 

 select * from employee7 where location = 'indore'

 -- triggers in sql 
  -- it is the set of instruction which automatic execute in responce of spacific event on perticular table or view

  -- eg - if anyone delete the data from the table then the trigger active and it backup the data in my backup table 

  -- before trigger
  -- after trigger 
  -- instead triggger 


--   syntax

crete trigger trg_delete 
on main table 
after delete 
as 
begin 
insert into the bacuptable ()


-- ex

CREATE TABLE books (
    book_id INT PRIMARY KEY,
    title VARCHAR(255),
    author VARCHAR(100)
);

CREATE TABLE deletion_log (
    log_id INT IDENTITY(1,1) PRIMARY KEY,
    deleted_at DATETIME,
    message NVARCHAR(500)
);

CREATE TRIGGER log_book_deletion
ON books
AFTER DELETE
AS
BEGIN
    INSERT INTO deletion_log (deleted_at, message)
    SELECT 
        GETDATE(), 
        'Book deleted: ' + title + ' by ' + author
    FROM deleted;
END;

INSERT INTO books (book_id, title, author)
VALUES (4, 'The Alchemist', 'areee ');
select * from books
DELETE FROM books WHERE book_id = 4;

SELECT * FROM deletion_log;


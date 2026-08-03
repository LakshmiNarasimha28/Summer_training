CREATE DATABASE IF NOT EXISTS sql_training;
USE sql_training;

DROP TABLE IF EXISTS employees;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10 , 2 ),
    bonus_pct DECIMAL(5 , 2 ),
    hire_date DATE,
    birth_date DATE,
    last_login DATETIME
);

INSERT INTO employees
(first_name, last_name, email, department, salary, bonus_pct, hire_date, birth_date, last_login)
VALUES
('Amit',    'Sharma',   'amit.sharma@company.com',    'Sales',       55000.756, 8.5,  '2019-03-15', '1990-06-12', '2026-07-01 09:15:00'),
('Priya',   'Verma',    'priya.verma@company.com',    'Marketing',   62000.333, 10.25,'2020-07-22', '1988-11-25', '2026-07-05 14:42:00'),
('Rahul',   'Nair',     'rahul.nair@company.com',     'IT',          78500.999, 12.0, '2018-01-10', '1992-02-18', '2026-07-10 08:05:00'),
('Sneha',   'Iyer',     'sneha.iyer@company.com',     'Finance',     49500.125, 6.75, '2021-11-05', '1995-09-30', '2026-06-28 17:30:00'),
('Karan',   'Malhotra', 'karan.malhotra@company.com', 'IT',          91000.5,   15.0, '2016-05-19', '1985-04-02', '2026-07-11 11:20:00'),
('Neha',    'Gupta',    'neha.gupta@company.com',     'Sales',       53000.0,   9.4,  '2022-02-28', '1998-01-15', NULL),
('Vikram',  'Singh',    'vikram.singh@company.com',   'HR',          47000.45,  5.5,  '2023-08-14', '1993-07-08', '2026-07-12 19:10:00'),
('Ananya',  'Das',      'ananya.das@company.com',     'Marketing',   58000.876, 7.2,  '2017-09-01', '1991-12-20', '2026-07-09 10:00:00'),
('Rohan',   'Kapoor',   'rohan.kapoor@company.com',   'Finance',     67000.654, 11.1, '2019-12-12', '1989-03-27', '2026-07-02 13:55:00'),
('Ishita',  'Joshi',    'ishita.joshi@company.com',   'HR',          51000.2,   8.0,  '2020-04-04', '1996-10-10', '2026-07-07 16:25:00');

SELECT 
    *
FROM
    employees;
desc employees;

SELECT 
    ROUND(salary) AS Salary
FROM
    employees;

SELECT 
    first_name,
    last_name,
    TRUNCATE(salary, 1) AS TruncatedSalary
FROM
    employees;

SELECT 
    first_name,
    last_name,
    ROUND(salary / 12, 2) AS MonthlySalary
FROM
    employees;

SELECT 
    ROUND(salary * bonus_pct / 100, 2) AS bonus_amount
FROM
    employees;

SELECT 
    ABS(salary - (SELECT 
                    AVG(salary)
                FROM
                    employees)) AS diffrence_avg
FROM
    employees;

SELECT 
    first_name,
    last_name,
    salary,
    ABS(salary - (SELECT 
                    AVG(salary)
                FROM
                    employees)) AS SalaryDifference
FROM
    employees;

SELECT 
    first_name,
    last_name,
    salary,
    CEIL(salary) AS CeilingValue,
    FLOOR(salary) AS FloorValue
FROM
    employees;

SELECT 
    emp_id, first_name, last_name
FROM
    employees
WHERE
    MOD(emp_id, 2) = 1;

SELECT 
    first_name,
    last_name,
    salary,
    SQRT(salary) AS SquareRootOfSalary
FROM
    employees;

SELECT 
    CONCAT(first_name, ' ', last_name) AS full_name,
    salary,
    bonus_pct,
    GREATEST(salary, bonus_pct * 10000) AS GreaterValue
FROM
    employees;

SELECT 
    first_name,
    last_name,
    DATE_FORMAT(hire_date, '%d %M %Y') AS FormattedHireDate
FROM
    employees;

SELECT 
    first_name,
    last_name,
    hire_date,
    DATEDIFF(CURDATE(), hire_date) AS DaysWorked
FROM
    employees;

SELECT 
    first_name,
    last_name,
    birth_date,
    TIMESTAMPDIFF(YEAR,
        birth_date,
        CURDATE()) AS Age
FROM
    employees;

SELECT 
    first_name,
    last_name,
    hire_date,
    DAYNAME(hire_date) AS HireDay
FROM
    employees;

SELECT 
    emp_id, first_name, last_name, hire_date
FROM
    employees
WHERE
    MONTH(hire_date) = 12;

SELECT 
    first_name,
    last_name,
    hire_date,
    DATE_ADD(hire_date, INTERVAL 3 YEAR) AS Eligible_for_Pension
FROM
    employees;

SELECT 
    first_name,
    last_name,
    birth_date,
    LAST_DAY(birth_date) AS LastDayOfBirthMonth
FROM
    employees;

SELECT 
    emp_id, first_name, last_name, hire_date
FROM
    employees
WHERE
    hire_date >= DATE_SUB(CURDATE(), INTERVAL 5 YEAR)
ORDER BY hire_date DESC;

SELECT 
    first_name,
    last_name,
    CONCAT(YEAR(hire_date),
            ' - Q',
            QUARTER(hire_date)) AS HireYearQuarter
FROM
    employees;

CREATE VIEW employee_basic AS
    SELECT 
        first_name, last_name, department, salary
    FROM
        employees;

SELECT 
    *
FROM
    employee_basic;

show full tables where Table_type = 'VIEW';
desc employee_basic;

UPDATE employee_basic 
SET 
    salary = 75000
WHERE
    first_name = 'Neha';
SELECT 
    first_name, salary
FROM
    employees
WHERE
    first_name = 'Neha';

set sql_safe_updates = 0;

CREATE VIEW employee_base AS
    SELECT 
        CONCAT(first_name, ' ', last_name) AS name, salary
    FROM
        employees;

SELECT 
    *
FROM
    employee_base;

create index idx_email on employees(email);
show index from employees; 
drop index idx_email on employees;

CREATE VIEW top_paid_it_employees AS
    SELECT 
        *
    FROM
        employees
    WHERE
        salary > 70000 AND department = 'IT'
    ORDER BY salary DESC;
SELECT 
    *
FROM
    top_paid_it_employees;

CREATE VIEW annual_salary_view AS
    SELECT 
        emp_id,
        CONCAT(first_name, ' ', last_name) AS full_name,
        department,
        salary AS monthly_salary,
        (salary * 12) AS annual_salary
    FROM
        employees;

SELECT 
    *
FROM
    annual_salary_view;

CREATE VIEW vw_recent_employees AS
    SELECT 
        CONCAT(first_name, ' ', last_name) AS EmployeeName,
        department,
        hire_date
    FROM
        employees
    WHERE
        hire_date > '2023-01-01';

SELECT 
    *
FROM
    vw_recent_employees;

CREATE VIEW vw_above_avg_salary AS
    SELECT 
        CONCAT(first_name, ' ', last_name) AS EmployeeName,
        department,
        salary
    FROM
        employees
    WHERE
        salary > (SELECT 
                AVG(salary)
            FROM
                employees);

SELECT 
    *
FROM
    vw_above_avg_salary;

CREATE INDEX idx_email
ON employees(email);

SHOW INDEXES FROM employees;

DROP INDEX idx_email
ON employees;

CREATE INDEX idx_dept_city
ON employees(department, city);

-- Display all indexes
SHOW INDEXES FROM employees;

CREATE VIEW vw_city_salary AS
    SELECT 
        CONCAT(first_name, ' ', last_name) AS EmployeeName,
        department,
        salary,
        hire_date
    FROM
        employees
    WHERE
        city LIKE 'D%' AND salary > 50000
    ORDER BY hire_date DESC;

SELECT 
    *
FROM
    vw_city_salary;
    

create database companyDB;
use companyDB;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(30),
    salary DECIMAL(10 , 2 )
);

insert into employees values 
(101, 'Rahul', 'IT', 55000),
(102, 'Aman', 'HR', 42000),
(103, 'Priya', 'Finance', 70000),
(104, 'Sneha', 'IT', 60000),
(105, 'Rohit', 'Sales', 45000),
(106, 'Kiran', 'HR', 52000);


DELIMITER //
Create Procedure showAllEmployees()
begin
	select * from employees;
end //
delimiter ;

Call showAllEmployees();

delimiter //
create procedure showHREmployees()
begin
	select * from employees 
    where department = 'HR';
end //
delimiter ; 

call showHREmployees();

delimiter //
create procedure showEmployeesDept
(
	in dept varchar(30)
)
begin
	select * from employees 
    where department = dept;
end //
delimiter ; 

call showEmployeesDept('Finance');


delimiter //
create procedure employeefilter
(
	in dept varchar(30),
    in minSalary decimal(10, 2)
)
begin
	select * from employees 
    where department = dept 
    and salary >= minSalary;
end //
delimiter ; 

call employeefilter('IT', 25000);

delimiter //
create procedure employeeSalaryfilter
(
	in minSalary decimal(10, 2)
)
begin
	select * from employees 
    where salary >= minSalary;
end //
delimiter ; 

call employeeSalaryfilter(10000);

call employeeSalaryfilter(60000);

call showEmployeesDept('Finance');

show procedure status;

show create procedure showEmployeesfromDepartment;

drop procedure showEmployeesfromDepartment;

CREATE TABLE employee_logs (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_id INT,
    action_type VARCHAR(30),
    old_salary DECIMAL(10,2),
    new_salary DECIMAL(10,2),
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

delimiter $$

create trigger trg_before_insert_salary
before insert on employees
for each row
begin 
	if new.salary < 10000 then
		signal sqlstate '45000'
        set message_text='Salary cannot be below 10000';
    end if
end$$

delimiter ;

/*
WINDOW FUNCTIONS
----------------
A Window Function performs calculations across a set of rows without collapsing them like GROUP BY.

Syntax:
FUNCTION_NAME(...) OVER(
    [PARTITION BY column]
    [ORDER BY column]
)

Dataset: E-Commerce Analytics
*/

DROP DATABASE IF EXISTS ecommerce_window_demo;
CREATE DATABASE ecommerce_window_demo;
USE ecommerce_window_demo;

-- ==========================
-- TABLES
-- ==========================

CREATE TABLE categories(
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

CREATE TABLE products(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY(category_id) REFERENCES categories(category_id)
);

CREATE TABLE salespersons(
    salesperson_id INT PRIMARY KEY,
    salesperson_name VARCHAR(100),
    region VARCHAR(30)
);

CREATE TABLE orders(
    order_id INT PRIMARY KEY,
    order_date DATE,
    salesperson_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY(salesperson_id) REFERENCES salespersons(salesperson_id),
    FOREIGN KEY(product_id) REFERENCES products(product_id)
);

-- ==========================
-- SAMPLE DATA
-- ==========================

INSERT INTO categories VALUES
(1,'Mobile'),
(2,'Laptop'),
(3,'Electronics'),
(4,'Accessories');

INSERT INTO products VALUES
(101,'iPhone 16',1,85000),
(102,'Galaxy S25',1,78000),
(103,'OnePlus 14',1,52000),
(201,'Dell Inspiron',2,72000),
(202,'HP Pavilion',2,68000),
(301,'Sony Smart TV',3,62000),
(302,'LG OLED TV',3,95000),
(401,'Wireless Earbuds',4,4500),
(402,'Mechanical Keyboard',4,6500),
(403,'Gaming Mouse',4,3200);

INSERT INTO salespersons VALUES
(1,'Rahul','North'),
(2,'Priya','South'),
(3,'Amit','East'),
(4,'Sneha','West');

INSERT INTO orders VALUES
(1001,'2026-01-02',1,101,2),
(1002,'2026-01-02',2,201,1),
(1003,'2026-01-03',3,301,1),
(1004,'2026-01-03',4,102,3),
(1005,'2026-01-05',1,401,10),
(1006,'2026-01-05',2,202,2),
(1007,'2026-01-06',3,302,1),
(1008,'2026-01-06',4,103,4),
(1009,'2026-01-08',1,402,5),
(1010,'2026-01-08',2,403,8),
(1011,'2026-01-09',3,101,1),
(1012,'2026-01-10',4,201,2),
(1013,'2026-01-10',1,301,2),
(1014,'2026-01-11',2,401,12),
(1015,'2026-01-12',3,102,2),
(1016,'2026-01-13',4,302,1);


SELECT
    Row_number() OVER (
        ORDER BY SUM(o.quantity * p.unit_price) DESC
    ) AS row_no,
    s.salesperson_id,
    s.salesperson_name,
    SUM(o.quantity * p.unit_price) AS total_sales
FROM salespersons s
JOIN orders o
ON s.salesperson_id = o.salesperson_id
JOIN products p
ON o.product_id = p.product_id
GROUP BY s.salesperson_id, s.salesperson_name
ORDER BY row_no;


SELECT
    Rank() OVER (
        ORDER BY SUM(o.quantity * p.unit_price) DESC
    ) AS rank_no,
    s.salesperson_id,
    s.salesperson_name,
    SUM(o.quantity * p.unit_price) AS total_sales
FROM salespersons s
JOIN orders o
ON s.salesperson_id = o.salesperson_id
JOIN products p
ON o.product_id = p.product_id
GROUP BY s.salesperson_id, s.salesperson_name
ORDER BY rank_no;


SELECT
    dense_rank() OVER (
        ORDER BY SUM(o.quantity * p.unit_price) DESC
    ) AS strict_rank_no,
    s.salesperson_id,
    s.salesperson_name,
    SUM(o.quantity * p.unit_price) AS total_sales
FROM salespersons s
JOIN orders o
ON s.salesperson_id = o.salesperson_id
JOIN products p
ON o.product_id = p.product_id
GROUP BY s.salesperson_id, s.salesperson_name
ORDER BY strict_rank_no;

SELECT
c.category_name, p.product_name, SUM(o.quantity * p.unit_price) AS sales_amount,
row_number() over(partition by category_name order by SUM(o.quantity * p.unit_price) desc) as sales_rank
FROM categories c
JOIN products p
ON c.category_id = p.category_id
JOIN orders o
ON p.product_id = o.product_id
GROUP BY c.category_name
ORDER BY sales_rank; 


create database lpu;
use lpu;
create table students_lpu (
	student_name varchar(100) not null,
    reg_no int auto_increment,
    batch varchar(50) not null,
    cgpa decimal(3,2),
    age int not null,
    city varchar(200) not null,
    primary key (reg_no)
);

insert into students_lpu values (
	'kevin',
    1,
    'CSE',
    7.8,
    19,
    'Jalandar'
);

insert into students_lpu values (
	'kalyani',
    2,
    'CSE',
    6.8,
    20,
    'Jalandar'
);

insert into students_lpu values (
	'Sundar',
    3,
    'MEC',
    8.12,
    21,
    'Jalandar'
);

select * from students_lpu; -- never use * in industry

desc students_lpu; 

select student_name as Name from students_lpu;
select student_name as Name, Cgpa + 1 as Bonus_cgpa from students_lpu;

insert into students_lpu values (
	'Krish',
    4,
    'ECE',
    7.26,
    18,
    'Delhi'
);

insert into students_lpu values (
	'Ganni',
    5,
    'IT',
    8.92,
   22,
    'Hyderabad'
);

select * from students_lpu where batch = 'IT';
select * from students_lpu where batch = 'ECE';
select * from students_lpu where city = 'Delhi';

select * from students_lpu where batch = 'IT' and cgpa > 8;
select * from students_lpu where batch = 'ECE' and cgpa > 7.5;
select * from students_lpu where batch = 'CSE' and age > 20;

select * from students_lpu where city = 'Delhi' or  city = 'Mumbai';
select * from students_lpu where batch = 'CSE' or batch = 'IT';
select * from students_lpu where cgpa > 8 or batch = 'ECE';

select * from students_lpu where not city = 'Delhi';
select * from students_lpu where not batch = 'IT';
select * from students_lpu where not cgpa > 8;

select * from students_lpu where cgpa between 7.5 and 9;
select * from students_lpu where age between 18 and 20;
select * from students_lpu where reg_no between 2 and 4;

select * from students_lpu where city in ('Delhi', 'Jalandar');
select * from students_lpu where batch in ('CSE', 'ECE');

select * from students_lpu where student_name like 'R%';
select * from students_lpu where student_name like '%n';
select * from students_lpu where student_name like '%ra%';
select * from students_lpu where city like 'D%';
select * from students_lpu where batch like '%E';
select * from students_lpu where student_name like '____';

select * from students_lpu order by student_name asc;
select * from students_lpu order by city asc;
select * from students_lpu order by cgpa desc;
select * from students_lpu order by batch asc, student_name asc;
select * from students_lpu order by age asc;

select * from students_lpu where batch = 'CSE';
select * from students_lpu where age between 19 and 21;
select * from students_lpu where batch in ('CSE', 'IT');
select * from students_lpu where batch = 'CSE' or batch = 'IT';
select * from students_lpu where student_name like 'S%';
select distinct batch from students_lpu;
select student_name, cgpa from students_lpu;
select * from students_lpu order by cgpa desc;

ALTER TABLE students ADD attendance INT, ADD fees DECIMAL(10,2);
UPDATE students SET attendance = 85, fees = 45000;

select count(student_name) from students_lpu;
select max(attendance) from students_lpu;
select min(age) from students_lpu;
select count(students) from students_lpu where city = 'Delhi';
select sum(age)/count(age) as Average from students_lpu where batch = "IT";
select min(cgpa) from students_lpu where student_name like 'S%';
select avg(fees);

select batch, avg(cgpa) from students_lpu group by batch;
select city, count(student_name) from students_lpu group by city;
select batch, max(cgpa) from students_lpu group by batch;

select batch, avg(cgpa) from students_lpu group by batch having avg(cgpa)>0;
select city, count(*) from students_lpu group by city having count(*)>5;
select batch, count(student_name) from students_lpu group by batch;

select batch, avg(cgpa) from students_lpu group by batch ;
select city, max(attendance) from students_lpu group by city;
select batch, min(cgpa) from students_lpu group by batch; 
select city, sum(fees) from students_lpu group by city;

select batch, max(sum(fees)) from students_lpu group by batch;
select city, max(avg(attendance)) from students_lpu group by city;
select batch, max(cgpa) from students_lpu group by batch having max(cgpa)>9; 
select city, min(attendance) from students_lpu group by city having min(attendance)<75;


select batch, avg(attendance) from students_lpu group by batch;
select batch, avg(cgpa) from students_lpu group by batch having avg(cgpa)>8.5; 
select semester,  max(cgpa) from students_lpu group by semester;

drop table students_lpu;
drop table Students;

CREATE TABLE students
(
    Student_ID INT PRIMARY KEY,
	Student_Name VARCHAR(100) NOT NULL,
    Age INT CHECK (Age >= 18),
    Gender VARCHAR(10),
    Branch VARCHAR(40) NOT NULL,
    Semester INT CHECK (Semester BETWEEN 1 AND 8),
    CGPA DECIMAL(3,2) CHECK (CGPA BETWEEN 0 AND 10),
    City VARCHAR(50) DEFAULT 'Delhi',
    Email VARCHAR(100) UNIQUE,
    Phone_No VARCHAR(15) UNIQUE,
    Admission_Date DATE,
    Fees DECIMAL(10,2) CHECK (Fees > 0),
    Attendance DECIMAL(5,2),
    CHECK (Attendance BETWEEN 0 AND 100)
);

desc students;

INSERT INTO students
(Student_ID, Student_Name, Age, Gender, Branch, Semester, CGPA, City, Email, Phone_No, Admission_Date, Fees, Attendance)
VALUES
(101, 'Aarav Sharma', 20, 'Male', 'Computer Science', 3, 8.75, 'Delhi', 'aarav.sharma@example.com', '9876543210', '2024-08-01', 85000.00, 91.50),
(102, 'Priya Verma', 19, 'Female', 'Information Technology', 2, 9.10, 'Mumbai', 'priya.verma@example.com', '9876543211', '2025-01-10', 82000.00, 95.25),
(103, 'Rohan Mehta', 21, 'Male', 'Electronics', 5, 7.85, 'Chandigarh', 'rohan.mehta@example.com', '9876543212', '2023-08-05', 90000.00, 88.75),
(104, 'Sneha Kapoor', 22, 'Female', 'Mechanical', 7, 8.30, 'Bangalore', 'sneha.kapoor@example.com', '9876543213', '2022-08-12', 87000.00, 93.00),
(105, 'Kabir Singh', 18, 'Male', 'Civil', 1, 8.00, 'Jaipur', 'kabir.singh@example.com', '9876543214', '2025-08-15', 80000.00, 89.50);

INSERT INTO students
(Student_ID, Student_Name, Age, Gender, Branch, Semester, CGPA, City, Email, Phone_No, Admission_Date, Fees, Attendance)
VALUES
(106, 'Ananya Gupta', 20, 'Female', 'Electrical', 4, 9.25, 'Lucknow', 'ananya.gupta@example.com', '9876543215', '2024-08-10', 86000.00, 96.40);

INSERT INTO students
(Student_ID, Student_Name, Age, Gender, Branch, Semester, CGPA, City, Email, Phone_No, Admission_Date, Fees, Attendance)
VALUES
(107, 'Vikram Patel', 21, 'Male', 'Artificial Intelligence', 6, 8.65, 'Ahmedabad', 'vikram.patel@example.com', '9876543216', '2023-08-14', 92000.00, 90.80);


-- Q1: Insert TWO valid student records

INSERT INTO students (Student_ID, Student_Name, Email, Age, CGPA)
VALUES
(101, 'Rahul', 'rahul@gmail.com', 21, 8.5),
(102, 'Priya', 'priya@gmail.com', 22, 9.1);

-- Q2: Try inserting a duplicate Student_ID

INSERT INTO students
(Student_ID, Student_Name, Age, Gender, Branch, Semester, CGPA, City, Email, Phone_No, Admission_Date, Fees, Attendance)
VALUES
(101, 'Rahul Kumar', 20, 'Male', 'Computer Science', 3, 8.20, 'Delhi', 'rahul.kumar@example.com', '9876543220', '2025-08-01', 85000.00, 90.00);

-- Q3: Try inserting a duplicate Email

INSERT INTO students
(Student_ID, Student_Name, Age, Gender, Branch, Semester, CGPA, City, Email, Phone_No, Admission_Date, Fees, Attendance)
VALUES
(108, 'Rahul Kumar', 20, 'Male', 'Computer Science', 3, 8.20, 'Delhi', 'aarav.sharma@example.com', '9876543221', '2025-08-01', 85000.00, 90.00);

-- Q4: Try inserting Age = 20

INSERT INTO students
(Student_ID, Student_Name, Age, Gender, Branch, Semester, CGPA, City, Email, Phone_No, Admission_Date, Fees, Attendance)
VALUES
(109, 'Neha Sharma', 15, 'Female', 'Information Technology', 2, 8.50, 'Delhi', 'neha.sharma@example.com', '9876543222', '2025-08-01', 82000.00, 92.00);


-- Q5: Try inserting CGPA = 11

INSERT INTO students
(Student_ID, Student_Name, Age, Gender, Branch, Semester, CGPA, City, Email, Phone_No, Admission_Date, Fees, Attendance)
VALUES
(111, 'Pooja Verma', 21, 'Female', 'Civil', 5, 8.75, 'Delhi', 'pooja.verma@example.com', '9876543224', '2025-08-01', -1000.00, 91.00);

-- Q6

INSERT INTO students
(Student_ID, Student_Name, Age, Gender, Branch, Semester, CGPA, Email, Phone_No, Admission_Date, Fees, Attendance)
VALUES
(112, 'Karan Malhotra', 19, 'Male', 'Electronics', 2, 8.40, 'karan.malhotra@example.com', '9876543225', '2025-08-01', 83000.00, 89.50);

select * from students where cgpa > 9;
SELECT * FROM students ORDER BY Fees DESC LIMIT 10;
select City, count(Student_id) from students group by City;
select Branch, avg(CGPA) from students group by Branch having avg(CGPA);
select Student_ID,Student_Name, Admission_Date from students where Admission_Date like "2025%";

create table attendance (
	student_id int,
    subject_code varchar(10),
    attendance_date date,
    primary key(student_id, subject_code)
);

insert into attendance values (101, "SQL101", '2026-07-10'), (102, 'PY101', '2026-07-01');

create table enrollments (
	enrollment_id int primary key,
    student_id int,
    course_name varchar(50),
    foreign key(student_id) references students(Student_ID)
);

insert into enrollments values (1, 101, 'Python'), (2,102, 'SQL');

create table departments(
	dep_id int primary key,
    dep_name varchar(50),
    hod_name varchar(50)
);

create table faculty(
	fac_id int primary key,
    fac_name varchar(100),
    dep_id int,
    foreign key(dep_id) references departments(dep_id)
);

create table courses(
	course_id int primary key,
    course_name varchar(100),
    fac_id int,
    duration_months int,
    foreign key(fac_id) references faculty(fac_id)
);

alter table students add column dep_id int;
update students set dep_id = 10 where student_id in (1,2,3); 
update students set dep_id = 20 where student_id in (4,5,6);


show create table students;
show create table departments;



create table customers(
	customer_id int primary key auto_increment,
    customer_name varchar(100),
    city varchar(50)
);




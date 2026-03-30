create database collegemanagement_system;
use collegemanagement_system;
create table department(depart_id int primary key,depart_name varchar(120),hod_name varchar(130));
create table student(student_id int primary key,student_name varchar(130),student_department varchar(110));
create table courses(course_id int primary key,course_name varchar(150),course_subjects varchar(110));
create table enrollment(enroll_id int primary key,course_id int,student_id int,enroll_date date),
foreign key(depart_id)references department(depart_id),
foreign key(student_id)references student(student_id),
foreign key(course_id)references courses(course_id),
foreign key(enroll_id)references enrollment(enroll_id));
insert into department(depart_id,depart_name,hod_name) values
(1,'Computer Science','Dr. Arun'),
(2,'Electronics','Dr. Meena'),
(3,'Mechanical','Dr. Ravi'),
(4,'Civil','Dr. Anil'),
(5,'Mathematics','Priya');
insert into department(depart_id,depart_name,hod_name) values
(6,'Physics','Dr. Suresh'),
(7,'Chemistry','Dr. Lakshmi'),
(8,'Information Technology','Dr. Ramesh'),
(9,'Biotechnology','Dr. Kavitha'),
(10,'Electrical','Dr. Joseph');
insert into student(student_id,student_name,student_department)values
(101,'Rahul','Computer Science'),
(102,'Ananya','Electronics'),
(103,'Vikram','Mechanical'),
(104,'Sneha','Civil'),
(105,'Arjun','Computer Science'),
(106,'Meera','Mathematics'),
(107,'Kiran','Electronics'),
(108,'Nisha','Mechanical'),
(109,'Amit','Civil'),
(110,'Divya','Computer Science');
insert into courses(course_id,course_name,course_subjects) values
(201,'Database Systems','SQL'),
(202,'Data Structures','Programming'),
(203,'Digital Electronics','Circuits'),
(204,'Thermodynamics','Heat Transfer'),
(205,'Structural Engineering','Construction'),
(206,'Linear Algebra','Mathematics'),
(207,'Operating Systems','System Programming'),
(208,'Computer Networks','Networking'),
(209,'Artificial Intelligence','Machine Learning'),
(210,'Software Engineering','Software Development');
insert into enrollment(enroll_id,course_id,student_id,enroll_date) values
(1,201,101,'2024-01-10'),
(2,202,102,'2024-01-12'),
(3,203,103,'2024-01-15'),
(4,204,104,'2024-01-18'),
(5,205,105,'2024-01-20'),
(6,206,106,'2024-01-22'),
(7,207,107,'2024-01-25'),
(8,208,108,'2024-01-27'),
(9,209,109,'2024-01-30'),
(10,210,110,'2024-02-02');
select*from student;
select student_name,student_department from student;
select course_name from courses;
select student_department from student;
select student_name,student_department from student;
select s.student_id, s.student_name, c.course_name from student s join enrollment e on s.student_id = e.student_id join courses c on e.course_id = c.course_id;
select student_department, count(student_id) as total_students from student group by student_department;
select s.student_id, s.student_name, e.enroll_date from student s join enrollment e on s.student_id = e.student_id where e.enroll_date > '2024-01-20';
select s.student_id, s.student_name, count(e.course_id) as total_courses from student s right join enrollment e on s.student_id = e.student_id group by s.student_id, s.student_name;
update student set student_department = 'information technology' where student_id = 101;
delete from courses where course_id = 210;
select s.student_id, s.student_name from student s join enrollment e on s.student_id = e.student_id group by s.student_id, s.student_name having count(e.course_id) ;
select c.course_name, count(e.student_id) as total_student  from  courses c join enrollment e on c.course_id=e.course_id  group by course_name;
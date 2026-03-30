create database Employeetable;
use Employeetable;
create table employe(emp_id int primary key,emp_name varchar(255),emp_department varchar(100),emp_position varchar(100),hire_date date,base_salary decimal (10,2));
create table attendance(att_id int primary key,emp_id int,att_date date,att_status enum('present','absent','leave'));
create table salary(salary_id int primary key,emp_id int,base_salary decimal(10,2),salary_bonus decimal(10,2),salary_deductions decimal(10,2),salary_month varchar(20),salary_year int);
create table payroll(payroll_id int primary key,emp_id int,total_salary decimal(10,2),payment_date date,
foreign key(emp_id)references employe(emp_id));
insert into employe(emp_id,emp_name, emp_department,emp_position,hire_date,base_salary) values
(1,'Arun Kumar','IT','Developer','2022-01-15',50000.00),
(2,'Meera Nair','HR','Manager','2021-03-10',60000.00),
(3,'Rahul Das','Finance','Accountant','2020-07-20',55000.00),
(4,'Sneha Pillai','IT','Tester','2023-02-12',40000.00),
(5,'Vijay Menon','Sales','Executive','2019-11-05',45000.00),
(6,'Anjali Roy','Marketing','Coordinator','2022-06-18',42000.00),
(7,'Kiran Babu','IT','Support','2021-09-25',38000.00),
(8,'Divya S','HR','Assistant','2023-05-01',35000.00);
insert into attendance(att_id,emp_id,att_date,att_status)values
(1,1,'2026-03-01','present'),
(2,2,'2026-03-01','present'),
(3,3,'2026-03-01','absent'),
(4,4,'2026-03-01','leave'),
(5,5,'2026-03-01','present'),
(6,6,'2026-03-01','present'),
(7,7,'2026-03-01','absent'),
(8,8,'2026-03-01','present');
insert into salary(salary_id,emp_id,base_salary,salary_bonus,salary_deductions,salary_month,salary_year)values
(1,1,50000,5000,2000,'March',2026),
(2,2,60000,6000,2500,'March',2026),
(3,3,55000,4000,3000,'March',2026),
(4,4,40000,3000,1500,'March',2026),
(5,5,45000,3500,2000,'March',2026),
(6,6,42000,2500,1000,'March',2026),
(7,7,38000,2000,1200,'March',2026),
(8,8,35000,1500,800,'March',2026);
insert into payroll(payroll_id,emp_id,total_salary,payment_date)values
(1,1,53000,'2026-03-31'),
(2,2,63500,'2026-03-31'),
(3,3,56000,'2026-03-31'),
(4,4,41500,'2026-03-31'),
(5,5,46500,'2026-03-31'),
(6,6,43500,'2026-03-31'),
(7,7,38800,'2026-03-31'),
(8,8,35700,'2026-03-31');
insert into employe (emp_id, emp_name, emp_department, emp_position, hire_date, base_salary)values 
(9, 'Akhil Raj', 'IT', 'Developer', '2024-01-10', 52000.00);
update employe set emp_name = "lakshmi" where emp_id=2;
select*from attendance;
select emp_id,base_salary,salary_bonus,salary_deductions,(base_salary + salary_bonus - salary_deductions) as total_salary from salary;
SET SQL_SAFE_UPDATES = 0;
update salary set salary_bonus = 7000 where emp_id = 3;
update salary set salary_deductions=5500 where emp_id=2;
select emp_id,total_salary,payment_date,(emp_id+total_salary+payment_date) as total_salary from payroll;
select emp_id,emp_name,emp_department,base_salary from employe
where emp_id=1;
select emp_id,emp_name,emp_department,base_salary from employe
where emp_id=2;
select emp_id,emp_name,emp_department,base_salary from employe
where emp_id=3;
select emp_id,emp_name,emp_department,base_salary from employe
where emp_id=4;
select emp_id,emp_name,emp_department,base_salary from employe
where emp_id=5;
select employe.emp_id,employe.emp_name,employe.emp_department,employe.emp_position,employe.hire_date,employe.base_salary,attendance.att_id,attendance.emp_id,attendance.att_date,attendance.att_status,salary.salary_id,salary.emp_id,salary.base_salary,salary.salary_bonus,salary.salary_deductions,salary.salary_month,salary.salary_year,payroll.payroll_id,payroll.emp_id,payroll.total_salary,payroll.payment_date
from employe inner join attendance on employe.emp_id=attendance.emp_id inner join salary on employe.emp_id=salary.emp_id
inner join payroll on employe.emp_id=payroll.emp_id;


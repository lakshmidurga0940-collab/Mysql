create database onlineshoping;
use onlineshoping;
create table products(product_id int auto_increment primary key ,product_name varchar(100),product_price int,product_stock varchar(150),product_category varchar(100));
create table customers(customer_id int auto_increment primary key,customer_name varchar(150),customer_email varchar(100),phone_number varchar(15));
create table orders(order_id int auto_increment primary key,customer_id int,total_amount int,order_date date default (current_date));
create table orderdetails(orderdetail_id int auto_increment primary key,order_id int,product_id int,customer_id int,quantity int,
foreign key(product_id)references products(product_id),
foreign key(customer_id)references customers(customer_id),
foreign key(order_id)references orders(order_id));
insert into products(product_name, product_price, product_stock, product_category) values
('laptop', 50000, 10, 'electronics'),
('dress', 20000, 20, 'fashion'),
('shoes', 1500, 50, 'fashion'),
('Tablet', 50000, 10, 'electronics'),
('watch', 1500, 20, 'fashion');
insert into customers (customer_name, customer_email,phone_number) values
('meenu', 'meenu@gmail.com', '9876543210'),
('vaiga', 'vaiga@gmail.com', '9123456780'),
('yashii', 'yashii@gmail.com', '8723456780');
insert into orders (customer_id, order_date, total_amount) values
(1, '2026-01-25', 52000),
(2, '2026-03-26', 15000),
(3, '2026-05-26', 20000),
(4, '2026-10-26', 12000);
insert into orderdetails (orderdetail_id, product_id, quantity) values(1, 1, 1);

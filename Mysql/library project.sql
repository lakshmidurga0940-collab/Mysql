create database libraryp1;
use libraryp1;
create table books(book_id int auto_increment primary key,title varchar(255)not null,author varchar(100)not null,genre varchar(150),published_year year,is_available boolean default true);
create table members(member_id int auto_increment primary key,name varchar(160)not null,email varchar(190),phone_number varchar(15),join_date date default (current_date));
create table librarians(librarian_id int auto_increment primary key,name varchar(100)not null,email varchar(200),phone_number varchar(10),hire_date date default(current_date));
create table borrowing(loan_id int auto_increment primary key,book_id int,member_id int,borrow_date date default (current_date),return_date date,librarian_id int,
foreign key(book_id)references books(book_id),
foreign key(member_id)references members(member_id),
foreign key(librarian_id)references librarians(librarian_id));
insert into books(title,author,genre,published_year)values
('The Great Gatsby','F.Scott Fitzgerald','Fiction',1925),
('1984','George Orwell','Dystopian',1949),
('To kill a Mockingbird','Harper Lee','Classic',1960);
insert into members(name,email,phone_number)values
('Alen King','alenking@example.com','123478967'),
('Alece Hofman','alecehofman@example.com','7559098957');
insert into librarians(name,email,phone_number)values
('Nail Horn','nail@example.com', '4567886064'),
('Garden McGraw', 'garden@example.com', '7598561230');
insert into borrowing (book_id, member_id, librarian_id)values(1, 1, 1);
update books set is_available = false where book_id = 1;
update borrowing set return_date=current_date where loan_id=1;
update books set is_available = true where book_id = 1;
select*from books where is_available=true;
select m.name,b.title,br.borrow_date,br.return_date from borrowing br join members m on br.member_id=m.member_id join books b on br.book_id=b.book_id where m.member_id=1;
select m.name,b.title,br.borrow_date,br.return_date from borrowing br join members m on br.member_id=m.member_id join books b on br.book_id=b.book_id where br.return_date is null and br.borrow_date<current_date-interval 14 day;
select title,genre,published_year from books where author='George Orwell';
select title,author,published_year from books where published_year>200;
select count(*) as total_books from books;
select m.name,br.borrow_date,br.return_date from borrowing br join members m on br.member_id=m.member_id join books b on br.book_id=b.book_id where b.title='1984';
select b.title,br.borrow_date,br.return_date from borrowing br join books b on br.book_id=b.book_id where br.member_id=1;
select title,author,published_year from books where genre='Fiction' and is_available=True;
select m.name,count(br.loan_id)as total_books_borrowed from borrowing br join members m on br.member_id=m.member_id group by m.name;
select m.name,b.title,br.borrow_date from borrowing br join members m on br.member_id=m.member_id join books b on br.book_id=b.book_id where br.return_date is null and br.borrow_date<current_date-interval 30 day;
select l.name,count(br.loan_id) as total_borrowings from borrowing br join librarians l on br.librarian_id=l.librarian_id group by l.name order by total_borrowings desc;
select m.name,b.title,br.borrow_date from borrowing br join members m on br.member_id=m.member_id join books b on br.book_id=b.book_id where br.return_date is null;
create database CRM;
use CRM;

create table customer(Customer_id int primary key, C_name varchar(50), Email varchar(50), Phone varchar(13), Address varchar (100));

create table product(Product_id int primary key, P_name varchar(50), Brand varchar(30), Price decimal);

create table orders(Order_id int primary key, Customer_id int, Order_date date, Total_amount decimal,
foreign key(Customer_id) references customer(customer_id));

create table order_detail(order_detail_id int, Order_id int primary key, Product_id int, Quantity int, Unit_price decimal,
foreign key(product_id) references product(Product_id),
foreign key(Order_id) references orders(order_id));

create table employee(Employee_id int primary key, E_name varchar(50), Email varchar(50), phone varchar(13), Position varchar(50));

create table employee_salary(Employee_id int, E_name varchar(50), Worked_days int, Salary_per_day int,
foreign key(employee_id) references employee(Employee_id));

insert into customer value (1, 'Mugilan', 'mugilan@gmail.com', '9626769554', 'Perambalur');
insert into customer value (2, 'Anbu', 'anbu@gmail.com', '8778208604', 'Perambalur');
insert into customer value (3, 'Bala', 'bala@gmail.com', '7373630259', 'Trichy');
insert into customer value (4, 'Chandru', 'chandru@gmail.com', '8508570685', 'Chennai');
insert into customer value (5, 'Ajith', 'ajith@gmail.com', '9654541547', 'Ariyalur');
insert into customer value (6, 'Karthi', 'karthi@gmail.com', '8745454511', 'Ariyalur');
insert into customer value (7, 'Sakthi', 'sakthi@gmail.com', '9526486257', 'Perambalur');
insert into customer value (8, 'Arivu', 'arivu@gmail.com', '6325946587', 'Trichy');
insert into customer value (9, 'Mathi', 'mathi@gmail.com', '7632549862', 'Chennai');
insert into customer value (10, 'Kalai', 'kalai@gmail.com', '9527947975', 'Madurai');
insert into customer value (11, 'Selva', 'selva@gmail.com', '9563489572', 'Tirupur');
insert into customer value (12, 'Ragul', 'ragul@gmail.com', '9458762018', 'Salem');
insert into customer value (13, 'Vijay', 'vijay@gmail.com', '7365498204', 'Madurai');
insert into customer value (14, 'Rajini', 'rajini@gmail.com', '7896541230', 'Salem');
insert into customer value (15, 'Surya', 'surya@gmail.com', '7654982001', 'Tanjore');
insert into customer value (16, 'Karthi', 'karthi@gmail.com', '9648532185', 'Pudukottai');
insert into customer value (17, 'Prasath', 'prasath@gmail.com', '9648512011', 'Chennai');
insert into customer value (18, 'Richard', 'richard@gmail.com', '6956254487', 'Tanjore');
insert into customer value (19, 'Sugu', 'sugu@gmail.com', '9484848546', 'Chennai');
insert into customer value (20, 'Nandha', 'nandha@gmail.com', '6789859478', 'Trichy');
insert into customer value (21, 'Nirmal', 'nirmal@gmail.com', '8654987755', 'Ariyalur');
insert into customer value (22, 'Durga', 'durga@gmail.com', '9566644877', 'Villupuam');
insert into customer value (23, 'Jenifer', 'jenifer@gmail.com', '9566485022', 'Villupuram');
insert into customer value (24, 'Seetha', 'seetha@gmail.com', '9544886622', 'Tambaram');
insert into customer value (25, 'Vincy', 'vincy@gmail.com', '8544999245', 'Kanchipuram');
insert into customer value (26, 'Saranya', 'saranya@gmail.com', '9262589546', 'Tambaram');
insert into customer value (27, 'Catherine', 'catherine@gmail.com', '8489465795', 'Perambalur');
insert into customer value (28, 'Jerline', 'jerline@gmail.com', '7200059487', 'Perambalur');
insert into customer value (29, 'Jona', 'jona@gmail.com', '8564589587', 'Kanchipuram');
insert into customer value (30, 'Elofer', 'elofer@gmail.com', '9500444789', 'Tambaram');
insert into customer value (31, 'Varsha', 'varsha@gmail.com', '6348956201', 'Maudrai');
insert into customer value (32, 'Rani', 'rani@gmail.com', '6347895686', 'Coimbatore');
insert into customer value (33, 'Rekha', 'rekha@gmail.com', '9566565156', 'Salem');
insert into customer value (34, 'Preethi', 'preethi@gmail.com', '9500482695', 'Chennai');
insert into customer value (35, 'Angeline', 'angeline@gmail.com', '8915364895', 'Coimbatore');
insert into customer value (36, 'Kaviya', 'kaviya@gmail.com', '7862789456', 'Coimbatore');
insert into customer value (37, 'Arthi', 'arthi@gmail.com', '9846597812', 'Pudukottai');
insert into customer value (38, 'Reena', 'reena@gmail.com', '6348759201', 'Chennai');
insert into customer value (39, 'Meera', 'meera@gmail.com', '6348602147', 'Madurai');
insert into customer value (40, 'Deepa', 'deepa@gmail.com', '9465535874', 'Perambalur');

insert into product value (1, 'Samsung Galaxy S24 Ultra', 'Samsung', 97990);
insert into product value (2, 'vivo X100 Pro 5G', 'Vivo', 89999);
insert into product value (3, 'Xiaomi 14 Ultra', 'Xiaomi', 99999);
insert into product value (4, 'Motorola Razr 50 Ultra', 'Moto', 79999);
insert into product value (5, 'Samsung Galaxy S24 Plus 5G', 'Samsung', 99800);
insert into product value (6, 'OPPO Find X8 Pro', 'Oppo', 99900);
insert into product value (7, 'OPPO Find X8', 'Oppo', 69999);
insert into product value (8, 'Apple iPhone 16 Pro Max', 'Apple', 144900);
insert into product value (9, 'Apple iPhone 16', 'Apple', 77400);
insert into product value (10, 'Google Pixel 9 Pro Fold', 'Google', 172999);

insert into orders value (1, 1, '2024-10-02', 144900);
insert into orders value (2, 2, '2024-10-02', 97990);
insert into orders value (3, 3, '2024-10-03', 99999);
insert into orders value (4, 4, '2024-10-03', 79999);
insert into orders value (5, 5, '2024-10-04', 99800);
insert into orders value (6, 6, '2024-10-05', 97990);
insert into orders value (7, 7, '2024-10-06', 89999);
insert into orders value (8, 8, '2024-10-07', 69999);
insert into orders value (9, 9, '2024-10-08', 97990);
insert into orders value (10, 10, '2024-10-09', 144900);
insert into orders value (11, 11, '2024-10-10', 77400);
insert into orders value (12, 12, '2024-10-11', 99999);
insert into orders value (13, 13, '2024-10-12', 99800);
insert into orders value (14, 14, '2024-10-13', 144900);
insert into orders value (15, 15, '2024-10-14', 79999);
insert into orders value (16, 16, '2024-10-15', 99900);
insert into orders value (17, 17, '2024-10-16', 99800);
insert into orders value (18, 18, '2024-10-16', 89999);
insert into orders value (19, 19, '2024-10-16', 172999);
insert into orders value (20, 20, '2024-10-16', 79999);
insert into orders value (21, 21, '2024-10-16', 69999);
insert into orders value (22, 22, '2024-10-17', 97990);
insert into orders value (23, 23, '2024-10-19', 77400);
insert into orders value (24, 24, '2024-10-20', 99999);
insert into orders value (25, 25, '2024-10-21', 99900);
insert into orders value (26, 26, '2024-10-22', 97990);
insert into orders value (27, 27, '2024-10-23', 172999);
insert into orders value (28, 28, '2024-10-24', 99800);
insert into orders value (29, 29, '2024-10-25', 89999);
insert into orders value (30, 30, '2024-10-26', 172999);
insert into orders value (31, 31, '2024-10-27', 99800);
insert into orders value (32, 32, '2024-10-28', 99999);
insert into orders value (33, 33, '2024-10-29', 79999);
insert into orders value (34, 34, '2024-10-30', 144900);
insert into orders value (35, 35, '2024-11-01', 99900);
insert into orders value (36, 36, '2024-11-02', 144900);
insert into orders value (37, 37, '2024-11-03', 69999);
insert into orders value (38, 38, '2024-11-05', 77400);
insert into orders value (39, 39, '2024-11-06', 97990);
insert into orders value (40, 40, '2024-11-07', 79999);
insert into orders value (41, 01, '2024-11-08', 99999);
insert into orders value (42, 10, '2024-11-10', 99800);
insert into orders value (43, 15, '2024-11-13', 144900);
insert into orders value (44, 20, '2024-11-17', 172999);
insert into orders value (45, 40, '2024-11-20', 99900);
insert into orders value (46, 26, '2024-11-22', 97990);
insert into orders value (47, 21, '2024-11-25', 89999);
insert into orders value (48, 07, '2024-11-27', 144900);
insert into orders value (49, 36, '2024-11-29', 99999);
insert into orders value (50, 31, '2024-11-30', 97990);

insert into order_detail value(1, 1, 8, 1, 144900);
insert into order_detail value(2, 2, 1, 1, 97990);
insert into order_detail value(3, 3, 3, 1, 99999);
insert into order_detail value(4, 4, 4, 1, 79999);
insert into order_detail value(5, 5, 5, 1, 99800);
insert into order_detail value(6, 6, 1, 1, 97990);
insert into order_detail value(7, 7, 2, 1, 89999);
insert into order_detail value(8, 8, 7, 1, 69999);
insert into order_detail value(9, 9, 1, 1, 97990);
insert into order_detail value(10, 10, 8, 1, 144900);
insert into order_detail value(11, 11, 9, 1, 77400);
insert into order_detail value(12, 12, 3, 1, 99999);
insert into order_detail value(13, 13, 5, 1, 99800);
insert into order_detail value(14, 14, 8, 1, 144900);
insert into order_detail value(15, 15, 4, 1, 79999);
insert into order_detail value(16, 16, 6, 1, 99900);
insert into order_detail value(17, 17, 5, 1, 99800);
insert into order_detail value(18, 18, 2, 1, 89999);
insert into order_detail value(19, 19, 10, 1, 172999);
insert into order_detail value(20, 20, 4, 1, 79999);
insert into order_detail value(21, 21, 7, 1, 69999);
insert into order_detail value(22, 22, 1, 1, 97990);
insert into order_detail value(23, 23, 9, 1, 77400);
insert into order_detail value(24, 24, 3, 1, 99999);
insert into order_detail value(25, 25, 6, 1, 99900);
insert into order_detail value(26, 26, 1, 1, 97990);
insert into order_detail value(27, 27, 10, 1, 172999);
insert into order_detail value(28, 28, 5, 1, 99800);
insert into order_detail value(29, 29, 2, 1, 89999);
insert into order_detail value(30, 30, 10, 1, 172999);
insert into order_detail value(31, 31, 5, 1, 99800);
insert into order_detail value(32, 32, 3, 1, 99999);
insert into order_detail value(33, 33, 4, 1, 79999);
insert into order_detail value(34, 34, 8, 1, 144900);
insert into order_detail value(35, 35, 6, 1, 99900);
insert into order_detail value(36, 36, 8, 1, 144900);
insert into order_detail value(37, 37, 7, 1, 69999);
insert into order_detail value(38, 38, 9, 1, 77400);
insert into order_detail value(39, 39, 1, 1, 97990);
insert into order_detail value(40, 40, 4, 1, 79999);
insert into order_detail value(41, 41, 3, 1, 99999);
insert into order_detail value(42, 42, 5, 1, 99800);
insert into order_detail value(43, 43, 8, 1, 144900);
insert into order_detail value(44, 44, 10, 1, 172999);
insert into order_detail value(45, 45, 6, 1, 99900);
insert into order_detail value(46, 46, 1, 1, 97990);
insert into order_detail value(47, 47, 2, 1, 89999);
insert into order_detail value(48, 48, 8, 1, 144900);
insert into order_detail value(49, 49, 3, 1, 99999);
insert into order_detail value(50, 50, 1, 1, 97990);

insert into employee value (1, 'Messi', 'messi@gmail.com', '9010101010', 'Manager');
insert into employee value (2, 'Ronaldo', 'ronaldo@gmail.com', '9707070707', 'Assistant_Manager');
insert into employee value (3, 'Neymar', 'neymar@gmail.com', '9514548621', 'Accountant');
insert into employee value (4, 'Mbappe', 'Mbappe@gmail.com', '6354925142', 'Supervisor');
insert into employee value (5, 'Lewandowski', 'lewandowski@gmail.com', '9654235486', 'Cashier');
insert into employee value (6, 'Bellingham', 'Bellingham@gmail.com', '8625416826', 'Biller');
insert into employee value (7, 'Vinicius', 'Vinicius@gmail.com', '6325485620', 'Salesman');
insert into employee value (8, 'Yamal', 'Yamal@gmail.com', '864556842', 'Salesman');
insert into employee value (9, 'Gavi', 'Gavi@gmail.com', '9614536548', 'Salesman');

insert into employee_salary value(1, 'Messi', 30, 2100);
insert into employee_salary value(2, 'Ronaldo', 28, 1500);
insert into employee_salary value(3, 'Neymar', 29, 1200);
insert into employee_salary value(4, 'Mbappe', 26, 1000);
insert into employee_salary value(5, 'Lewandowski', 30, 900);
insert into employee_salary value(6, 'Bellingham', 28, 800);
insert into employee_salary value(7, 'Vinicius', 30, 700);
insert into employee_salary value(8, 'Yamal', 25, 700);
insert into employee_salary value(9, 'Gavi', 39, 700);

select * from customer;
select * from product;
select * from orders;
select * from order_detail;
select * from employee;
select * from employee_salary;


select order_id, customer_id, order_date from orders
where customer_id=1;

select * from customer 
where customer_id = 1;

select p_name, price 
from product;

select customer_id, c_name 
from customer 
where left(c_name,1) not in ('a','e','i','o','u')
and 
address = 'perambalur';
 
select count(c_name)
from customer 
where right(c_name,1) in ('a','e','i','o','u')
or 
address = 'perambalur';

select e_name, worked_days 
from employee_salary
where not worked_days = 26;

select E_name, position 
from employee 
order by position;

select c_name, phone 
from customer 
order by c_name desc;

update customer 
set phone = '9999999999' 
where customer_id = 6; 

select * from customer 
limit 10; 

select max(salary_per_day), e_name 
from employee_salary 
group by e_name 
limit 1;
use crm

SELECT p_name, price
FROM product
ORDER BY price ASC
LIMIT 1;

SELECT MIN(price) AS min_price, ANY_VALUE(p_name) AS p_name
FROM product
GROUP BY price
ORDER BY price ASC
LIMIT 1;

SELECT p_name, price
FROM product
ORDER BY price ASC
LIMIT 1;

select count(order_id) 
from orders;

select 
avg(salary_per_day) as average_salary_per_day 
from employee_salary;

select c_name 
from customer 
where c_name 
like 'a%';

select c_name 
from customer 
where left(c_name,1) 
in ('a','e','i','o','u');

select * from employee_salary 
where salary_per_day 
between 1000 and 2500;

select c.customer_id, c.c_name, od.order_id, p.p_name
from customer as c
join orders as o on c.customer_id = o.customer_id
join order_detail as od on o.order_id = od.order_id
join product as p on od.product_id = p.product_id order by c.customer_id;

select e.Employee_id, e.E_name, Position, s.Worked_days, s.Salary_per_day, (Worked_days * Salary_per_day) as Monthly_salary
from employee as e 
join
employee_salary as s
on e.Employee_id = s.Employee_id;

select c.customer_id, c.c_name, o.order_id, od.product_id, p.p_name, p.price 
from customer as c 
right join orders o on c.customer_id = o.customer_id 
right join order_detail as od on o.order_id = od.order_id 
right join product as p on od.product_id = p.product_id order by customer_id;

select p_name, brand, price,
case 
when price > 100000 then 'High Range'
when price = 69999 then 'Low Range'
else 'Medium Range'
end as price_range
from product;

select e_name,employee_id
from employee as e
where exists (select employee_id from employee_salary as es where e.employee_id =es.employee_id and salary_per_day>1000);

select e_name,employee_id 
from employee as e
where employee_id<>all (select employee_id from employee_salary as es where e.employee_id =es.employee_id and salary_per_day>1000);

select count(c_name) from customer 
where right (c_name,1) in ('a','e','i','o','u');

select c_name from customer
where left(c_name,1)not in('a','e','i','o','u');

select c_name from customer
where left (c_name,1) in ('a','e','i','o','u')
and
right (c_name,1) in ('a','e','i','o','u');

select c_name from customer
where left (c_name,1) in ('a','e','i','o','u')
or
right (c_name,1) in ('a','e','i','o','u');

select c_name from customer
where left (c_name,1) not in ('a','e','i','o','u')
and
right (c_name,1) not in ('a','e','i','o','u');
-- ----------------------------------------------------------------------------------------------------------

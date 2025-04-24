use master;
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    email VARCHAR(30) UNIQUE NOT NULL,
    country VARCHAR(20)
);
insert into Customers values(2,'Yash','yash@gmail.com','india'),
							(3,'Rahul','rahul22@gmail.com','india');
create table Orders (
	order_id int primary key,
	customer_id int,
	order_date date,
	total_amount DECIMAL(10, 2),
	foreign key(customer_id) references Customers(customer_id));

insert into Orders values(3,2,'12/5/2024',4000);
						

--1)SELECT 
select * from Customers;
--2)WHERE
select * from Customers where name='rahul';
--3)ORDER BY
select * from Orders order by total_amount desc;
--4)group by
select customer_id from Orders group by customer_id;

--INNER JOIN--
select c.name, o.order_date from Customers as c inner join Orders as o on c.customer_id=o.customer_id;
select * from Customers
select * from Orders
--LEFT JOIN--
SELECT c.name, o.order_date from Customers as c left join Orders as o on c.customer_id= o.customer_id;
--RIGHT JOIN--
SELECT c.name, o.order_date from Customers as c right join Orders as o on c.customer_id= o.customer_id;
--SUBQUERY--
SELECT customer_id, total_amount
FROM orders
WHERE total_amount > (
  SELECT AVG(total_amount) FROM orders
);
--SUM--
SELECT SUM(TOTAL_AMOUNT) AS SUMOF_AMOUNT FROM ORDERS;
--AVG--
SELECT AVG(TOTAL_AMOUNT) AS AVG_TOTAL FROM ORDERS;

--views--
create view Custview as select customer_id,name from Customers where name like 'p%';
select * from Custview;

-- Create an index on order_date1
CREATE INDEX idx_order_date1 ON orders(order_date);


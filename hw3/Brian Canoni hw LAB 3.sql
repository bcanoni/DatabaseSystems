--Brian Canoni Lab 3

--1.Name and city from agents where name is smith
SELECT name,city 
FROM agents
WHERE name='Smith';

--2.pid name and quantity from products were the price is > 1.25
SELECT pid,name,quantity
FROM products
WHERE priceusd > 1.25;

--3.all ordno and aid from orders
SELECT ordno, aid
FROM orders;

--4.name and city from customers where city is dallas
SELECT name,city 
FROM customers
WHERE city = 'Dallas';

--5.Name from agents where city isn't new york or newark
SELECT name
FROM agents
WHERE city!='New York' 
AND city!='Newark';

--6.All data from products where city is not new york or newark and price is >= 1.00
SELECT * 
FROM products
WHERE city!='New York' 
AND city!='Newark'
AND priceusd >= 1.00;

--7.All from orders where the month is jan or march
SELECT *
FROM orders
WHERE mon='jan'
OR mon='mar';

--8.All from orders where the month is feb and dollars<100
SELECT *
FROM orders
WHERE mon='feb'
AND dollars<100; 
--none of the data in the table matches this so it will return empty

--9.All from orders from customer c001
SELECT *
FROM orders
WHERE cid='c001';






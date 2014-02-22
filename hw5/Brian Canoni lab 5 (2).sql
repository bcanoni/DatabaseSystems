--Brian Canoni Lab 5


-- 1
select city 
from agents
join orders
on orders.aid = agents.aid
where orders.cid = (
			select cid 
			from customers
			where name = 'Basics'
		   );

-- 2 

select distinct o.pid
from orders o 
inner join products p
on o.pid = p.pid
where cid = ( 
		select cid
		from customers
		where city = 'Kyoto'
            );

--3

select name from customers
where cid not in (
		select cid from orders
		 );

--4
select customers.name from customers
left outer join orders
on customers.cid=orders.cid
where Orders.cid is null;

--5 

select Customers.name, Agents.name, Customers.city from Customers,Agents
where Customers.city = Agents.city;

--6

select Customers.name, Agents.name, Customers.city from Customers,Agents
where Customers.city = Agents.city;

-7
select distinct Customers.name,Customers.city from Customers
join Products
on Products.city = Customers.city
where Customers.city in (
			select city
			from products 
			group by city
			order by sum(quantity) asc
			limit 1
			);

--Brian Canoni Lab 5


-- 1
select city from Agents
join Orders
on Orders.aid = Agents.aid
where Orders.cid = 'c002';

-- 2 
select pid from Orders
join Agents
on Orders.aid = Agents.aid
where Orders.cid = 'c006';

--3
select name from Customers
where cid not in (
		select cid from Orders
		 );

--4
select Customers.name from Customers
left outer join Orders
on Customers.cid=Orders.cid
where Orders.cid is null;

--5 
select Customers.name, Agents.name from Customers,Agents
where Customers.city = Agents.city;

-6
select Customers.name, Agents.name, Customers.city from Customers,Agents
where Customers.city = Agents.city;

-7
select distinct Customers.name,Customers.city from Customers
join Products
on Products.city = Customers.city
where Products.city = 'Duluth';


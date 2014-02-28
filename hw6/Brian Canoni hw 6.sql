-- Brian Canoni
--hw 6

--1
select  distinct c.name,c.city 
from customers c
join products p
on c.city = p.city
where c.city in (
		select c.city 
		from products p
		join customers c
		on c.city = p.city
		group by c.city
		order by sum(quantity) desc
		limit 1
		);

--2 
select  distinct c.name,c.city 
from customers c
join products p
on c.city = p.city
where c.city in (
		select c.city 
		from products p
		join customers c
		on c.city = p.city
		group by c.city
		order by sum(quantity) desc
		limit 1
		);

--3 I had a lot of trouble with this question
-- my avg command seemed to be returning strange values 
--I hard coded in the average and put an example of something that
-- shouldn't work at all but returns the right answer
-- as the actual average is 1.03 and not greater than 2
select p.*
from products p
group by p.pid
having priceUSD > 1.03125

select p.*
from products p
group by p.pid
having priceUSD > (2-avg(priceUSD)) --doesn't make sense
order by priceUSD; 


--4
select c.name, o.pid,o.dollars
from orders o 
join customers c
on c.cid = o.cid
order by dollars desc

--5
select c.name, coalesce(o.qty,0)
from customers c  
left join orders o
on c.cid = o.cid

--6 
select distinct c.name,p.name,a.name
from customers c ,agents a,products p
where a.city = 'New York'


--7
--uhh

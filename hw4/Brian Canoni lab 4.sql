-- Brian Canoni
-- Lab 4 2/13/14
-- Questions 1-7

--1
SELECT city
FROM agents
WHERE aid IN (
	       SELECT aid 
	       FROM orders
	       WHERE cid IN ( 
	                      SELECT cid
			      FROM customers
			      WHERE name = 'Basics'));


--2 I think this is right it returns all the pids 
--of any agent who sold something in Kyoto
SELECT DISTINCT pid 
FROM orders
WHERE aid IN (
	      SELECT aid 
	      FROM orders
	      WHERE cid IN (
			     SELECT cid 
			     FROM customers
			     WHERE city = 'Kyoto'));

--3
SELECT DISTINCT cid,name
FROM Customers
WHERE cid NOT IN (
		  SELECT DISTINCT cid
		  FROM orders
		  WHERE aid = 'a03');

	     
--4
SELECT cid,name
FROM customers
WHERE cid IN (
		SELECT DISTINCT cid
		FROM orders
		WHERE pid = 'p01'
		OR pid = 'p07'); 

--5 
SELECT DISTINCT pid 
FROM orders
WHERE pid IN (
		SELECT DISTINCT pid
		FROM orders
		WHERE cid NOT IN (		
				  SELECT DISTINCT cid
				  FROM orders
				  WHERE aid = 'a03'));

--6	
SELECT name,discount
FROM customers
WHERE cid IN (
		SELECT cid 
		FROM orders
		WHERE aid IN (
				SELECT aid
				FROM agents
				WHERE city = 'Dallas'
				OR city = 'Duluth'));

--7
SELECT *
FROM customers 
WHERE city != 'Dallas' 
AND city != 'Kyoto'
AND discount IN (
		  SELECT discount 
		  FROM customers
		  WHERE city = 'Dallas'
		  OR city = 'Kyoto'); 
				


	       
-- show all customers who have spent more than 50 dollars on one purchase.
select FirstName, LastName from Customer
inner join Receipt on Receipt.CustomerID = Customer.CustomerID
where Total > 50

-- the above example, but with a subquery
select FirstName, LastName from Customer
where CustomerID in
	(select CustomerID from Receipt where Total > 50)

-- when you run the subquery above just by itself, you get (107, 103, 102) as a result. Let's hard code this in to make sure it's the same. 
select FirstName, LastName from Customer
where CustomerID in
	(107, 103, 102)

-- TADA! All three of these queries return the exact same results!
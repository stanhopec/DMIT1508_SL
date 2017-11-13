-- DMIT 1508 SL
-- Claire Stanhope
-- DISCLAIMER: I'm not a professional, I make mistakes. 
-- If you notice an error in my answers please let me know! I like to learn from mistakes :)

-- EXAMPLE 1 --------------------------------------------------------------------------------------------------------------------------------------------------------------- EX1
-- select AlbumID, AlbumName, ArtistName, and Genre ID 
select AlbumID, AlbumName, ArtistName, GenreID from Album
inner join Artist on Album.ArtistID = Artist.ArtistID

-- EXAMPLE 2 --------------------------------------------------------------------------------------------------------------------------------------------------------------- EX2
-- select Employee's full name, how many repeipts they are attached to 
select firstname + ' ' + lastname 'Employee Name', count(receiptID) from Employee
inner join Receipt on Receipt.EmployeeID = Employee.EmployeeID
group by firstname, lastname

-- Now, if I want to check that this data is correct, I'm going to modify my answer up top:
select firstname + ' ' + lastname 'Employee Name', receiptID from Employee
inner join Receipt on Receipt.EmployeeID = Employee.EmployeeID
order by employee.EmployeeID

-- now I can see how many receipts "Stan McMann" is attached to and double check that it's the same as my answer above!

-- EXAMPLE 3 --------------------------------------------------------------------------------------------------------------------------------------------------------------- EX3
-- take example 2 and modify it so that you show the total amount of money the employee has sold (hint: use subtotal)
select firstname + ' ' + lastname 'Employee Name', sum(subtotal) from Employee
inner join Receipt on Receipt.EmployeeID = Employee.EmployeeID
group by firstname, lastname
--selecting by just last name: see the Starks!
select lastname, sum(subtotal) from Employee
inner join Receipt on Receipt.EmployeeID = Employee.EmployeeID
group by lastname
-- check our work.
select * from Receipt where EmployeeID = 103

-- EXAMPLE 4 --------------------------------------------------------------------------------------------------------------------------------------------------------------- EX4
-- show all employees whose total amount of money sold is greater than 50$.
select firstname + ' ' + lastname 'Employee Name', sum(subtotal) from Employee
inner join Receipt on Receipt.EmployeeID = Employee.EmployeeID
group by firstname, lastname
having sum(subtotal) > 50

-- EXAMPLE 5 --------------------------------------------------------------------------------------------------------------------------------------------------------------- EX5
-- select AlbumID, AlbumName, ArtistName, and Genre Description
-- HINT: there are three tables here!
select AlbumID, AlbumName, ArtistName, Description from Album
inner join Artist on Album.ArtistID = Artist.ArtistID
inner join Genre on Genre.GenreID = Album.GenreID

-- EXAMPLE 6 --------------------------------------------------------------------------------------------------------------------------------------------------------------- EX6
-- show me all the customers who had purchases greater than 50$ and show me what kind of payment they used (PaymentType description)
select firstname + ' ' + lastname 'Full Name', Description from Customer
inner join Receipt on Receipt.CustomerID = Customer.CustomerID
inner join PaymentType on PaymentType.PaymentTypeID = Receipt.PaymentTypeID
where total >= 50

-- EXAMPLE 7 --------------------------------------------------------------------------------------------------------------------------------------------------------------- EX7
-- show the AlbumName, ArtistName, the current price of the album, and how many times it has been sold 
-- (show the ones that have never been sold too!)
select AlbumName, ArtistName, CurrentPrice, sum(Quantity) 'Number of Times Sold' from Album
inner join Artist on Album.ArtistID = Artist.ArtistID
inner join ReceiptAlbum on ReceiptAlbum.AlbumID = Album.AlbumID
group by AlbumName, ArtistName, CurrentPrice

-- great, but this doesn't show the albums that have never been sold! Let's fix that...
select AlbumName, ArtistName, CurrentPrice, sum(Quantity) 'Number of Times Sold' from Album
left outer join Artist on Album.ArtistID = Artist.ArtistID
left outer join ReceiptAlbum on ReceiptAlbum.AlbumID = Album.AlbumID
group by AlbumName, ArtistName, CurrentPrice
-- notice that the "NULL"s are really just saying that this album doesn't appear in the ReceiptAlbum table.

-- EXAMPLE 8 --------------------------------------------------------------------------------------------------------------------------------------------------------------- EX8
-- Show me the biggest purchase a customer has made and show me their full name and phone number
select firstname + ' ' + lastname 'Name', Phone from Customer
inner join Receipt on Receipt.CustomerID = Customer.CustomerID
where Subtotal = (select Max(subtotal) from Receipt)

-- EXAMPLE 9 --------------------------------------------------------------------------------------------------------------------------------------------------------------- EX9
-- Show ALL customers and how much they've spent at my store (including tax)
select FirstName, LastName from Customer
where CustomerID not in (select CustomerID from Receipt)

-- EXAMPLE 10 ------------------------------------------------------------------------------------------------------------------------------------------------------------- EX10
-- Show all customers who haven't bought anything

-- EXAMPLE 11 ------------------------------------------------------------------------------------------------------------------------------------------------------------- EX11
-- Show all employees who haven't sold anything

-- EXAMPLE 12 -- This is hard, Claire can only solve this by using stuff you don't learn in this class. If you want to see Claire's solution just ask her :)
-- Show which album has been sold the most. 
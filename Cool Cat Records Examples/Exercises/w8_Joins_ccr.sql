-- EXAMPLE 1 --
-- select AlbumID, AlbumName, ArtistName, and Genre ID 
select AlbumID, AlbumName, ArtistName, GenreID from Album
inner join Artist on Album.ArtistID = Artist.ArtistID

-- EXAMPLE 2 --
-- select Employee's full name, how many repeipts they are attached to 
select firstname + ' ' + lastname 'Employee Name', count(receiptID) from Employee
inner join Receipt on Receipt.EmployeeID = Employee.EmployeeID
group by firstname, lastname

-- Now, if I want to check that this data is correct, I'm going to modify my answer up top:
select firstname + ' ' + lastname 'Employee Name', receiptID from Employee
inner join Receipt on Receipt.EmployeeID = Employee.EmployeeID
order by employee.EmployeeID

-- now I can see how many receipts "Stan McMann" is attached to and double check that it's the same as my answer above!

-- EXAMPLE 3 --
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

-- EXAMPLE 4 --
-- show all employees whose total amount of money sold is greater than 50$.
select firstname + ' ' + lastname 'Employee Name', sum(subtotal) from Employee
inner join Receipt on Receipt.EmployeeID = Employee.EmployeeID
group by firstname, lastname
having sum(subtotal) > 50

-- EXAMPLE 5 --
-- select AlbumID, AlbumName, ArtistName, and Genre Description
-- HINT: there are three tables here!

-- EXAMPLE 6 --
-- show me all the customers who had purchases greater than 50$ and show me what kind of payment they used (PaymentType description)

-- EXAMPLE 7 --
-- show the AlbumName, ArtistName, the current price of the album, and how many times it has been sold

-- EXAMPLE 8 --
-- Show me the biggest purchase a customer has made and show me their full name and phone number

-- EXAMPLE 9 --
-- Show ALL customers and how much they've spent at my store (including tax)

-- EXAMPLE 10 --
-- Show all customers who haven't bought anything

-- EXAMPLE 11 -- 
-- Show all employees who haven't sold anything

-- EXAMPLE 12 -- This is hard, even Claire can't figure it out right now. See if you can do it!
-- Show which album has been sold the most. 
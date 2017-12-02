-- DMIT 1508 SL
-- Claire Stanhope
-- DISCLAIMER: I'm not a professional, I make mistakes. 
-- If you notice an error in my answers please let me know! I like to learn from mistakes :)

-- EXAMPLE 1 -- "CustomerView"
-- Create a view that shows a customer's full name, phone number, city, email, and how many receipts they are attached to.
create view CustomerView
as
select FirstName + ' ' + LastName 'Customer Name', Phone, City, Email, count(ReceiptID)'Number of Receipts' from Customer
inner join Receipt on Receipt.CustomerID = Customer.CustomerID
group by FirstName, LastName, Phone, city, email

go

select * from CustomerView

-- EXAMPLE 2 -- "CustomerTotalPurchaseView"
-- take the view from example 1, change the name, and modify it so that instead of showing how many receipts, show the total 
-- number of items they have bought at the store. 
go
create view CustomerTotalPurchaseView
as
select FirstName + ' ' + LastName 'Customer Name', Phone, City, Email, sum(Quantity)'Total # of Items Purchased' from Customer
inner join Receipt on Receipt.CustomerID = Customer.CustomerID
inner join ReceiptAlbum on ReceiptAlbum.ReceiptID = Receipt.ReceiptID
group by FirstName, LastName, Phone, city, email

go

select * from CustomerTotalPurchaseView

-- EXAMPLE 3 -- "FullAlbumInfo"
-- create a view that shows the album information but where the Album table has IDs, show what the IDs correspond to.
-- (You probably want to set column headings so they make sense...)
go
create view FullAlbumInfo as
select AlbumName, ArtistName, ISMN, Description 'Genre', CurrentPrice, QOH 'Quantity on Hand' from Album
inner join Artist on Artist.ArtistID = Album.ArtistID
inner join Genre on Genre.GenreID = Album.GenreID

go

select * from FullAlbumInfo
select * from FullAlbumInfo where ArtistName like '%queen%'

-- EXAMPLE 4 -- "FullReceiptInfo"
-- Create a view that shows receipts with all the relevant information in stead of the "ID"s
-- (Create useful column headings!)
go
create view FullReceiptInfo as
select ReceiptID, Date, Customer.FirstName + ' ' + Customer.LastName 'Customer', Employee.FirstName + ' ' + Employee.LastName 'ProcessedBy', Subtotal, Tax, Total, Description 'PaymentType' from Receipt
inner join Customer on Customer.CustomerID = Receipt.CustomerID
inner join Employee on Employee.EmployeeID = Receipt.EmployeeID
inner join PaymentType on PaymentType.PaymentTypeID = Receipt.PaymentTypeID

go

select * from FullReceiptInfo
select * from FullReceiptInfo where PaymentType = 'Cash'
select * from FullReceiptInfo where ProcessedBy like '%stark%'
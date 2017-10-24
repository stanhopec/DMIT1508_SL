select * from Customer

select count(CustomerID) from Customer
where Province = 'ON'

-- this is slower than CustomerID because Province is not indexed 
select count(Province) from Customer
where Province = 'ON'

select * from PurchaseOrder
-- Sum all totals where the total is greater than 4000
select sum(total) from PurchaseOrder
	where total > 4000

select * from Album
-- select all albums with a GenreID of 6
select AlbumName, GenreID from Album
	where GenreID = 6

-- genre like 'Rock'
select AlbumID, AlbumName, Genre.GenreID, Description from Album
	inner join Genre
	on Album.GenreID = Genre.GenreID
	where Description like '%Rock%'
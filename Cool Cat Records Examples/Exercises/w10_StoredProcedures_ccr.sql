-- DMIT 1508 SL
-- Claire Stanhope
-- DISCLAIMER: I'm not a professional, I make mistakes. 
-- If you notice an error in my answers please let me know! I like to learn from mistakes :)


-- EXAMPLE 1 ----------------------------------------------------------------------------------------------------------------------------------------------
-- create a procedure that shows AlbumName, ArtistName, CurrentPrice, and QOH. Just one big dump of data!
create procedure AllAlbums as
	select AlbumName, ArtistName, CurrentPrice, QOH from Album
	inner join Artist on Artist.ArtistID = Album.ArtistID
return

exec AllAlbums

-- EXAMPLE 2 ----------------------------------------------------------------------------------------------------------------------------------------------
-- change the above procedure to only show the albums sold in 2011. Call it "AllAlbums2011"
go
create procedure AllAlbums2011 as
	select AlbumName, ArtistName, CurrentPrice, QOH from Album
	inner join Artist on Artist.ArtistID = Album.ArtistID
	inner join ReceiptAlbum on ReceiptAlbum.AlbumID = Album.AlbumID
	inner join Receipt on Receipt.ReceiptID = ReceiptAlbum.ReceiptID
		where year(Date) = 2011
return

exec AllAlbums2011

-- EXAMPLE 3 ----------------------------------------------------------------------------------------------------------------------------------------------
-- create a procedure called "SearchAlbumByKeyword" that takes a string as a parameter and returns all Album names that contain that string.
-- show the album name, artist name, and albumID.
drop procedure SearchAlbumByKeyword
go
create procedure SearchAlbumByKeyword (@key varchar(100) = null) as
	if @key = null
		begin
		print 'Hey! Give me a key!'
		--raiserror('No key was entered. Please pass a keyword to this procedure.', 16, 1)
		end
	else 
		begin
		select Album.AlbumID, ArtistName, AlbumName from Album
		inner join Artist on Artist.ArtistID = Album.ArtistID
		where AlbumName like '%'+@key+'%'
		end
return
go

-- testing
exec SearchAlbumByKeyword 'Led' -- notice there's only one entry!
exec SearchAlbumByKeyword 'Queen' -- no albums with "QUEEN" in them
exec SearchAlbumByKeyword 't' -- lots of albums with the letter "T" in them :)


-- EXAMPLE 4 ----------------------------------------------------------------------------------------------------------------------------------------------
-- modify the above procedure to search the passed keyword in exists in either Album name OR Artist name. Display the same values as above. 
-- Call it "SearchAlbumOrArtistByKeyword"
drop procedure SearchAlbumOrArtistByKeyword
go
create procedure SearchAlbumOrArtistByKeyword (@key varchar(100) = null) as
	if @key = null
		begin
		print 'Hey! Give me a key!'
		--raiserror('No key was entered. Please pass a keyword to this procedure.', 16, 1)
		end
	else 
		begin
		select Album.AlbumID, ArtistName, AlbumName from Album
		inner join Artist on Artist.ArtistID = Album.ArtistID
		where ArtistName like '%'+@key+'%'
			or AlbumName like '%'+@key+'%'
		end
return
go

-- testing
exec SearchAlbumOrArtistByKeyword 'Led' -- notice there's only one entry!
exec SearchAlbumOrArtistByKeyword 'Queen'

-- EXAMPLE 5 ----------------------------------------------------------------------------------------------------------------------------------------------
-- change the Example 2 procedure to take a year as a parameter and return a list of all albums sold in that year. Call it "AlbumsByYearSold"

-- this is a big problem, let's take a smaller bite from it and just get the select statement working with a hardcoded year, then move on to the procedure. 
-- using a subquery
select AlbumName, ArtistName, CurrentPrice, QOH from Album
inner join Artist on Artist.ArtistID = Album.ArtistID
where AlbumID in 
				(select AlbumID from ReceiptAlbum 
				inner join Receipt on Receipt.ReceiptID = ReceiptAlbum.ReceiptID
				where year(Date) = 2011)

-- using just inner joins
select AlbumName, ArtistName, CurrentPrice, QOH from Album
inner join Artist on Artist.ArtistID = Album.ArtistID
inner join ReceiptAlbum on ReceiptAlbum.AlbumID = Album.AlbumID
inner join Receipt on Receipt.ReceiptID = ReceiptAlbum.ReceiptID
where year(Date) = 2011 


-- Let's make sure that we understand how procedures with parameters work...
create procedure AlbumsByYearSold (@year int = null) as
	if @year is null
		begin
		print 'Must give a year'
		end
	else
		begin
		print 'okay!'
		end
return

exec AlbumsByYearSold -- returns: "Must give a year"
exec AlbumsByYearSold 2000 -- returns: "okay!"
exec AlbumsByYearSold 'banana' -- ERROR: Msg 8114, Level 16, State 1, Procedure AlbumsByYearSold, Line 0. Error converting data type varchar to int.

-- now let's put our above select statement into the procedure we just created! 
create procedure AlbumsByYearSold (@year int = null) as
	if @year is null
		begin
		--print 'Must give a year'
		raiserror('Must enter a year as a parameter. Procedure failed.', 16, 1)
		end
	else
		begin
		select AlbumName, ArtistName, CurrentPrice, QOH from Album
		inner join Artist on Artist.ArtistID = Album.ArtistID
		where AlbumID in 
						(select AlbumID from ReceiptAlbum 
						inner join Receipt on Receipt.ReceiptID = ReceiptAlbum.ReceiptID
						where year(Date) = @year)
		end
return

-- testing!
exec AlbumsByYearSold
exec AlbumsByYearSold 2011 -- let's check that this is actually right...

-- how many Receipts were done in 2011? Let's write the results down. 
select * from Receipt
-- two receipts: 104 & 105

-- Now let's see which Albums were associated with those receipts. 
select AlbumID from ReceiptAlbum
where ReceiptID in (104, 105)
-- So albums 100, 101, and 103 are the albums sold in 2011. 

-- What is their names?
select AlbumName from Album 
where AlbumID in (100, 101, 103)
-- now run the AlbumsByYearSold again. Look, the AlbumNames are the same! We did it!

-- EXAMPLE 6 ----------------------------------------------------------------------------------------------------------------------------------------------
-- create a procedure called "UserSearch" that takes two parameters: 
--		1. a number from 1-3 that corresponds with what the user wants to search for. 1 = album, 2 = artist, 3 = genre, 4 = all
--		2. a keyword to search for
-- check that all parameters are passed and that the values given make sense. 
-- the procedure will show the album name, artist name, and genre for all results.

-- Note: if you created the Example 3 view from the Views exercise, you could use that view here :)
-- or you can create your own view for this question if desired.

create procedure UserSearch(@type int = null, @key varchar(100) = null) as
	-- error checking
	if @type is null or @key is null
		begin
		raiserror('Please enter two parameters: 1. a selected search method and 2. a keyword to search for.', 16, 1)
		end
	else if @type not in (1, 2, 3, 4)
		begin
		raiserror('The search type entered not valid. Must be a number from 1 to 3 (1 = album, 2 = artist, 3 = genre)', 16, 1)
		end
	-- now the real code
	else
		begin
		if @type = 1 -- album
			begin
			select ArtistName, AlbumName, Description from Album
			inner join Artist on Artist.ArtistID = Album.ArtistID
			inner join Genre on Genre.GenreID = Album.GenreID
			where AlbumName like '%'+@key+'%'
			end
		else if @type = 2 -- artist
			begin
			select ArtistName, AlbumName, Description from Album
			inner join Artist on Artist.ArtistID = Album.ArtistID
			inner join Genre on Genre.GenreID = Album.GenreID
			where ArtistName like '%'+@key+'%'
			end
		else if @type = 3 -- genre
			begin
			select ArtistName, AlbumName, Description from Album
			inner join Artist on Artist.ArtistID = Album.ArtistID
			inner join Genre on Genre.GenreID = Album.GenreID
			where Description like '%'+@key+'%'
			end
		else -- all
			begin
			select ArtistName, AlbumName, Description from Album
			inner join Artist on Artist.ArtistID = Album.ArtistID
			inner join Genre on Genre.GenreID = Album.GenreID
			where AlbumName like '%'+@key+'%'
				or ArtistName like '%'+@key+'%'
				or Description like '%'+@key+'%'
			end
		end
return

exec UserSearch -- error!
exec UserSearch 1, 'a'
exec UserSearch 4, 'b'
exec UserSearch 4, 'stone'

-- or with a view...
go
create view FullAlbum as
select ArtistName, AlbumName, Description from Album
inner join Artist on Artist.ArtistID = Album.ArtistID
inner join Genre on Genre.GenreID = Album.GenreID
go

create procedure UserSearch2(@type int = null, @key varchar(100) = null) as
	-- error checking
	if @type is null or @key is null
		begin
		raiserror('Please enter two parameters: 1. a selected search method and 2. a keyword to search for.', 16, 1)
		end
	else if @type not in (1, 2, 3, 4)
		begin
		raiserror('The search type entered not valid. Must be a number from 1 to 3 (1 = album, 2 = artist, 3 = genre)', 16, 1)
		end
	-- now the real code
	else
		begin
		if @type = 1 -- album
			begin
			select * from FullAlbum
			where AlbumName like '%'+@key+'%'
			end
		else if @type = 2 -- artist
			begin
			select * from FullAlbum
			where ArtistName like '%'+@key+'%'
			end
		else if @type = 3 -- genre
			begin
			select * from FullAlbum
			where Description like '%'+@key+'%'
			end
		else -- all
			begin
			select * from FullAlbum
			where AlbumName like '%'+@key+'%'
				or ArtistName like '%'+@key+'%'
				or Description like '%'+@key+'%'
			end
		end
return

exec UserSearch2 -- error!
exec UserSearch2 1, 'a'
exec UserSearch2 4, 'b'
exec UserSearch2 4, 'stone'
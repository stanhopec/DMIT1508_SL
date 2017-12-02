-- DMIT 1508 SL
-- Claire Stanhope
-- DISCLAIMER: I'm not a professional, I make mistakes. 
-- If you notice an error in my answers please let me know! I like to learn from mistakes :)


-- EXAMPLE 1 -- "AddAlbum" -------------------------------------------------------------------------------
-- Create a procedure to add a new Album to the Album table
-- Take the parameters AlbumName, ArtistName, ISMN, GenreDescription, CurrentPrice, and QOH (Quantity On Hand)
-- make sure you set the right data types for the parameters!
-- If the genre entered does not already exist, create it!
-- Do NOT create a new artist if artist does not exist.


-- This is Claire's basic framework for this question...
-- REMEMBER:
-- an insert for Genre
-- check artist exists.


-- Claire's "wireframe":

-- check if params passed are null
	-- if yes, raise error
	-- else...
-- begin transaction
--genre exists?
	-- if yes, do...
		-- get the genre ID

	-- if no, do...
		-- create the genre

-- artist exists?
	-- if yes, do...
		-- insert the album into album table
		-- if insert fails:
			-- rollback
		-- else
			-- commit transaction

	-- if no, do...
		-- raise error
		-- rollback


alter procedure AddAlbum (@albName varchar(60) = null, 
							@artist varchar(50) = null, 
							@ismn bigint = null, 
							@genre varchar(50) = null, 
							@currPrice smallmoney = null,
							@qoh int = null) 
as
if @albName is null 
OR @artist is null 
OR @ismn is null 
OR @genre is null 
OR @currPrice is null 
OR @qoh is null
	begin
	raiserror('MISSING PARAMETER: Insert 6 parameters: AlbumName, ArtistName, ISMN, GenreDescription, CurrentPrice, and QOH (Quantity On Hand). Procedure Failed.', 16, 1)
	end
else
	begin
	declare @artistID int, @genreID int
	-- check genre exists
	select @genreID = GenreID from Genre where Description like @genre

	begin transaction -- we don't want to create this genre if there is some other problem down the road!

	if @genreID is null -- if no genre matches, create the new genre
		begin
		insert into Genre (Description) values (@genre)

		if @@ERROR != 0 -- check if the insert into Genre failed.
			begin
			raisError('Could not create a new genre. Genre insert failed. ', 16, 1)
			rollback transaction
			end
		else -- inserting a new genre was successful
			begin
			select @genreID = GenreID from Genre where Description like @genre --  now we should get something!
			end
		end

	-- check the artist exists
	select @artistID = ArtistID from Artist where ArtistName = @artist
	if @artistID is null -- if there is no matching artist name
		begin
		raiserror('INCORRECT PARAMETER: The Artist Name passed does not exist in the artist table. Procedure Failed.', 16,1)
		rollback transaction
		end
	else -- there is an artist name
		begin
		insert into Album (AlbumName, ArtistID, ISMN, GenreID, CurrentPrice, QOH)
			values (@albName, @artistID, @ismn, @genreID, @currPrice, @qoh)
			
		if @@ERROR != 0 -- check if the insert into Genre failed.
			begin
			raisError('Could not insert a new album into the Album table. Transaction cancelled.', 16, 1)
			rollback transaction
			end
		else -- the insert worked fine
			begin
			print 'Album inserted successfully!' 
			commit transaction -- everything worked, yay!
			end
		end
	end
return

-- Now, we TEST!
select * from FullAlbumInfo


-- TEST 1: an artist that exists, an existing genre
exec AddAlbum 'Another Level', 'Blackstreet', 5562132458951, 'Hip Hop', 9.50, 2

-- TEST 2: an artist that exists, a new genre
exec AddAlbum 'American Idiot', 'Green Day', 1564487549132, 'Punk Rock', 11.45, 7
-- we should see two rows affected and get our happy message!

-- TEST 3: an artist that DOES NOT exist, an existing genre
exec AddAlbum 'American Idiot', 'Gren Day', 1564487549132, 'Punk Rock', 11.45, 7
-- now run our select, does this new album show up?

-- TEST 4: an artist that DOES NOT exist, a new genre
exec AddAlbum 'This is Wrong', 'Claire Rocks', 5555555555555, 'Claire''s new genre', 99.45, 99

select * from FullAlbumInfo -- run this to make sure the album didn't end up in the table.
select * from Genre -- run this to make sure the new genre was "un-made"




-- EXAMPLE 2: steps for archiving an employee -------------------------------------------------------------------------------

-- 1. Select Employee Info from Employee Table

-- begin transaction
-- 2. Insert Employee Info into Archive Employee Table
	-- if insert fails
		-- rollback
	-- else 3.
-- 3. Delete Employee from Employee Table
	-- if delete fails
		-- rollback
	-- else
		-- commit
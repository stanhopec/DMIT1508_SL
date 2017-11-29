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
return




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
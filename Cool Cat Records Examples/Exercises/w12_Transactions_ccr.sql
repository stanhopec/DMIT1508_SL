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

alter procedure AddAlbum --(declare stuff)
--check stuff isn't null
	-- raise error
--genre exists?
	-- if yes, do...
		-- get the genre ID

	-- if no, do...
		-- create the genre

-- artist exists?
	-- if yes, do...
		-- insert the album into album table

	-- if no, do...
		-- raise error


-- 1. Select Employee Info from Employee Table

-- begin transaction
-- 2. Insert Employee Info into Archive Employee Table
	-- if insert fails
		-- rollback
	-- else 3.
-- 3. Delete Employee from Employee Table
	-- if delete failst
		-- rollback
	-- else
		-- commit
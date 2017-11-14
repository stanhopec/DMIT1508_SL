-- DMIT 1508 SL
-- Claire Stanhope
-- DISCLAIMER: I'm not a professional, I make mistakes. 
-- If you notice an error in my answers please let me know! I like to learn from mistakes :)


-- EXAMPLE 1 ----------------------------------------------------------------------------------------------------------------------------------------------
-- create a procedure that shows AlbumName, ArtistName, CurrentPrice, and QOH. Just one big dump of data!

-- EXAMPLE 2 ----------------------------------------------------------------------------------------------------------------------------------------------
-- change the above procedure to only show the albums sold in 2011. Call it "AllAlbums2011"


-- EXAMPLE 3 ----------------------------------------------------------------------------------------------------------------------------------------------
-- create a procedure called "SearchAlbumByKeyword" that takes a string as a parameter and returns all Album names that contain that string.
-- show the album name, artist name, and albumID.


-- EXAMPLE 4 ----------------------------------------------------------------------------------------------------------------------------------------------
-- modify the above procedure to search the passed keyword in exists in either Album name OR Artist name. Display the same values as above. 
-- Call it "SearchAlbumOrArtistByKeyword"


-- EXAMPLE 5 ----------------------------------------------------------------------------------------------------------------------------------------------
-- change the Example 2 procedure to take a year as a parameter and return a list of all albums sold in that year. Call it "AlbumsByYearSold"

-- this is a big problem, let's take a smaller bite from it and just get the select statement working with a hardcoded year, then move on to the procedure. 

-- Please let Claire know when you think you've got this select statement done before moving on :)


-- EXAMPLE 6 ----------------------------------------------------------------------------------------------------------------------------------------------
-- create a procedure called "UserSearch" that takes two parameters: 
--		1. a number from 1-3 that corresponds with what the user wants to search for. 1 = album, 2 = artist, 3 = genre, 4 = all
--		2. a keyword to search for
-- check that all parameters are passed and that the values given make sense. 
-- the procedure will show the album name, artist name, and genre for all results.

-- Note: if you created the Example 3 view from the Views exercise, you could use that view here :)
-- or you can create your own view for this question if desired.

-- EXAMPLE 7 ----------------------------------------------------------------------------------------------------------------------------------------------
-- 

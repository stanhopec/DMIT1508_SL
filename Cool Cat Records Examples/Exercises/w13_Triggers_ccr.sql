-- DMIT 1508 SL
-- Claire Stanhope

-----------------------------------------------------------------------------------------------
--------------------- DISCLAIMER: I'm not a professional, I make mistakes. --------------------
-- If you notice an error in my answers please let me know! I like to learn from mistakes :) --
-----------------------------------------------------------------------------------------------

-- EXAMPLE 1 -- "tr_Receipt_Insert_Update" ---------------------------------------------------------------------------------------------------------------------------------------------
-- Create a trigger that checks whether the employee attached to the EmployeeID in receipt is active.

-- EXAMPLE 2 -- "tr_ReceiptAlbum_Insert" -----------------------------------------------------------------------------------------------------------------------------------------------
-- Create a trigger that updates the quantity on hand of an album when a new Receipt Album is created

-- EXAMPLE 3 -- "tr_LimitArtist_UpdateInsert" ------------------------------------------------------------------------------------------------------------------------------------------
-- For some reason, my business doesn't want one artist to have more than four albums. Don't ask why, it's a weird business. 
-- NOTE: if my business has been going on for a while, I might already have an artist with 5 albums. I don't want this to affect that, 
-- I just want it to prevent this in the future! So you'll have to NARROW YOUR SEARCH AND LOOK AT RECORDS THAT YOU JUST INSERTED. HINT HINT.

-- EXAMPLE 4 -- "tr_TerminatedEmployees_Update" ------------------------------------------------------------------------------------------------------------------------------------------------
-- create a trigger that stores Employee info when the "Date Released" of an employee is changed to NOT NULL (i.e. they were fired)
-- Store the information in a TerminatedEmployees table with the columns...
--		TerminatedEmpID (PK)
--		EmployeeID (FK)
--		DateHired
--		DateReleased
--		Wage when released
-- Also, change the Employee "ActiveYN" to "N"

-- EXAMPLE 5 -- "tr_TrackEmpWage_Update" ------------------------------------------------------------------------------------------------------------------------------------------------
-- Create a table that tracks changed in Employee Wages via a trigger. If the employee wage is DECREASED, raise an error 
-- and inform the user that they do not have the correct permissions.
-- If a wage is increased more than 20%, raise an error and give the user a message.
-- The EmployeeWageChanges table should have the columns...
--		WageChangeID (PK)
--		EmployeeID (FK)
--		Date
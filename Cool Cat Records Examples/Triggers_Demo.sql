-- TRIGGERS: examples and demos

-- understanding the "inserted" and "deleted" tables
create trigger TR_Customer_Update
on Customer
for update
as
Print 'starting trigger'
select * from inserted
select * from deleted
select * from Customer
rollback transaction
select * from inserted
select * from deleted
select * from Customer
print 'trigger complete!'
return

go

-- let's pick a customer to pick on. How about Mary Poppins, number 102?
select * from CUstomer

-- This update will get our trigger going and we'll be able to see the tables!
update Customer
set FirstName = 'Robert'
	where CustomerID = 102



/*************************************************************************************************************
 **********************************  CLAIRE's TRIGGER CHEAT SHEET  *******************************************
 *************************************************************************************************************/

/**** FOR UPDATE:
		- check @@ROWCOUNT
		- check update(X)
		- if exists
*/

/**** FOR INSERT:
		- check @@ROWCOUNT
*/

/**** FOR DELETE:
		- check @@ROWCOUNT
		- if exists
*/
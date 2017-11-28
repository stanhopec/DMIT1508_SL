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


go
create trigger THE_UPDATE_KEYWORD
on Customer
for insert as
-- for insert, update as
-- for insert, update, delete as
if @@ROWCOUNT > 0 and update(Email)
	begin
	-- these two tables will only print out if the above if statments are true!
	select * from inserted
	select * from deleted

	-- make sure we don't actually commit our changes!
	rollback transaction
	end
return
go


insert into Customer(FirstName, LastName, Phone, Address, City, Province, PostalCode, Country)
	values ('Carl', 'Sternhop', '1-866-265-2651', '123 4th Street', 'Victoria', 'BC', 'V4T5H2', 'Canada')

delete Customer where CustomerID = 110

select * from Customer


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
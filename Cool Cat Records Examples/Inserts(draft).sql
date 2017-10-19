-- Cool Cat Records: inserts
-- Claire Stanhope 
-- DMIT 1508 SL 2017

/* INSERT INTO CUSTOMER *************************************************************************************************************************************************
************************************************************************************************************************************************************* CUSTOMER **/
insert into Customer(FirstName, LastName, Phone, Address, City, Province, PostalCode, Country, Email)
	values ('Carl', 'Sternhop', '1-866-265-2651', '123 4th Street', 'Victoria', 'BC', 'V4T5H2', 'Canada', 'carl@hotmail.com')
insert into Customer(FirstName, LastName, Phone, Address, City, Province, PostalCode, Country, Email)
	values ('Joe', 'McBaine', '1-555-256-3321', '16-99056 Main Street', 'Calgary', 'AB', 'T5H3U6', 'Canada', 'jmcbaine@hotmail.com')
insert into Customer(FirstName, LastName, Phone, Address, City, Province, PostalCode, Country)
	values ('Mary', 'Poppins', '1-889-261-6156', 'Super Road', 'Thunder Bay', 'ON', 'F7Y3I8', 'Canada') -- no email
insert into Customer(LastName, Phone, Address, City, Province, PostalCode, Country, Email)
	values ('Teller', '1-444-659-3256', '156 963 Cresc', 'Philadelphia', 'PA', '12345', 'USA', 'teller@magic.com') -- no first name
insert into Customer(FirstName, LastName, Phone, Address, City, Province, PostalCode, Country, Email)
	values ('Velaryon', 'Targaryen', '7-895-621-6255', '1598 Valyria Lane', 'Moosejaw', 'SK', 'U8P0K9', 'Canada', 'queen@westeros.we')
insert into Customer(FirstName, LastName, Phone, Address, City, Province, PostalCode, Country, Email)
	values ('Olivia', 'Dunham', '1-866-265-2651', '78 Street', 'Jacksonville', 'FL', '56932', 'USA', 'odunham@fringe.gov')
insert into Customer(FirstName, LastName, Phone, Address, City, Province, PostalCode, Country, Email)
	values ('Zaphod', 'Beeblebrox', '9-653-632-2666', '666 Universe Lane', 'Toronto', 'ON', 'H5H5H5', 'Canada', 'president@universe.org')
insert into Customer(FirstName, LastName, Phone, Address, City, Province, PostalCode, Country, Email)
	values ('Kalle', 'Karhunen', '3-659-326-1156', '19 Armintie', 'Oulu', 'OL', '99653', 'Finland', 'suomi789@mail.fi')

/* INSERT INTO EMPLOYEE *************************************************************************************************************************************************
************************************************************************************************************************************************************* EMPLOYEE **/
-- notice: no "date released"
insert into Employee(FirstName, LastName, Phone, Address, City, Province, PostalCode, Country, Email, Wage, DateHired, ActiveYN) -- no "DateHired"; I wanted the default!
	values('Stan', 'McMann', '1-999-625-3156', '78 Something Street', 'Vancouver', 'BC', 'V8T4U6', 'Canada', 'stan@hotmail.com', 10.75, '7 Oct 2008', 'Y')
insert into Employee(FirstName, LastName, Phone, Address, City, Province, PostalCode, Country, Email, Wage, ActiveYN) -- no "DateHired"; I wanted the default!
	values('Charlie', 'Francis', '1-659-999-6561', '78 Something Street', 'Vancouver', 'BC', 'V8T4U6', 'Canada', 'cf@fringe.com', 16.75, 'Y')
insert into Employee(FirstName, LastName, Phone, Address, City, Province, PostalCode, Country, Email, Wage, DateHired, ActiveYN)
	values('Philip', 'Broyles', '1-659-999-3356', '44 Main Street', 'Vancouver', 'BC', 'V8T4U9', 'Canada', 'pb@fringe.com', 18.00, '10 May 2010', 'Y')
insert into Employee(FirstName, LastName, Phone, Address, City, Province, PostalCode, Country, Email, Wage, DateHired, ActiveYN)
	values('Sansa', 'Stark', '7-965-226-6231', '42 Winterfell Lane', 'Vancouver', 'BC', 'V8T4V4', 'Canada', 'lady@stark.gov', 20.30, '26 Mar 2012', 'Y')
insert into Employee(FirstName, LastName, Phone, Address, City, Province, PostalCode, Country, Email, Wage, DateHired, DateReleased, ActiveYN)
	values('Rob', 'Stark', '5-961-648-5185', '99 Riverrun Crescent', 'Vancouver', 'BC', 'V8T4U0', 'Canada', 'greywind@stark.gov', 19.00, '7 Nov 2008', '8 May 2012', 'N')

/* INSERT INTO PAYMENT TYPE *********************************************************************************************************************************************
********************************************************************************************************************************************************* PAYMENT TYPE **/
insert into PaymentType(Description) values('Cash')
insert into PaymentType(Description) values('Debit')
insert into PaymentType(Description) values('Visa')
insert into PaymentType(Description) values('MasterCard')
insert into PaymentType(Description) values('Cheque')

/* INSERT INTO RECEIPT **************************************************************************************************************************************************
************************************************************************************************************************************************************** RECEIPT **/
insert into Receipt(Date, CustomerID, EmployeeID, Subtotal, Tax, Total, PaymentTypeID)
	values('6 Feb 2008', 100, 100, 25.00, 1.00, 26.00, 2)
insert into Receipt(Date, CustomerID, EmployeeID, Subtotal, Tax, Total, PaymentTypeID)
	values('7 Sep 2009', 107, 104, 56.00, 4.60, 60.60, 1)
insert into Receipt(Date, CustomerID, EmployeeID, Subtotal, Tax, Total, PaymentTypeID)
	values('6 Mar 2010', 105, 102, 5.00, 1.00, 6.00, 2)
insert into Receipt(Date, CustomerID, EmployeeID, Subtotal, Tax, Total, PaymentTypeID)
	values('6 Jul 2010', 103, 103, 76.00, 7.50, 83.50, 4)
insert into Receipt(Date, CustomerID, EmployeeID, Subtotal, Tax, Total, PaymentTypeID)
	values('6 Apr 2011', 102, 103, 11.95, 3.00, 14.95, 1)
insert into Receipt(Date, CustomerID, EmployeeID, Subtotal, Tax, Total, PaymentTypeID)
	values('6 Apr 2011', 102, 103, 75.00, 10.00, 85.00, 3)
insert into Receipt(Date, CustomerID, EmployeeID, Subtotal, Tax, Total, PaymentTypeID)
	values('6 Jan 2015', 101, 104, 18.30, 6.40, 24.70, 5)

/* INSERT INTO GENRE ****************************************************************************************************************************************************
**************************************************************************************************************************************************************** GENRE **/
insert into Genre(Description) values('Rock')
insert into Genre(Description) values('Punk')
insert into Genre(Description) values('R&B')
insert into Genre(Description) values('Hip Hop')
insert into Genre(Description) values('Metal')
insert into Genre(Description) values('Stoner Rock')
insert into Genre(Description) values('Alternative Rock')

/* INSERT INTO ARTIST ***************************************************************************************************************************************************
*************************************************************************************************************************************************************** ARTIST **/
insert into Artist(ArtistName) values ('Nothing But Thieves')
insert into Artist(ArtistName) values ('Led Zeppelin')
insert into Artist(ArtistName) values ('Queens of the Stone Age')
insert into Artist(ArtistName) values ('Eminem')
insert into Artist(ArtistName) values ('Green Day')
insert into Artist(ArtistName) values ('Clutch')
insert into Artist(ArtistName) values ('Beastie Boys')
insert into Artist(ArtistName) values ('Earth, Wind & Fire')
insert into Artist(ArtistName) values ('Blackstreet')
insert into Artist(ArtistName) values ('Pink Floyd')

/* INSERT INTO ALBUM ****************************************************************************************************************************************************
**************************************************************************************************************************************************************** ALBUM **/
insert into Album (AlbumName, ArtistID, ISMN, GenreID, CurrentPrice, QOH) 
	values ('Led Zeppelin II', 101, 6652359859415, 1, '11.00', 2)
insert into Album (AlbumName, ArtistID, ISMN, GenreID, CurrentPrice, QOH) 
	values ('Encore', 103, 6659856231460, 4, '9.80', 6)
insert into Album (AlbumName, ArtistID, ISMN, GenreID, CurrentPrice, QOH) 
	values ('Nimrod', 104, 6320015200641, 2, '7.40', 0)
insert into Album (AlbumName, ArtistID, ISMN, GenreID, CurrentPrice, QOH) 
	values ('Ill Communication', 106, 5699856471115, 4, '11.00', 2)
insert into Album (AlbumName, ArtistID, ISMN, GenreID, CurrentPrice, QOH) 
	values ('Blackstreet', 108, 6235145985222, 3, '10.00', 5)
insert into Album (AlbumName, ArtistID, ISMN, GenreID, CurrentPrice, QOH) 
	values ('Blast Tyrant', 105, 2226531522455, 6, '12.50', 2)
insert into Album (AlbumName, ArtistID, ISMN, GenreID, CurrentPrice, QOH) 
	values ('Nothing But Thieves', 100, 9855551236451, 7, '10.00', 3)
insert into Album (AlbumName, ArtistID, ISMN, GenreID, CurrentPrice, QOH) 
	values ('Era Vulgaris', 102, 3251477779652, 6, '9.99', 2)
insert into Album (AlbumName, ArtistID, ISMN, GenreID, CurrentPrice, QOH) 
	values ('...Like Clockwork', 102, 5321459874555, 6, '12.00', 4)
insert into Album (AlbumName, ArtistID, ISMN, GenreID, CurrentPrice, QOH) 
	values ('The Elephant Riders', 105, 2311114562894, 6, '10.00', 1)
insert into Album (AlbumName, ArtistID, ISMN, GenreID, CurrentPrice, QOH) 
	values ('Villains', 102, 8655594122333, 6, '13.00', 0)
insert into Album (AlbumName, ArtistID, ISMN, GenreID, CurrentPrice, QOH) 
	values ('Broken Machine', 100, 1125632599856, 7, '17.00', 4)

/* INSERT INTO SUPPLIER *************************************************************************************************************************************************
************************************************************************************************************************************************************* SUPPLIER **/
insert into Supplier(SupplierName, Phone, PhoneExtension, Address, City, Province, PostalCode)

/* INSERT INTO PURCHASE ORDER *******************************************************************************************************************************************
******************************************************************************************************************************************************* PURCHASE ORDER **/



/* INSERT INTO PURCHASE ORDER ALBUM *************************************************************************************************************************************
************************************************************************************************************************************************* PURCHASE ORDER ALBUM **/
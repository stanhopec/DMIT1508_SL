create table Supplier
(
	SupplierID int not null
		identity(100, 1)
		constraint pk_Supplier primary key clustered,
	SupplierName varchar(100) not null,
	Phone varchar(14) not null
		constraint ck_Supplier_ValidPhone check (Phone like '[1-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'), -- I assumed area code can't be 0.
	PhoneExtension int null,
	Address varchar(50) not null,
	City varchar(20) not null 
		constraint df_Supplier_CityEdmonton default 'Edmonton',
	PostalCode varchar(7) not null
		constraint ck_Supplier_ValidPC check (PostalCode like '[A-Z][0-9][A-Z]-[0-9][A-Z][0-9]' or PostalCode like '[0-9][0-9][0-9][0-9][0-9]'),
	Blah varchar(2) not null
		constraint blah check (Blah like '[1-9]')
)
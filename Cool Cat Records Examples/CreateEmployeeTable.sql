create table Employee
(
	EmployeeID int not null
		identity(100, 1)
		constraint pk_Employee primary key clustered,
	FirstName varchar(40) null,
	LastName varchar(50) not null,
	Phone varchar(14) not null
		constraint ck_Employee_ValidPhone check
		(Phone like '[1-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
	Address varchar(30) not null,
	City varchar(20) not null
		constraint df_Employee_CityEdmonton default 'Edmonton',
	PostalCode varchar(7) not null
		constraint ck_Employee_ValidPC check
		(PostalCode like '[A-Z][0-9][A-Z]-[0-9][A-z][0-9]' 
		or PostalCode like '[0-9][0-9][0-9][0-9][0-9]'),
	Province char(2) not null
		constraint df_Employee_ProvinceAB default 'AB'
		constraint ck_Employee_ProvinceUpper check (Province like '[A-Z][A-Z]'),
	Country varchar(15) not null
		constraint df_Employee_CountryCAN default 'Canada',
	Email varchar(40) null
		constraint ck_Employee_ValidEmail check(Email like '%___@__%.__%'),
	Wage smallmoney not null,
	DateHired datetime not null
		constraint df_Employee_DateHiredToday default getdate(),
	DateReleased datetime null,
	ActiveYN char(1) not null
		constraint df_Employee_ActiveY default 'Y'
		constraint ck_Employee_ActiveYN check (ActiveYN like '[YN]'),
	constraint ck_Employee_ReleasedAfterHired check (DateHired >= DateReleased)
)
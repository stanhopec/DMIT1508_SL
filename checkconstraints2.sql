Drop table CheckConstraintExample2

Create table CheckConstraintExample2
(
	-- a phone number of format (555) 555-5555 or 1-555-555-5555
	Phone varchar(14) not null
		constraint ck_PhoneNumber check(Phone like '([0-9][0-9][0-9]) [0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]' or Phone like '[0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
	-- a number between 25 and 95, including 95 but excluding 25 < > 
	var2 int not null
		constraint ck_var2 check(var2 > 25 and var2 <= 95),
	-- a letter from a to r, excluding q and f.
	var3 char(1) not null
		,
	-- a y or n, case insensitive.
	var4 char(1) not null
		,
	-- less than 17
	var5 int not null
		,
	-- greater than 6
	var6 int not null
		,
	-- TABLE LEVEL: var5 must be less than var6.
)
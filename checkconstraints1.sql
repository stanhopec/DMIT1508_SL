Drop table CheckConstraintExample1

Create table CheckConstraintExample1
(
	var1 char(4) not null
		constraint ck_example1 check (var1 like '[0-9][A-F]\[3-5]'),
	var2 datetime not null
		constraint ck_example2 check (var2 != getDate()),
	var3 int not null
		constraint ck_example3 check(var3 > 1 and var3 < 50),
	var4 int not null
		constraint ck_example4 check(var4 >= 1 and var4 <= 50),
	var5 int not null
		constraint ck_example5 check(var5 between 1 and 50), -- is this _INCLUSIVE or EXCLUSIVE?
	var6 char(1) not null
		constraint ck_example6 check(var6 like '[abcdefh]'),
	var7 char(1) not null
		constraint ck_example7 check(var7 between 'a' and 'g'),
	var8 char(1) not null
		constraint ck_example8 check(var8 in('a', 'r', 'q', 't')),
	var9 char(1) not null
		constraint ck_example9 check(var9 = 'M' or var9 = 'm' or var9='Q'),
	constraint ck_tableLevelConstraint check (var3 > var4)
)

-- this insert will work:
insert into CheckConstraintExample1(var1, var2, var3, var4, var5, var6, var7, var8, var9)
values ('3B\5', '20150613 10:00:00 PM', 25, 50, 50, 'c', 'f', 'q', 'Q')

-- Error getDate()
insert into CheckConstraintExample1(var1, var2, var3, var4, var5, var6, var7, var8, var9)
values ('3B\5', getDate(), 25, 50, 50, 'c', 'f', 'q', 'Q')

-- error var1
insert into CheckConstraintExample1(var1, var2, var3, var4, var5, var6, var7, var8, var9)
values ('3B5', '20150613 10:00:00 PM', 25, 50, 50, 'c', 'f', 'q', 'Q')

select * from CheckConstraintExample1
-- drop all my tables.
drop table ReceiptAlbum
drop table PurchaseOrderAlbum
drop table PurchaseOrder
drop table Supplier
drop table Album
drop table Artist
drop table Genre
drop table Receipt
drop table PaymentType
drop table Employee
drop table Customer
go

create table Customer
(
	CustomerID int not null 
		identity (100, 1)
		constraint pk_Customer primary key clustered,
	FirstName varchar(40) not null,
	LastName varchar(50) not null,
	Phone varchar(14) not null
		constraint ck_Customer_ValidPhone check (Phone like '[1-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
	Address varchar(30) not null,
	City varchar(20) not null
		constraint df_Customer_City default 'Edmonton',
	PostalCode varchar(7) not null
		constraint ck_Customer_PostalCodeFormat check (PostalCode like '[A-Z][0-9][A-Z][0-9][A-Z][0-9]' or PostalCode like '[1-9][0-9][0-9][0-9][0-9]'),
	Province char(2) not null
		constraint df_Customer_Province default 'AB'
		constraint ck_Customer_ProvinceValid check (Province like '[A-Z][A-Z]'),
	Country varchar(15) not null
		constraint df_Customer_Country default 'Canada',
	Email varchar(40) null
		constraint ck_Customer_EmailFormat check (Email like '%__@__%.__%')
)
go

create table Employee
(
	EmployeeID int not null
		identity (100, 1)
		constraint pk_Employee primary key clustered,
	FirstName varchar(40) not null,
	LastName varchar(50) not null,
	Phone varchar(14) not null
		constraint ck_Employee_ValidPhone check (Phone like '[1-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
	Address varchar(30) not null,
	City varchar(20) not null
		constraint df_Employee_City default 'Edmonton',
	PostalCode varchar(7) not null
		constraint ck_Employee_PostalCodeFormat check (PostalCode like '[A-Z][0-9][A-Z][0-9][A-Z][0-9]' or PostalCode like '[1-9][0-9][0-9][0-9][0-9]'),
	Province char(2) not null
		constraint df_Employee_Province default 'AB'
		constraint ck_Employee_ProvinceValid check (Province like '[A-Z][A-Z]'),
	Country varchar(15) not null
		constraint df_Employee_Country default 'Canada',
	Email varchar(40) null
		constraint ck_Employee_EmailFormat check (Email like '%___@__%.__%'),
	Wage smallmoney not null
		constraint ck_Employee_WageGT0 check (Wage >= 0),
	DateHired smalldatetime not null
		constraint df_Employee_DateHiredToday default getdate(),
	DateReleased datetime null,
	ActiveYN char(1) not null
		constraint ck_Employee_ActiveYN check (ActiveYN like '[YN]'),
	constraint ck_Employee_ReleasedAfterHired check (DateHired <= DateReleased)
)
go

create table PaymentType
(
	PaymentTypeID tinyint not null
		identity(1, 1)
		constraint pk_PaymentType primary key clustered,
	Description varchar(70) not null
)
go

create table Receipt
(
	ReceiptID int not null 
		identity(100, 1)
		constraint pk_Receipt primary key clustered,
	Date datetime not null
		constraint df_Receipt_DateToday default getdate(),
	CustomerID int not null 
		constraint fk_ReceiptToCustomer references Customer(CustomerID),
	EmployeeID int not null
		constraint fk_ReceiptToEmployee references Employee(EmployeeID),
	Subtotal money not null
		constraint ck_Receipt_SubtotalGT0 check (Subtotal >= 0),
	Tax smallmoney not null
		constraint ck_Receipt_TaxGT0 check (Tax >= 0),
	Total money not null
		constraint ck_Receipt_TotalGT0 check (Total >= 0),
	PaymentTypeID tinyint not null
		constraint fk_ReceiptToPayType references PaymentType(PaymentTypeID),
	constraint ck_Receipt_TotalGESubtotal check (Total >= Subtotal)
)
go

create table Genre
(
	GenreID smallint not null
		identity(1, 1)
		constraint pk_Genre primary key clustered,
	Description varchar(50) not null
)
go

create table Artist
(
	ArtistID int not null
		identity(100, 1)
		constraint pk_Artist primary key clustered,
	ArtistName varchar(50) not null
)
go

create table Album
(
	AlbumID int not null
		identity(100, 1)
		constraint pk_Album primary key clustered,
	AlbumName varchar(60) not null,
	ArtistID int not null
		constraint fk_AlbumToArtist references Artist(ArtistID),
	ISMN bigint not null
		constraint ck_Album_ISMNValid check (ISMN >= 1000000000000 and ISMN <= 9999999999999), -- so this number is not real, but we'll use it anyways.
	GenreID smallint not null
		constraint fk_AlbumToGenre references Genre(GenreID),
	CurrentPrice smallmoney not null
		constraint ck_Album_CurrentPriceGE0 check (CurrentPrice >= 0),
	QOH int not null
		constraint ck_Album_QOHGE0 check (QOH >= 0)
)
go

create table Supplier
(
	SupplierID int not null
		identity(100, 1)
		constraint pk_Supplier primary key clustered,
	SupplierName varchar(100) not null,
	Phone varchar(14) not null
		constraint ck_Supplier_ValidPhone check (Phone like '[1-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
	PhoneExtension int null, -- nullable
	Address varchar(150) not null,
	City varchar(50) not null,
	Province char(2) not null
		constraint ck_Supplier_ProvinceFormat check (Province like '[A-Z][A-Z]'),
	PostalCode varchar(6) not null
		constraint ck_Supplier_PostalCodeFormat check (PostalCode like '[A-Z][0-9][A-Z][0-9][A-Z][0-9]' or PostalCode like '[1-9][0-9][0-9][0-9][0-9]'),
	Country varchar(15) not null
		constraint df_Supplier_CountryCAN default 'Canada'
)
go

create table PurchaseOrder
(
	PurchaseOrderID int not null
		identity(1000, 1)
		constraint pk_PurchaseOrder primary key clustered,
	Date datetime not null
		constraint df_PO_DateToday default getdate(), 
	SupplierID int not null
		constraint fk_PurchaseOrderToSupplier references Supplier(SupplierID),
	Subtotal money not null
		constraint ck_PO_SubtotalGT0 check (Subtotal >= 0),
	Tax smallmoney not null
		constraint ck_PO_TaxGT0 check (Tax >= 0),
	Total money not null,
		constraint ck_PO_Total check (Total >= 0),
	constraint ch_PO_TotalGESubtotal check (Total >= Subtotal)
)
go

create table PurchaseOrderAlbum
(
	AlbumID int not null -- PK, FK
		constraint fk_PurchaseOrderAlbumToAlbum references Album(AlbumID),
	PurchaseOrderID int not null -- PK, FK
		constraint fk_PurchaseOrderAlbumToPurchaseOrder references PurchaseOrder(PurchaseOrderID),
	Quantity int not null
		constraint ck_POA_QuantityGE0 check (Quantity >= 0),
	Cost smallmoney not null
		constraint ck_POA_CostGE0 check (Cost >= 0),
	TotalCost money not null
		constraint ck_POA_AmountGE0 check (TotalCost >= 0),	

	-- Table constraints
	constraint pk_PurchaseOrderAlbum primary key clustered (AlbumID, PurchaseOrderID), 
	constraint ck_PurchaseOrderAlbum_AmountGTCost check (TotalCost >= Cost)
)

create table ReceiptAlbum
(
	AlbumID int not null -- PK, FK
		constraint fk_ReceiptAlbumToAlbum references Album(AlbumID),
	ReceiptID int not null -- PK, FK
		constraint fk_ReceiptAlbumToReceipt references Receipt(ReceiptID),
	Quantity int not null, -- THIS CAN BE LESS THAN ONE : Returns.
	Cost money not null,
	TotalCost money not null,

	constraint pk_ReceiptAlbum primary key clustered (AlbumID, ReceiptID)
)


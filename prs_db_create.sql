-- Drop and Create the Database, DDL

drop database if exists prs_db_create;
create database prs_db_create;
use prs_db_create;

-- DDL - Create Tables
create table User (
	ID 				int 			primary key auto_increment,
	UserName	 	varchar(20)		not null unique,
	Password 		varchar(10) 	not null,
	FirstName 		varchar(25) 	not null,
	LastName	 	varchar(25)		not null, 		
	PhoneNumber		varchar(50) 	not null,
	Email 			varchar(75) 	not null,
	IsReviewer 		TinyInt			not null,
	IsAdmin 		TinyInt,
    constraint uname unique (username)
	);

create table Vendor (
	ID 				int 			not null primary key auto_increment,
	Code	 		varchar(10)		not null unique,
	Name 			varchar(255)	not null,
	Address 		varchar(255)	not null,
	City	 		varchar(255) 	not null,
    State			varchar(2)		not null,
    Zip				varchar(10)		not null,
    PhoneNumber		varchar(12)		not null,
    Email			varchar(100)	not null,
    constraint vcode unique (code)
	);


create table Request (
	ID 					int 			not null primary key auto_increment,
	UserID				int 			not null,
	Description			varchar(100) 	not null,
	Justification		varchar(100)  	not null,
    DateNeeded			date			not null,
    DeliveryMode		varchar(25)		not null,
    Status				varchar(20)		not null,
    Total				decimal(10,2)	not null,
    SubmittedDate		datetime		not null,
    ReasonForRejection	varchar(100),
    foreign key (UserID) references User(ID)
    );
    

create table Product (
	ID					int				not null primary key auto_increment,
    VendorID			int				not null,
    PartNumber			varchar(50)		not null unique,
    Name				varchar(150)	not null,
    Price				decimal(10,2)	not null,
    Unit				varchar(255),
    PhotoPath			varchar(255),
    foreign key (VendorID) references Vendor(ID),
    constraint vendor_part unique (VendorID, PartNumber)
    );
    
    create table LineItem (
    ID					int				not null primary key auto_increment,
    RequestID			int				not null unique,
    ProductID			int				not null unique,
    Quantity			int				not null,
    foreign key (requestID) references Request(ID),
    foreign key (ProductID) references Product(ID),
    constraint req_pdt unique (RequestID, ProductID)
    );
    
    
    
-- need at least three users #admin #reviewer #niether inserts
insert into User (ID, UserName, Password, FirstName, LastName, PhoneNumber, Email, IsReviewer, IsAdmin)
	values (1, 'MC101', 'MC101', 'Marcus', 'Crabtree', '562-296-7129', 'kmarcuscrabtree@gmail.com', 1,1);
insert into User (ID, UserName, Password, FirstName, LastName, PhoneNumber, Email, IsReviewer, IsAdmin)
	values (2, 'Ruby', 'Iliketreat', 'Ruby', 'Dog', '562-296-7129', 'luv2bark@gmail.com', 0,0);
insert into User (ID, UserName, Password, FirstName, LastName, PhoneNumber, Email, IsReviewer, IsAdmin)
	values (3, 'WIFE101', 'WIFE101', 'Dorothy', 'Crabtree', '562-296-7129', 'alwaysright@gmail.com', 1,0);


-- need at least 2 vendor inserts
insert into Vendor (ID, Code, Name, Address, City, State, Zip, PhoneNumber, Email)
	values (1,'1001', '2nd Alpha Division', '4180 Cannon Gate Drive', 'Cincinnati', 'OH', '45245', '562-296-7129', 'info@2ndalpha.com');
insert into Vendor (ID, Code, Name, Address, City, State, Zip, PhoneNumber, Email)
	values (2,'BBEP', 'Best Buy (Eastgate)', '650 Eastgate south Drive', 'Cincinnati', 'OH', '45245', '513-753-7062', 'help@bestbuy.com');


-- need 10 products    
insert into Product (ID, VendorID, PartNumber, Name, Price, Unit, PhotoPath)
	values(1,1,'1001', 'Freedom T-Shirt', '20.00', '1', 'PhotoPath not available');
insert into Product (ID, VendorID, PartNumber, Name, Price, Unit, PhotoPath)
	values(2,1,'2002', 'State Flag - OHIO', '35.00', '1', 'PhotoPath not available');
insert into Product (ID, VendorID, PartNumber, Name, Price, Unit, PhotoPath)
	values(3,1,'3003', 'MAGPUL GEN 3 30 ROUND MAGAZINE - 5.56', '11.00', '1', 'PhotoPath not available');
insert into Product (ID, VendorID, PartNumber, Name, Price, Unit, PhotoPath)
	values(4,1,'4004', '2 Stage Drop-in Trigger AR-15', '300.00', '1', 'PhotoPath not available');
insert into Product (ID, VendorID, PartNumber, Name, Price, Unit, PhotoPath)
	values(5,1,'5005', 'Nylon 3-Gun carrying Bag', '100.00', '1', 'PhotoPath not available');
insert into Product (ID, VendorID, PartNumber, Name, Price, Unit, PhotoPath)
	values(6,2,'6006', 'Wireless Mouse', '20.00', '1', 'PhotoPath not available');
insert into Product (ID, VendorID, PartNumber, Name, Price, Unit, PhotoPath)
	values(7,2,'7007', 'Wireless Keyboard', '50.00', '1', 'PhotoPath not available');
insert into Product (ID, VendorID, PartNumber, Name, Price, Unit, PhotoPath)
	values(8,2,'8008', 'Monitor Stand', '30.00', '1', 'PhotoPath not available');
insert into Product (ID, VendorID, PartNumber, Name, Price, Unit, PhotoPath)
	values(9,2,'9009', '50" UHD LCD TV', '499.99', '1', 'PhotoPath not available');
insert into Product (ID, VendorID, PartNumber, Name, Price, Unit, PhotoPath)
	values(10,2,'1111', 'Nest Thermostat', '200.00', '1', 'PhotoPath not available');

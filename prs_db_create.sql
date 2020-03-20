-- Drop and Create the Database, DDL

drop database if exists prs_db_creatae;
create database prs_db_create;
use pre_db_create;

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
	ID					int				not null, primary key auto_increment,
    VendorID			int				not null unique,
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

-- need at least 2 vendor inserts

-- need 10 products    
    

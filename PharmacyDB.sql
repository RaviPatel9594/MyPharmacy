create database PharmacyDB;

use PharmacyDB;

CREATE TABLE `CustomerInfo` (
  `CustomerId` int primary key not null auto_increment,
  `Name` varchar(40) not null ,
  `Phone` int not null ,
  `Age` int,
  `PostalAddress` varchar(40)
);

alter table CustomerInfo
add DOB date;

CREATE TABLE `Invoice` (
  `Id` int primary key not null auto_increment,
  `TimeStamp` datetime,
  `Mrp` float,
  `DiscountedTotal` float
);

CREATE TABLE `Admin` (
  `username` varchar(40) not null primary key ,
  `Password` varchar(40) not null
);

CREATE TABLE `Medicines` (
  `Id` int not null primary key auto_increment,
  `Name` varchar(40) not null,
  `GenericName` varchar(40) not null,
  `Mrp` float not null,
  `MfgDate` Date not null,
  `ExpDate` Date not null,
  `Category` varchar(40),
  `Quantity` varchar(40) not null,
  `Strength` varchar(40),
  `Company` varchar(40),
  `StockAvailable` int,
  `Description` varchar(100),
  `Supplier` varchar(40),
  `Discount` int
);

CREATE TABLE `Contains` (
  `MedicineId` int not null ,
  `InvoiceId` int not null,
  `Quantity` int,
  foreign key (MedicineId) references Medicines(id) on delete cascade,
  foreign key (InvoiceId) references Invoice(id) on delete cascade
);

alter table invoice
Add CustomerId int not null,
ADD CONSTRAINT FK_InvoiceCustomerInfo
FOREIGN KEY (CustomerId) REFERENCES CustomerInfo(CustomerId) on delete cascade;

show tables ;

Insert into Medicines 
values(4,'Taminophen','Taminophen',40,'2017-06-15','2017-06-15','Tablet',10,'5mg','Detol',58,'Nice Medicine','B&B',10);
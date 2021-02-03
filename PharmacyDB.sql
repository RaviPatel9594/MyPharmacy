create database PharmacyDB;

use PharmacyDB;

CREATE TABLE `CustomerInfo` (
  `CustomerId` int primary key not null ,
  `Name` varchar(40) not null ,
  `Phone` int not null ,
  `Age` int,
  `PostalAddress` varchar(40)
);

CREATE TABLE `Invoice` (
  `Id` int ,
  `TimeStamp` datetime,
  `Mrp` float,
  `DiscountedTotal` float,
  primary key (Id)
);

CREATE TABLE `Admin` (
  `username` varchar(40),
  `Password` varchar(40)
);

CREATE TABLE `Medicines` (
  `Id` int not null,
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
  `Discount` int,
  primary key(id)
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
FOREIGN KEY (CustomerId) REFERENCES CustomerInfo(CustomerId);

select * from invoice;

alter table invoice
drop foreign key FK_InvoiceCustomerInfo;

drop table invoice;

show tables ;

alter table invoice
ADD CONSTRAINT FK_InvoiceCustomerInfo
FOREIGN KEY (CustomerId) REFERENCES CustomerInfo(CustomerId) on delete cascade;
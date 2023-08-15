USE MASTER;
GO
DROP DATABASE IF EXISTS GMPRS;
GO
CREATE DATABASE GMPRS;
GO
USE GMPRS;
GO

CREATE TABLE Users(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Username VARCHAR(30) UNIQUE NOT NULL,
    Password VARCHAR(30) NOT NULL,
    Firstname VARCHAR(30) NOT NULL,
    Lastname VARCHAR(30) NOT NULL,
    Phone VARCHAR(12) NULL,
    Email VARCHAR(255) NULL,
    IsReviewer BIT NOT NULL DEFAULT(0),
    IsAdmin BIT NOT NULL DEFAULT(0),
);
GO
CREATE TABLE Vendors(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Code VARCHAR(30) UNIQUE NOT NULL,
    Name VARCHAR(30) NOT NULL,
    Address VARCHAR(30) NOT NULL,
    City VARCHAR(30) NOT NULL,
    State VARCHAR(2) NOT NULL,
    Zip VARCHAR(5) NOT NULL,
    Phone VARCHAR(12) NULL,
    Email VARCHAR(255) NULL,
);
GO
CREATE TABLE Products(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    PartNbr VARCHAR(30) UNIQUE NOT NULL,
    Name VARCHAR(30) NOT NULL,
    Price DECIMAL(11,2) NOT NULL DEFAULT(1),
    Unit VARCHAR(30) NOT NULL DEFAULT('Each'),
    PhotoPath VARCHAR(255) NULL,
    VendorID INT NOT NULL FOREIGN KEY REFERENCES Vendors(ID)
);
GO
CREATE TABLE Requests(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Description VARCHAR(80) NOT NULL,
    Justification VARCHAR(80) NOT NULL,
    RejectionReason VARCHAR(80) NULL,
    DeliveryMode VARCHAR(20) NOT NULL DEFAULT('Pickup'),
    Status VARCHAR(10) NOT NULL DEFAULT('NEW') CHECK(STATUS IN('NEW','EDIT','REVIEW','APPROVED','REJECTED')),
    Total DECIMAL(11,2) NOT NULL DEFAULT(0),
    UserID INT NOT NULL FOREIGN KEY REFERENCES Users(ID)
);
GO
CREATE TABLE RequestLine(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    RequestID INT NOT NULL FOREIGN KEY REFERENCES Requests(ID) ON DELETE CASCADE,
    ProductID INT NOT NULL FOREIGN KEY REFERENCES Products(ID),
    Quantity INT NOT NULL DEFAULT(1) CHECK(Quantity>0)
);
GO
--Inserts, these need to be changed, these were added to play along in class
INSERT Users(Username,password,Firstname,Lastname,Phone,Email,IsReviewer,IsAdmin)
Values('TestAdmin','AdminPass','System','Administrator',null,null,0,1),
      ('TestReviewer','ReviewPass','Press','Account',null,null,1,0),
      ('TestUser','UserPass','User','Account','555-555-5555','UserEmail@Domain.com',0,0);
INSERT Vendors(Code,Name,Address,City,State,Zip,Phone,Email)
VALUES('AAA111','TestSeller','50 Test Street','Testington','OH','45215',NULL,NULL)
INSERT Products(PartNbr,Name,VendorID)
VALUES('10304','Test Part',1)
INSERT Requests(Description,Justification,Total,UserID)
VALUES('Test1','Testing',1,1),('Test2','Testing',2,2),('Test3','Testing',3,3)
INSERT RequestLine(RequestID,ProductID,Quantity)
VALUES(1,1,1),(1,1,2),(1,1,3);

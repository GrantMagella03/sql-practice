--create database C41BootCamp;
/*
create table Students(
    ID int PRIMARY KEY IDENTITY(1,1),
    FirstName VarChar(32) NOT NULL,
    LastName VarChar(32) NOT NULL,
    Phone varchar(12),
    Address VarChar(75),
    City VarChar(30),
    State Varchar(2) not null DEFAULT 'OH',
    Zipcode Varchar(5)
);*/
INSERT Students(Firstname, LastName, Phone, Address, city, State, Zipcode)
    Values('Grant','Magella','5138888698', NULL ,'Wyoming','OH','45215');

alter table students
    add Active Bit not null default 1
/*
Create Table Technologies (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Name varchar(30) not null,
    InstructionDays int not null default 5
)*/

Create Table curriculum(
    ID INT PRIMARY KEY IDENTITY(1,1),
    Day INT NOT NULL,
    Topic Varchar(50) NOT NULL,
    TechnologiesID int NOT NULL FOREIGN KEY references Technologies(ID)
)
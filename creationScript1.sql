use master;
go
drop database if exists GM;
go
create database GM;
go
use GM;
go
create table table1 (
    id int not null primary key identity(1,1),
    Name varchar(10)
)
go

insert table1 (name) values('test')
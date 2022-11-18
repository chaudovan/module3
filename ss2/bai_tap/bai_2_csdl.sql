create database QuanLyBanHang;
use QuanLyBanHang;
create table Customer(
cId int auto_increment primary key,
cName varchar(50),
cAge int
);
create table Product(
pId int auto_increment primary key,
pName varchar(50),
pPrice float
);
create table `Order`(
oID int auto_increment primary key,
cID int,
oDate datetime,
oTotal int,
foreign key(cID) references Customer(cId)
);
create table OrderDetail(
oID int,
pID int,
odQTY float,
primary key(oID,pID),
foreign key(oID) references `Order`(oID),
foreign key(pID) references Product(pId)
);
create database Furama;
use Furama;
create table `position`(
id int primary key,
name varchar(45)
);
create table Education_degree(
id int primary key,
name varchar(45)
);
create table division(
id int primary key,
name varchar(45)
);
create table customer_type(
id int primary key,
name varchar(45)
);
create table facility_type(
id int primary key,
name varchar(45)
);
create table rent_type(
id int primary key,
name varchar(45)
);
create table `role`(
role_id int primary key,
role_name varchar(255)
);
create table `user`(
username varchar(255) primary key,
`password` varchar(255)
);
create table user_role(
role_id int,
username varchar(255),
primary key(role_id,username),
foreign key(role_id) references `role`(role_id),
foreign key(username) references `user`(username)
);
create table attach_facility(
id int primary key,
`name` varchar(45),
cost double,
unit varchar(10),
`status` varchar(45)
);
create table customer(
id int

);
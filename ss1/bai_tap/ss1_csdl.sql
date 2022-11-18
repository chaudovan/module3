create database `student-manager`;
use `student-manager`;
create table student(
`id` int primary key,
`name` varchar(40),
`age` int ,
`country` varchar(40)
);
create table class(
`id` int primary key,
`name` varchar(50)
);
create table teacher(
`id` int primary key not null,
`name` varchar(50),
`age` int ,
`country` varchar(40)
);

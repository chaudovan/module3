create database QuanLyDiemThi;
use QuanLyDiemThi;
create table HocSinh(
`MaHS` varchar(20) primary key not null,
`TenHS` varchar(50),
`NgaySinh` datetime,
`Lop` varchar(20),
`GT` varchar(20)
);
create table MonHoc(
`MaMH` varchar(20) primary key not null,
`TenMH` varchar(30)
);
create table BangDiem(
`MaHS` varchar(20),
`MaMH` varchar(20),
`DiemThi` float,
`NgayKT` datetime,
primary key(`MaHS`,`MaMH`),
foreign key (`MaHS`) references HocSinh(`MaHS`),
foreign key (`MaMH`) references MonHoc(`MaMH`)
);
create table GiaoVien(
`MaGV` varchar(40) primary key not null,
`TenGV` varchar(50),
`SDT` int
);
alter table MonHoc add `MaGV` varchar(40);
alter table MonHoc add constraint foreign key(`MaGV`) references GiaoVien(`MaGV`);
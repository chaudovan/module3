create database ss2_bai1;
use ss2_bai1;
create table phieuxuat (
SoPX int auto_increment primary key,
NgayXuat datetime
);
create table vattu (
MaVT int auto_increment primary key,
TenVT varchar(50)
);
create table phieunhap (
SoPN int auto_increment primary key,
NgayNhap datetime
);
create table phieunhap_vattu(
phieunhap_SoPN int,
vattu_MaVT int,
DGNhap float,
SLNhap int,
primary key(vattu_MaVT,phieunhap_SoPN),
foreign key(phieunhap_SoPN) references phieunhap(SoPN),
foreign key(vattu_MaVT) references vattu(MaVT)
);
create table phieuxuat_vattu(
phieuxuat_SoPX int,
vattu_MaVT int,
DGNhap float,
SLNhap int,
primary key(phieuxuat_SoPX,vattu_MaVT),
foreign key(phieuxuat_SoPX) references phieuxuat(SoPX),
foreign key(vattu_MaVT) references vattu(MaVT)
);
create table nhacc(
MaNCC int auto_increment primary key,
TenNCC varchar(50),
DiaChi varchar(50)
);
create table sodt(
id int auto_increment primary key,
nhacc_MaNCC int,
SoDienThoai int,
foreign key(nhacc_MaNCC) references nhacc(MaNCC)
);
create table dondh(
SoDH int auto_increment primary key,
id_MaNCC int,
NgayDH datetime,
foreign key(id_MaNCC) references nhacc(MaNCC)
);
create table dondh_vattu(
id_SoDH int,
id_MaVT int,
primary key(id_SoDH,id_MaVT),
foreign key(id_SoDH) references dondh(SoDH),
foreign key(id_MaVT) references vattu(MaVT)
);
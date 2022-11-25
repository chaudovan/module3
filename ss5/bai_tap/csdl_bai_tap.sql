
-- bước 1
create database demo;
use demo;

-- bước 2
create table products(
id int auto_increment primary key,
productCode varchar(20),
productName varchar(20),
productPrice double,
productAmount double,
productDiscription varchar(20),
productStatus varchar(20)
);

insert into products
values(1,'product01','dt 1',1000,10000,'mô tả','ổn định'),
(2,'product02','dt2',1000,10000,'mô tả','ổn định'),
(3,'product03','dt3',1000,10000,'mô tả','ổn định'),
(4,'product04','dt4',1000,10000,'mô tả','ổn định');

-- bước 3
explain select * from products;
create index i_productCode on products(productCode);

alter table products add index i_product_name_price(productName,productprice);


-- bước 4

create view v_product as
select productCode, productName, productPrice, productStatus from products;

select * from v_product;

update v_product set productCode = 'product1' where productName='dt 1';
drop view v_product;


-- bước 5
-- 5.1  store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure p_select()
begin
 select * from product;
end//
delimiter ;

-- 5.2  store procedure thêm một sản phẩm mới

delimiter //
create procedure p_insert()
begin
 insert into products(productCode,productName,productPrice,productAmount,productDiscription,productStatus)
  values('prodiuct','điện thoại',2000,20000,'mô tả','ổn định');
end//
delimiter ;

-- 5.3  store procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure p_update(IN p_id int)
begin
 update products set productPrice = 1500 where id=p_id;
end//
delimiter ;

-- 5.4 delimiter //
delimiter //
create procedure p_delete(IN p_id int)
begin
  delete from products where id = p_id;
end//
delimiter ;


use quanlybanhang;
insert into customer
values(1,'Minh Quan',10),
(2,'Ngoc Oanh',20),
(3,'Hong Ha',50);
insert into `order`(cID,oDate)
values(1,'2006-3-21'),
(2,'2006-3-23'),
(1,'2006-3-16');
insert into product(pName,pPrice)
values('May Giat',3),
('Tu Lanh',5),
('Dieu Hoa',7),
('Quat',1),
('Bep Dien',2);
insert into orderdetail
values(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3);



-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select oID,oDate,oTotal from `order`;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select c.cName,p.pName from customer c
join `order` o on c.cID = o.cID
join orderdetail od on od.oID = o.oID
join product p on p.pID =od.pID;

-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select c.cName,count(o.oID) as dat_hang from customer c
left join `order` o on c.cID = o.cID
group by c.cName having dat_hang=0;


-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. Giá bán của từng loại được tính = odQTY*pPrice)
select o.oID,o.oDate,sum(od.odQTY *p.pPrice) as tong from `order` o
join orderdetail od on o.oID =od.oID
join product p on od.pID =p.pID
group by o.oID;
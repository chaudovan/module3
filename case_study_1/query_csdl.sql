use furama1;
-- task  2.	Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
select ma_nhan_vien, ho_ten from nhan_vien
where (ho_ten like 'H%' or ho_ten like 'T%' or ho_ten like 'K%') and char_length(ho_ten)<=15;


-- task  3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select * from khach_hang
where(year(curdate())-year(ngay_sinh) between 18 and 50) and (dia_chi like '%Đà Nẵng' or dia_chi like '%Quang Trị');

-- task 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select kh.ma_khach_hang,kh.ho_ten,count(kh.ma_khach_hang) as so_lan from khach_hang kh
join hop_dong hd on kh.ma_khach_hang =hd.ma_khach_hang
join loai_khach lk on kh.ma_loai_khach =lk.ma_loai_khach
where lk.ten_loai_khach='Diamond'
group by kh.ma_khach_hang
order by so_lan;


-- task 5 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
select kh.ma_khach_hang,kh.ho_ten,lk.ten_loai_khach,hd.ma_hop_dong,ten_dich_vu,hd.ngay_lam_hop_dong,hd.ngay_ket_thuc,sum(dv.chi_phi_thue +ifnull(dv_dk.gia*hd_ct.so_luong,0)) as tong_tien from khach_hang kh
left join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
left join hop_dong hd on kh.ma_khach_hang =hd.ma_khach_hang
left join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
left join hop_dong_chi_tiet hd_ct on hd_ct.ma_hop_dong = hd.ma_hop_dong
left join dich_vu_di_kem dv_dk on dv_dk.ma_dich_vu_di_kem = hd_ct.ma_dich_vu_di_kem
group by hd.ma_hop_dong;


-- task 6.	Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).

 select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu from dich_vu dv
 join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
 group by dv.ma_dich_vu having dv.ma_dich_vu not in (
 select dv.ma_dich_vu from dich_vu dv
 join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
 join hop_dong hd on dv.ma_dich_vu = hd.ma_dich_vu
 where (month(hd.ngay_lam_hop_dong) between 1 and 3) and year(hd.ngay_lam_hop_dong) = 2021
 );
 
 -- task 7.	Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021
 
 select dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue,ldv.ten_loai_dich_vu from dich_vu dv
 join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
 join hop_dong hd on hd.ma_dich_vu =dv.ma_dich_vu
 where year(hd.ngay_lam_hop_dong)=2020
 group by dv.ma_dich_vu
 having dv.ma_dich_vu not in(
 select dv.ma_dich_vu from dich_vu dv
 join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
 join hop_dong hd on hd.ma_dich_vu =dv.ma_dich_vu
 where year(ngay_lam_hop_dong)=2021
 );
 
 -- task 8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
-- cách 1

select kh.ho_ten from khach_hang kh
group by kh.ho_ten;

-- cách 2
select distinct kh.ho_ten from khach_hang kh;

-- cách 3

select kh.ho_ten from khach_hang kh 
union
select kh.ho_ten from khach_hang kh;

-- task 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.

select month(ngay_lam_hop_dong),count( month(ngay_lam_hop_dong)) as so_luong_khach_hang from hop_dong
where year(ngay_lam_hop_dong) = 2021
group by month(ngay_lam_hop_dong)
order by month(ngay_lam_hop_dong);


-- task 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).

select hd.ma_hop_dong,hd.ngay_lam_hop_dong,hd.ngay_ket_thuc,hd.tien_dat_coc,ifnull((hd_ct.so_luong),0) as so_luong_dich_vu_di_kem from hop_dong hd
left join hop_dong_chi_tiet hd_ct on hd.ma_hop_dong = hd_ct.ma_hop_dong
left join dich_vu_di_kem dv_dk on dv_dk.ma_dich_vu_di_kem = hd_ct.ma_dich_vu_di_kem
group by hd.ma_hop_dong
order by hd.ma_hop_dong;


-- task 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.


select dv_dk.ma_dich_vu_di_kem,dv_dk.ten_dich_vu_di_kem from dich_vu_di_kem dv_dk
join hop_dong_chi_tiet hd_ct on hd_ct.ma_dich_vu_di_kem = dv_dk.ma_dich_vu_di_kem
join hop_dong hd on hd.ma_hop_dong = hd_ct.ma_hop_dong
join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
where lk.ten_loai_khach like 'Diamond' and (kh.dia_chi like '%Vinh' or kh.dia_chi like '&Quảng Ngãi') ;


-- task 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
select * from hop_dong;
select hd.ma_hop_dong, nv.ho_ten, kh.ho_ten, kh.so_dien_thoai, dv.ten_dich_vu,ifnull(sum(hdct.so_luong),0), hd.tien_dat_coc from nhan_vien nv
join hop_dong hd on hd.ma_nhan_vien = nv.ma_nhan_vien
join khach_hang kh on kh.ma_khach_hang = hd.ma_khach_hang
join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
left join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
where (month(hd.ngay_lam_hop_dong) between 10 and 12) and year(hd.ngay_lam_hop_dong) = 2020
group by hd.ma_hop_dong 
having hd.ma_hop_dong not in(
select hd.ngay_lam_hop_dong from hop_dong hd where (month(hd.ngay_lam_hop_dong) between 1 and 6) and year(hd.ngay_lam_hop_dong)=2021
);


-- task 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).

select dv_dk.ma_dich_vu_di_kem,dv_dk.ten_dich_vu_di_kem,sum(hd_ct.so_luong) as so_luong from dich_vu_di_kem dv_dk
join hop_dong_chi_tiet hd_ct on hd_ct.ma_dich_vu_di_kem = dv_dk.ma_dich_vu_di_kem
join hop_dong hd on hd.ma_hop_dong =hd_ct.ma_hop_dong
group by dv_dk.ma_dich_vu_di_kem
having sum(hd_ct.so_luong) >= all(
select sum(hd_ct.so_luong) from dich_vu_di_kem dv_dk
join hop_dong_chi_tiet hd_ct on hd_ct.ma_dich_vu_di_kem = dv_dk.ma_dich_vu_di_kem
group by dv_dk.ma_dich_vu_di_kem
);


-- task 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).

select hd.ma_hop_dong, ldv.ten_loai_dich_vu, dv_dk.ten_dich_vu_di_kem, count(dv_dk.ma_dich_vu_di_kem) as so_lan_su_dung 
from hop_dong hd join hop_dong_chi_tiet hd_ct on hd_ct.ma_hop_dong = hd.ma_hop_dong
join dich_vu_di_kem dv_dk on dv_dk.ma_dich_vu_di_kem = hd_ct.ma_dich_vu_di_kem
join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
join loai_dich_vu ldv on ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
group by dv_dk.ma_dich_vu_di_kem
having so_lan_su_dung =1
order by hd.ma_hop_dong;


-- task 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.

select nv.ma_nhan_vien, nv.ho_ten, td.ten_trinh_do, bp.ten_bo_phan, nv.so_dien_thoai, nv.dia_chi from nhan_vien nv
join trinh_do td on td.ma_trinh_do = nv.ma_trinh_do
join bo_phan bp on bp.ma_bo_phan = nv.ma_bo_phan
left join hop_dong hd on hd.ma_nhan_vien = nv.ma_nhan_vien
where year(hd.ngay_lam_hop_dong) between 2020 and 2021
group by nv.ma_nhan_vien
having count(hd.ma_nhan_vien)<=3;


-- task 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021

select nv.ma_nhan_vien , nv.ho_ten from nhan_vien nv
where nv.ma_nhan_vien not in(
select nv.ma_nhan_vien from nhan_vien nv
join hop_dong hd on hd.ma_nhan_vien = nv.ma_nhan_vien
where year(hd.ngay_lam_hop_dong) between 2019 and 2021
);

-- task 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
select kh.ma_khach_hang,kh.ho_ten,kh.ma_loai_khach from khach_hang kh
join loai_khach lk on lk.ma_loai_khach = kh.ma_loai_khach
join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
join dich_vu dv on dv.ma_dich_vu = hd.ma_dich_vu
where year(hd.ngay_lam_hop_dong) = 2021 and (ifnull((dv.chi_phi_thue),0) + ifnull((hdct.so_luong*dvdk.gia),0))>1000000 and kh.ma_loai_khach=2
group by kh.ma_khach_hang;

-- task 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).

select ma_khach_hang,ho_ten from khach_hang
where ma_khach_hang in(
select ma_khach_hang from hop_dong
where year(ngay_lam_hop_dong)<2021
);


-- task 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.

select dvdk.ma_dich_vu_di_kem,dvdk.ten_dich_vu_di_kem from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
join hop_dong hd on hd.ma_hop_dong = hdct.ma_hop_dong
where year(hd.ngay_lam_hop_dong)=2020
group by dvdk.ma_dich_vu_di_kem
having sum(hdct.so_luong)>10;


-- task 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.

select nv.ma_nhan_vien, nv.ho_ten, nv.email, nv.so_dien_thoai, nv.ngay_sinh, nv.dia_chi from nhan_vien nv
union
select kh.ma_khach_hang, kh.ho_ten, kh.email, kh.so_dien_thoai, kh.ngay_sinh, kh.dia_chi from khach_hang kh;

-- task 21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.
create view v_nhan_vien as
select nv.* from nhan_vien nv
join hop_dong hd on hd.ma_nhan_vien = nv.ma_nhan_vien
where nv.dia_chi like '%Đà Nẵng' and hd.ngay_lam_hop_dong ='2021-04-25';

-- task 22.	Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.

update v_nhan_vien set dia_chi = replace(dia_chi,'Hải Châu','Liên Chiểu');

-- task 23.	Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.

delimiter //
create procedure sp_xoa_khach_hang(in kh_id int)
begin
delete from khach_hang where ma_khach_hang = kh_id;
end //
delimiter ;


-- task 24.	Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong với yêu cầu sp_them_moi_hop_dong phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.



create database QuanLySinhVien;
use QuanLySinhVien;
create table Class(
id int auto_increment primary key,
ClassName varchar(60) not null,
StartDate datetime not null,
`Status` bit
);
create table Student(
id int auto_increment primary key,
StudentName varchar(30) not null,
Address varchar(50),
Phone varchar(20),
`Status` bit,
ClassID int,
foreign key(ClassID) references Class(id)
);
create table `Subject`(
id int auto_increment primary key,
SubName varchar(30),
Credit  tinyint not null default 1 check(Credit>1),
`Status` bit default 1
);
create table Mark(
id int auto_increment primary key,
SubID int not null ,
StudentID int not null ,
Mark float default 0 check(Mark between 0 and 100),
unique(SubID,StudentID),
foreign key(SubID) references `Subject`(id),
foreign key(StudentID) references Student(id)
);
alter table Mark add ExamTimes tinyint default 1;

-- thêm dữ liệu
insert into Class
values(1,'A1','2008-12-20',1);
insert into Class values(2,'A2','2008-12-22',1),
					(3, 'B3', current_date, 0);
insert into Student(StudentName,Address,Phone,`Status`,ClassID)
values('Hung', 'Ha Noi', '0912113113', 1, 1),
		('Manh', 'HCM', '0123123123', 0, 2);
insert into Student(StudentName,Address,`Status`,ClassID)
values('Hoa', 'Hai phong', 1, 1);
insert into `Subject`
values (1, 'CF', 5, 1),
       (2, 'C', 6, 1),
       (3, 'HDJ', 5, 1),
       (4, 'RDBMS', 10, 1);
insert into Mark (SubID, StudentID, Mark, ExamTimes)
VALUES (1, 1, 8, 1),
       (1, 2, 10, 2),
       (2, 1, 12, 1);
-- truy vấn dữ liệu
select * from student;

-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select * from Student where StudentName like 'H%';

-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select * from Class where month(StartDate) =12 ;

-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select *from `Subject` where Credit between 3 and 5;


-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
set sql_safe_updates =0;
update Student set ClassID =2 where StudentName ='Hung';
select *from Student;
set sql_safe_updates =1;



-- Hiển thị các thông tin: StudentName, SubName, Mark. Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. nếu trùng sắp theo tên tăng dần.

select StudentName,SubName,Mark 
from Mark m join `Subject` s1 on m.SubID =s1.id
join Student s on m.StudentID = s.id
order by Mark desc,s.StudentName;

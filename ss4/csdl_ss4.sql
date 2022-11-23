use quanlysinhvien;
select Address,count(id) as so_luong from student 
group by Address;

select s.id ,s.StudentName,avg(m.Mark) as diem_trung_binh
from student s join mark m on s.id = m.StudentID
group by s.id;

select * from mark;
select s.id ,s.StudentName,avg(m.Mark) as diem_trung_binh
from student s join mark m on s.id = m.StudentID
group by s.id
having avg(m.Mark) >8;

select s.id ,s.StudentName,avg(m.Mark) as diem_trung_binh
from student s join mark m on s.id = m.StudentID
group by s.id
having avg(m.Mark) >=all(select avg(Mark) from mark  group by mark.StudentID);

select * from `subject`;

select sub.*, max(credit) from `subject` sub 
group by sub.id
having max(credit) >=all(select credit from `subject`);


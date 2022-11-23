use quanlysinhvien;


select * from `subject`;
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất.
select sub.*, max(credit) from `subject` sub 
group by sub.id
having max(credit) >=all(select credit from `subject`);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.

select sub.*, max(mark) from `subject` sub join mark m on sub.id = m.SubID
group by sub.id
having max(mark) >=all(select mark from mark);

-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần

select s.*,avg(m.Mark) as DTB from student s join mark m on s.id = m.StudentID
group by s.id
order by avg(m.Mark) desc;
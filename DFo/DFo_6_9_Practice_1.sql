select c.id as courseid , c.name as coursename , d.name as departmentname
from course c
join department d
on c.departmentid = d.id;

select c.id , c.name
from course c
join academicsession a
on c.academicsessionid = a.id
where a.name = 'fall session';

select c.id as courseid , d.name as coursename , d.name as departmentname , scd.id as studentid
from course c
join depatment d
on c.depatmentid = d.id
join studentcoursedetail scd
on scd.courseid = c.id;

select c.id as courseid , d.name as coursename , d.name as departmentname , scd.id as studentid
from course c
join depatment d
on c.depatmentid = d.id
join studentcoursedetail scd
on scd.courseid = c.id
where d.id = 20;

SELECT er.StudentID, er.CourseID, er.ExamID, er.Grade
FROM ExamResult er
WHERE er.CourseID BETWEEN 190 AND 192;

SELECT er.StudentID, er.CourseID, er.ExamID, er.Grade, c.Name AS CourseName
FROM ExamResult er
LEFT JOIN Course c 
ON er.CourseID = c.ID;


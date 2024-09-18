select *
from course
where academicsessionid = (select id from academicsession where name = 'spring session');

select *
from studentcoursedetail
where grade > 95;

SELECT * 
FROM StudentCourseDetail
WHERE Grade BETWEEN 65 AND 70;

SELECT * 
FROM Student
WHERE RegistrationYear > TO_DATE('01-JUN-2012', 'DD-MON-YYYY');

SELECT * 
FROM Course
WHERE DepartmentID IN (10, 30);

SELECT * 
FROM Student
WHERE FirstName LIKE 'J%';

SELECT * 
FROM StudentCourseDetail
WHERE CourseID IN (190, 193);

SELECT * 
FROM Course
WHERE DepartmentID = 30
AND AcademicSessionID = 200;

SELECT * 
FROM Course
WHERE AcademicSessionID NOT IN (200, 300);

SELECT * 
FROM Course
WHERE DepartmentID = 20;

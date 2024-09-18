SELECT * FROM Student;

SELECT StudentID, CourseID, ExamID, Grade
FROM ExamResult;

SELECT StudentID, EligibilityForExam
FROM StudentAttendance
WHERE EligibilityForExam = 'Eligible';

SELECT FacultyID, LoginDateTime
FROM FacultyLoginDetail;

SELECT Name AS DepartmentName, Head
FROM Department;

SELECT StudentID || ': FIRST NAME IS ' || FirstName AS StudentFirstName
FROM Student;

SELECT DISTINCT ExamType
FROM Exam;

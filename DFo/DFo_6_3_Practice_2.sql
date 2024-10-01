alter table Course
add constraint uq_Course_Name unique (Name);

alter table Department
add constraint uq_Department_Name unique (Name);

alter table Student
add constraint uq_Student_Email unique (Email);

alter table Faculty
add constraint uq_Faculty_Email unique (Email);

alter table AcademicSession
add constraint uq_AcademicSession_Name unique (Name);

alter table FacultyLoginDetail
modify (LoginDateTime default SYSDATE);

ALTER TABLE ParentInformation READ ONLY;
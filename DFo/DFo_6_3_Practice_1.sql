CREATE TABLE ParentInformation (
    ID int PRIMARY KEY,
    Parent1FirstName varchar(100) NOT NULL,
    Parent1LastName varchar(100) NOT NULL,
    Parent2FirstName varchar(100) NOT NULL,
    Parent2LastName varchar(100) NOT NULL
);

CREATE TABLE Student (
    ID int primary key,
    FirstName varchar(100) not null,
    LastName varchar(100) not null,
    RegistrationYear int not null,
    Email varchar(100),
    ParentInformationID int,
    foreign key (ParentInformationID) references ParentInformation(ID)
);

create table StudentAttendance(
    StudentID int not null,
    AcademicSessionID int not null,
    NumberOfWorkingDays int not null,
    NumberOfDaysOff int not null,
    EligibilityForExam varchar(100),
    primary key (StudentID , AcademicSessionID),
    foreign key (StudentID) references Student(ID),
    foreign key (AcademicSessionID) references AcademicSession(ID)
);

create table StudentCourseDetail (
    StudentID int not null,
    CourseID int not null,
    Grade varchar(100) not null,
    primary key (StudentID , CourseID),
    foreign key (StudentID) references Student(ID),
    foreign key (CourseID) references Course(ID)
);

create table Course (
    ID int primary key,
    Name varchar(100) not null,
    AcademicSessionID int null,
    DepartmentID not null,
    foreign key (AcademicSessionID) references AcademicSession(ID),
    foreign key (DepartmentID) references Department(ID)
);

create table Online (
    CourseID int primary key,
    LogonID varchar(100) not null,
    Password varchar(100) not null,
    foreign key (CourseID) references Course(ID)
);

create table Seated (
    CourseID int primary key,
    Building varchar(100) not null,
    Room varchar(100) not null,
    DateTime timestamp not null,
    foreign key (CourseID) references Course(ID)
);

create table AcademicSession (
    ID int primary key,
    Name varchar(100) not null
);

create table Department (
    ID int primary key,
    Name varchar(100) not null,
    Head varchar(100) not null
);

create table Faculty (
    ID int primary key,
    FirstName varchar(100) not null,
    LastName varchar(100) not null,
    Email varchar(100),
    DepartmentID int not null,
    FacultyType varchar(100) not null,
    Salary decimal(10,2),
    Insurance varchar(100),
    HourlyRate decimal(10,2),
    check (FacultyType = 'FullTime' and Salary is not null and Insurance is not null or
    FacultyType = 'PartTime' and Salary is null and Insurance is null),
    check (FacultyType = 'PartTime' and HourlyRate is not null or
    FacultyType = 'FullTime' and HourlyRate is null),
    foreign key (DepartmentID) references Department(ID)
);

create table FacultyCourseDetail (
    FacultyID int not null,
    CourseID int not null,
    ContactHours decimal(10,2),
    primary key (FacultyID , CourseID),
    foreign key (FacultyID) references Faculty(ID),
    foreign key (CourseID) references Course(ID)
);

create table FacultyLoginDetail (
    FacultyID int primary key,
    LoginDateTime timestamp not null,
    foreign key (FacultyID) references Faculty(ID)
);

create table ExamResult (
    StudentID int not null,
    CourseID int not null,
    ExamID int not null,
    Grade varchar(100) not null,
    primary key (StudentID , CourseID , ExamID),
    foreign key (StudentID) references Student(ID),
    foreign key (CourseID) references Course(ID),
    foreign key (ExamID) references Exam(ID)
);

create table Exam (
    ID int primary key,
    StartDate date,
    ExamTypeID int,
    foreign key (ExamTypeID) references ExamType(ID)
);

create table ExamType (
    ID int primary key,
    name varchar(100) not null,
    Description varchar(500)
);




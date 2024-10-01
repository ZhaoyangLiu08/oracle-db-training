Try It / Solve It
1. Using the Global Fast Foods database, retrieve the customer''s first name, last name, and address
for the customer who uses ID 456.
select firstname , lastname , address
from globalfastfoods
where id = 456;

2. Show the name, start date, and end date for Global Fast Foods'' promotional item “ballpen and
highlighter” giveaway.
select name , startdate,enddate
from promotionalitem
where giveway = "ballpen and highlighter";

3. Create a SQL statement that produces the following output:
Oldest
The 1997 recording in our database is The Celebrants Live in Concert
select 'The '||year||' recording in our database is '||name as "Oldest"
from recording
ORDER BY year ASC
LIMIT 1;

4. The following query was supposed to return the CD title “Carpe Diem" but no rows were returned.
Correct the mistake in the statement and show the output.
SELECT produce, title
FROM d_cds
WHERE title = 'Carpe Diem' ;

5. The manager of DJs on Demand would like a report of all the CD titles and years of CDs that were
produced before 2000.
select title , year 
from d_cds
where year < 2000;

6. Which values will be selected in the following query?
SELECT salary
FROM employees
WHERE salary < = 5000;
a. 5000
b. 0 - 4999
c. 2500
d. 5

For the next three questions, use the following table information:
TABLE NAME: students
COLUMNS:
studentno NUMBER(6)
fname VARCHAR2(12)
lname VARCHAR(20)
sex CHAR(1)
major VARCHAR2(24)
7. Write a SQL statement that will display the student number (studentno), first name (fname), and
last name (lname) for all students who are female (F) in the table named students.
select studentno , fname , lname
from students
where sex = "F";

8. Write a SQL statement that will display the student number (studentno) of any student who has a
PE major in the table named students. Title the studentno column Student Number.
select studentno as "Student Number"
from students
where major = "PE";

9. Write a SQL statement that lists all information about all male students in the table named
students. 
select*
from students
where sex = "M";

10. Write a SQL statement that will list the titles and years of all the DJs on Demand CDs that were
not produced in 2000.
select title , year 
from d_cds
where year <> 2000;

11. Write a SQL statement that lists the Global Fast Foods employees who were born before 1980
select name 
from employee
where birthyear < 1980;
Try It / Solve It

1. In the example below, assign the employee_id column the alias of “Number.” Complete the SQL
statement to order the result set by the column alias.
SELECT employee_id as "Number", first_name, last_name
FROM employees
order by "Number";

2. Create a query that will return all the DJs on Demand CD titles ordered by year with titles in
alphabetical order by year.
SELECT title, year
FROM d_cds
ORDER BY year ASC, title ASC;

3. Order the DJs on Demand songs by descending title. Use the alias “Our Collection” for the song
title.
SELECT title AS "Our Collection"
FROM songs
ORDER BY title DESC;

4. Write a SQL statement using the ORDER BY clause that could retrieve the information needed.
Do not run the query.
Create a list of students who are in their first year of school. Include the first name, last name,
student ID number, and parking place number. Sort the results alphabetically by student last name
and then by first name. If more than one student has the same last name, sort each first name in Z
to A order. All other results should be in alphabetical order (A to Z).
SELECT firstname, lastname, student_id, parking_place_number
FROM students
WHERE year = 1
ORDER BY lastname ASC, firstname DESC;

5. Write a SQL statement using the employees table and the ORDER BY clause that could retrieve
the information in the following table. Return only those employees with employee_id<125.
DEPARTMENT_ID LAST_NAME MANAGER_ID
90 Kochhar 100
90 King (null)
90 De Haan 100
60 Lorentz 103
60 Hunold 102
60 Ernst 103
50 Mourgos 100
SELECT department_id, lastname, manager_id
FROM employees
WHERE employee_id < 125
ORDER BY department_id ASC, lastname ASC;

Extension Activities
1. Limiting values with the WHERE clause is an example of:
e. Selection

2. You want to sort your CD collection by title, and then by artist. This can be accomplished using:
c. ORDER BY

3. Which of the following are SQL keywords?
a. SELECT
d. FROM

4. Which of the following are true?
a. Multiplication and division take priority over addition.
b. Operators of the same priority are evaluated from left to right.
c. Parentheses can be used to override the rules of precedence.

5. The following query was written:
SELECT DISTINCT last_name
FROM students
c. To select last names without duplicates

6. The following string was created using which SELECT clause?
Abby Rogers is an order taker for Global Fast Foods
d. SELECT first_name ||' ' ||last_name ||' is an '||staff_type||' for Global Fast Foods'

7. Which of the following SELECT clauses will return uppercase column headings?
b. SELECT ID, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE_NUMBER;
d. SELECT id AS ID, last_name AS NAME, address AS ADDRESS, city AS CITY, state AS
STATE, zip AS ZIP, phone_number AS PHONE_NUMBER;

8. Which SELECT statement will always return the last names in alphabetical order?
b. SELECT last_name FROM employees ORDER BY last_name

9. Which SELECT clause will return a column heading for employee_id called “New Employees”?
d. SELECT employee_id AS "New Employees"

10. Examine the following query:
SELECT last_name, job_id, salary
FROM employees
WHERE job_id = 'SA_REP' OR job_id = 'AD_PRES' AND salary >15000;
Which results could not have been returned from this query?
d. Jordan Lim, sales representative, salary 14000

11. Finish this query so it returns all employees whose last names start with “St”.
SELECT last_name
FROM employees
where last_name like 'St%';

12. What salary values will not be returned from this query?
SELECT last_name, first_name, salary
FROM employees
WHERE salary BETWEEN 1900 AND 2100;
salary < 1900 or salary > 2100

13. Correct each WHERE clause:
a. WHERE department_id NOT IN (101,102,103);
b. WHERE last_name = 'King';
c. WHERE start date = '05-May-1998';
d. WHERE salary BETWEEN 5000 AND 7000;
e. WHERE id != 10;

14. SELECT prefix
FROM phone
WHERE prefix BETWEEN 360 AND 425
OR prefix IN (206,253,625)
AND prefix BETWEEN 315 AND 620;
Which of the following values could be returned?
410
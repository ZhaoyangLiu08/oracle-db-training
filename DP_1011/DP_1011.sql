DP_10_1_Practice
Try It / Solve It
3. What DJs on Demand d_play_list_items song_id’s have the same event_id as song_id 45?
select song_id
from d_play_list
where event_id = 
    (select event_id
     from d_play_list
     where song_id = 45);

4. Which events in the DJs on Demand database cost more than event_id = 100?
SELECT event_id, cost
FROM events
WHERE cost > 
    (SELECT cost 
     FROM events 
     WHERE event_id = 100);

5. Find the track number of the song that has the same CD number as “Party Music for All
Occasions.”
SELECT track_number
FROM songs
WHERE cd_number = 
    (SELECT cd_number
     FROM cds
     WHERE cd_title = 'Party Music for All Occasions');

6. List the DJs on Demand events whose theme code is the same as the code for “Tropical.”
SELECT event_id, event_name
FROM events
WHERE theme_code = 
    (SELECT theme_code
     FROM themes
     WHERE theme_name = 'Tropical');

7. What are the names of the Global Fast Foods staff members whose salaries are greater than the
staff member whose ID is 12?
SELECT staff_name
FROM staff
WHERE salary > 
    (SELECT salary
     FROM staff
     WHERE staff_id = 12);

8. What are the names of the Global Fast Foods staff members whose staff types are not the same
as Bob Miller’s?
SELECT staff_name
FROM staff
WHERE staff_type <> 
    (SELECT staff_type
     FROM staff
     WHERE staff_name = 'Bob Miller');

9. Which Oracle employees have the same department ID as the IT department?
SELECT employee_name
FROM employees
WHERE department_id = 
    (SELECT department_id
     FROM departments
     WHERE department_name = 'IT');

10. What are the department names of the Oracle departments that have the same location ID as
Seattle?
SELECT department_name
FROM departments
WHERE location_id = 
    (SELECT location_id
     FROM locations
     WHERE city = 'Seattle');

11. Indicate whether the statement regarding subqueries is True or False.
T a. It is good programming practice to place a subquery on the right side of the comparison
operator.
T b. A subquery can reference a table that is not included in the outer query’s FROM clause.
F c. Single-row subqueries can return multiple values to the outer query.

DP_10_2_Practice
Try It / Solve It
1. Write a query to return all those employees who have a salary greater than that of Lorentz and are
in the same department as Abel.
SELECT employee_name
FROM employees
WHERE salary > 
    (SELECT salary 
     FROM employees 
     WHERE employee_name = 'Lorentz')
AND department_id = 
    (SELECT department_id 
     FROM employees 
     WHERE employee_name = 'Abel');

2. Write a query to return all those employees who have the same job id as Rajs and were hired after
Davies.
SELECT employee_name
FROM employees
WHERE job_id = 
    (SELECT job_id FROM employees WHERE employee_name = 'Rajs')
AND hire_date > 
    (SELECT hire_date FROM employees WHERE employee_name = 'Davies');

3. What DJs on Demand events have the same theme code as event ID = 100?
SELECT event_id, event_name
FROM events
WHERE theme_code = 
    (SELECT theme_code 
     FROM events 
     WHERE event_id = 100);

4. What is the staff type for those Global Fast Foods jobs that have a salary less than those of any
Cook staff-type jobs?
SELECT DISTINCT staff_type
FROM staff
WHERE salary < 
    (SELECT MIN(salary) 
     FROM staff 
     WHERE staff_type = 'Cook');

5. Write a query to return a list of department id’s and average salaries where the department’s
average salary is greater than Ernst’s salary.
SELECT department_id, AVG(salary) AS average_salary
FROM employees
GROUP BY department_id
HAVING AVG(salary) > 
    (SELECT salary FROM employees WHERE employee_name = 'Ernst');

6. Return the department ID and minimum salary of all employees, grouped by department ID,
having a minimum salary greater than the minimum salary of those employees whose department
ID is not equal to 50.
SELECT department_id, MIN(salary) AS minimum_salary
FROM employees
GROUP BY department_id
HAVING MIN(salary) > 
    (SELECT MIN(salary) 
     FROM employees 
     WHERE department_id <> 50);

DP_10_3_Practice
Try It / Solve It
1. What will be returned by a query if it has a subquery that returns a null ?
in any = nothing happened
all = null

2. Write a query that returns jazz and pop songs. Write a multi-row subquery and use the d_songs
and d_types tables. Include the id, title, duration, and the artist name.
SELECT s.song_id, s.title, s.duration, s.artist_name
FROM d_songs s
WHERE s.type_id IN 
    (SELECT type_id 
     FROM d_types 
     WHERE type_name IN ('Jazz', 'Pop'));

3. Find the last names of all employees whose salaries are the same as the minimum salary for any
department.
SELECT last_name
FROM employees
WHERE salary IN 
    (SELECT MIN(salary) 
     FROM employees 
     GROUP BY department_id);

4. Which Global Fast Foods employee earns the lowest salary? Hint: You can use either a single-
row or a multiple-row subquery.
SELECT employee_name
FROM employees
WHERE salary = 
    (SELECT MIN(salary) FROM employees);

5. Place the correct multiple-row comparison operators in the outer query WHERE clause of each of
the following:
a. Which CDs in our d_cds collection were produced before “Carpe Diem” was produced?
WHERE year ______<____ (SELECT year ...
b. Which employees have salaries lower than any one of the programmers in the IT department?
WHERE salary ______<____(SELECT salary ...
c. What CD titles were produced in the same year as “Party Music for All Occasions” or “Carpe
Diem”?
WHERE year ______in____(SELECT year ...
d. What song title has a duration longer than every type code 77 title?
WHERE duration ____> all_____(SELECT duration ...

6. If each WHERE clause is from the outer query, which of the following are true?
__T__a. WHERE size > ANY -- If the inner query returns sizes ranging from 8 to 12, the value 9
could be returned in the outer query.
__F__b. WHERE book_number IN -- If the inner query returns books numbered 102, 105, 437,
and 225 then 325 could be returned in the outer query.
__F__c. WHERE score <= ALL -- If the inner query returns the scores 89, 98, 65, and 72, then 82
could be returned in the outer query.
__T__d. WHERE color NOT IN -- If the inner query returns red, green, blue, black, and then the
outer query could return white.
__F__e. WHERE game_date = ANY -- If the inner query returns 05-Jun-1997, 10-Dec-2002, and
2-Jan-2004, then the outer query could return 10-Sep-2002.

7. The goal of the following query is to display the minimum salary for each department whose
minimum salary is less than the lowest salary of the employees in department 50. However, the
subquery does not execute because it has five errors. Find them, correct them, and run the query.
SELECT department_id, MIN(salary)
FROM employees
GROUP BY department_id
HAVING MIN(salary) < 
    (SELECT MIN(salary)
     FROM employees
     WHERE department_id = 50);

8. Which statements are true about the subquery below?
SELECT employee_id, last_name
FROM employees
WHERE salary =
(SELECT MIN(salary)
FROM employees
GROUP BY department_id);
______ a. The inner query could be eliminated simply by changing the WHERE clause to
WHERE MIN(salary).
______ b. The query wants the names of employees who make the same salary as the smallest
salary in any department.
______ c. The query first selects the employee ID and last name, and then compares that to the
salaries in every department.
___T___ d. This query will not execute.
9. Write a pair-wise subquery listing the last_name, first_name, department_id, and manager_id for
all employees that have the same department_ id and manager_id as employee 141. Exclude
employee 141 from the result set.
SELECT last_name, first_name, department_id, manager_id
FROM employees
WHERE department_id = 
    (SELECT department_id FROM employees WHERE employee_id = 141)
AND manager_id = 
    (SELECT manager_id FROM employees WHERE employee_id = 141)
AND employee_id <> 141;

10. Write a non-pair-wise subquery listing the last_name, first_name, department_id, and manager_id
for all employees that have the same department_ id and manager_id as employee 141.
SELECT last_name, first_name, department_id, manager_id
FROM employees
WHERE (department_id, manager_id) IN 
    (SELECT department_id, manager_id
     FROM employees
     WHERE employee_id = 141);

DP_10_4_Practice
Try It / Solve It
2. Write a query that lists the highest earners for each department. Include the last_name,
department_id, and the salary for each employee.
SELECT last_name, department_id, salary
FROM employees e
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE department_id = e.department_id);

3. Examine the following select statement and finish it so that it will return the last_name,
department_id, and salary of employees who have at least one person reporting to them. So we
are effectively looking for managers only. In the partially written SELECT statement, the WHERE
clause will work as it is. It is simply testing for the existence of a row in the subquery.
SELECT last_name, department_id, salary
FROM employees outer
WHERE 'x' IN (SELECT 'x'
FROM employees inner
WHERE WHERE inner.manager_id = outer.employee_id;
Finish off the statement by sorting the rows on the department_id column.

4. Using a WITH clause, write a SELECT statement to list the job_title of those jobs whose maximum
salary is more than half the maximum salary of the entire company. Name your subquery
MAX_CALC_SAL. Name the columns in the result JOB_TITLE and JOB_TOTAL, and sort the
result on JOB_TOTAL in descending order.
Hint: Examine the jobs table. You will need to join JOBS and EMPLOYEES to display the
job_title.
WITH MAX_CALC_SAL AS (
    SELECT MAX(salary) AS max_salary
    FROM employees)
SELECT j.job_title AS JOB_TITLE, MAX(e.salary) AS JOB_TOTAL
FROM jobs j
JOIN employees e ON j.job_id = e.job_id
GROUP BY j.job_title
HAVING MAX(e.salary) > (SELECT max_salary / 2 FROM MAX_CALC_SAL)
ORDER BY JOB_TOTAL DESC;

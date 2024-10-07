DP_9_1_Practice
Try It / Solve It
1. In the SQL query shown below, which of the following is true about this query?
___TRUE____ a. Kimberly Grant would not appear in the results set.
_______ b. The GROUP BY clause has an error because the manager_id is not listed in the
SELECT clause.
_______ c. Only salaries greater than 16001 will be in the result set.
_______ d. Names beginning with Ki will appear after names beginning with Ko.
_______ e. Last names such as King and Kochhar will be returned even if they don’t have
salaries > 16000.
SELECT last_name, MAX(salary)
FROM employees
WHERE last_name LIKE 'K%'
GROUP BY manager_id, last_name
HAVING MAX(salary) >16000
ORDER BY last_name DESC ;

2. Each of the following SQL queries has an error. Find the error and correct it. Use Oracle
Application Express to verify that your corrections produce the desired results.
a. SELECT manager_id
FROM employees
GROUP BY manager_id
HAVING AVG(salary) < 16000;
b. SELECT cd_number, COUNT(title)
FROM d_cds
WHERE cd_number < 93
GROUP BY cd_number;
c. SELECT MAX(ID), artist AS Artist
FROM d_songs
WHERE duration IN('3 min', '6 min', '10 min')
GROUP BY artist
HAVING MAX(ID) < 50;
d. SELECT loc_type, rental_fee AS Fee
FROM d_venues
WHERE id <100
GROUP BY loc_type, rental_fee
ORDER BY 2;

3. Rewrite the following query to accomplish the same result:
SELECT  MAX(song_id)
FROM d_track_listings
WHERE track IN ( 1, 2, 3);

4. Indicate True or False
__TRUE___ a. If you include a group function and any other individual columns in a SELECT clause,
then each individual column must also appear in the GROUP BY clause.
_____ b. You can use a column alias in the GROUP BY clause.
_____ c. The GROUP BY clause always includes a group function.

5. Write a query that will return both the maximum and minimum average salary grouped by
department from the employees table.
select department , max(avg(salary)) , min(avg(salary))
from employee
group by department;

6. Write a query that will return the average of the maximum salaries in each department for the
employees table.
select department , avg(max(salary)) 
from employee
group by department;

DP_9_2_Practice
Try It / Solve It
1. Within the Employees table, each manager_id is the manager of one or more employees who
each have a job_id and earn a salary. For each manager, what is the total salary earned by all of
the employees within each job_id? Write a query to display the Manager_id, job_id, and total
salary. Include in the result the subtotal salary for each manager and a grand total of all salaries.
SELECT  manager_id,  job_id,  SUM(salary) 
FROM   employees
GROUP BY  ROLLUP(manager_id, job_id);

2. Amend the previous query to also include a subtotal salary for each job_id regardless of the
manager_id.


3. Using GROUPING SETS, write a query to show the following groupings:
• department_id, manager_id, job_id
• manager_id, job_id
• department_id, manager_id
SELECT  department_id , manager_id,  job_id,  SUM(salary) 
FROM   employees
GROUPING SETS (  (department_id, manager_id, job_id), (manager_id, job_id), (department_id, manager_id)  );

DP_9_3_Practice
Try It / Solve It
2. Write one query to return the employee_id, job_id, hire_date, and department_id of all employees
and a second query listing employee_id, job_id, start_date, and department_id from the
job_history table and combine the results as one single output. Make sure you suppress
duplicates in the output.
select emplyee_id , job_id , hire_date , to_date(null) , department_id
from employees
union select emplyee_id , job_id , to_date(null) , start_date , department_id
from job_history;

3. Amend the previous statement to not suppress duplicates and examine the output. How many
extra rows did you get returned and which were they? Sort the output by employee_id to make it
easier to spot.
union all

4. List all employees who have not changed jobs even once. (Such employees are not found in the
job_history table)
employees minus job_history

5. List the employees that HAVE changed their jobs at least once.
job_history minus employees

6. Using the UNION operator, write a query that displays the employee_id, job_id, and salary of ALL
present and past employees. If a salary is not found, then just display a 0 (zero) in its place.
SELECT  employee_id,  job_id,  COALESCE(salary, 0) AS salary
FROM  employees
UNION
SELECT  employee_id,  job_id,  0 AS salary
FROM  job_history;

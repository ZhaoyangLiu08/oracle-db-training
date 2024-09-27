DP_6_1_Practice
Try It / Solve It
Use the Oracle database for problems 1-3.
1. Create a cross-join that displays the last name and department name from the employees and
departments tables.
select last_name ,department_name
from employees cross join departments;

2. Create a query that uses a natural join to join the departments table and the locations table.
Display the department id, department name, location id, and city.
select department_id , department_name , location_id , city
from departmrnts natural join locations;

3. Create a query that uses a natural join to join the departments table and the locations table.
Restrict the output to only department IDs of 20 and 50. Display the department id, department
name, location id, and city.
select department_id , department_name , location_id , city
from departmrnts natural join locations
where department_id in (20,50);

DP_6_2_Practice
Try It / Solve It
Use the Oracle database for problems 1-6.
1. Join the Oracle database locations and departments table using the location_id column. Limit the
results to location 1400 only.
select *
from locations join depatments using (location_id)
where location_id = 1400;

2. Join DJs on Demand d_play_list_items, d_track_listings, and d_cds tables with the JOIN USING
syntax. Include the song ID, CD number, title, and comments in the output.
select song_id , CD_number, title, comments
from d_play_list_items join d_track_listings using (???) join d_cds using (??);

5. Write a statement joining the employees and jobs tables. Display the first and last names, hire
date, job id, job title, and maximum salary. Limit the query to those employees who are in jobs that
can earn more than $12,000.
select first_name, last_name, hire_date, job_id , job_title, maximum_salary
from employees join jobs using (job_id)
where  maximum_salary > 12000;

The following questions use the JOIN...ON syntax:
7. Write a statement that displays the employee ID, first name, last name, manager ID, manager first
name, and manager last name for every employee in the employees table. Hint: this is a self-join.
SELECT e.employee_id, e.first_name, e.last_name, e.manager_id, m.first_name AS manager_first_name, m.last_name AS manager_last_name
FROM employees e
JOIN employees m ON ( e.manager_id = m.employee_id) ;

8. Use JOIN ON syntax to query and display the location ID, city, and department name for all
Canadian locations.
SELECT l.location_id, l.city, d.department_name
FROM locations l
JOIN departments d ON l.location_id = d.location_id
WHERE l.country_id = 'CA';

9. Query and display manager ID, department ID, department name, first name, and last name for all
employees in departments 80, 90, 110, and 190.
SELECT e.manager_id, e.department_id, d.department_name, e.first_name, e.last_name
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.department_id IN (80, 90, 110, 190);

10. Display employee ID, last name, department ID, department name, and hire date for those
employees whose hire date was June 7, 1994.
SELECT e.employee_id, e.last_name, e.department_id, d.department_name, e.hire_date
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.hire_date = '1994-06-07';

DP_6_3_Practice
Try It / Solve It
Use the Oracle database for problems 1-7.
1. Return the first name, last name, and department name for all employees including those
employees not assigned to a department.
select e.first_name, e.last_name, d.department_name
from employees e left outer join departments d on(e.department_id = d.department_id);

2. Return the first name, last name, and department name for all employees including those
departments that do not have an employee assigned to them.
select e.first_name, e.last_name, d.department_name
from employees e right outer join departments d on(e.department_id = d.department_id);

3. Return the first name, last name, and department name for all employees including those
departments that do not have an employee assigned to them and those employees not assigned
to a department.
select e.first_name, e.last_name, d.department_name
from employees e full outer join departments d on(e.department_id = d.department_id);

4. Create a query of the DJs on Demand database to return the first name, last name, event date,
and description of the event the client held. Include all the clients even if they have not had an
event scheduled.
SELECT c.first_name, c.last_name, e.event_date, e.description
FROM clients c
LEFT JOIN events e ON (c.client_id = e.client_id);

5. Using the Global Fast Foods database, show the shift description and shift assignment date even
if there is no date assigned for each shift description.
SELECT s.shift_description, a.shift_assignment_date
FROM shifts s
LEFT JOIN shift_assignments a ON s.shift_id = a.shift_id;


DP_6_4_Practice
Try It / Solve It
For each problem, use the Oracle database.
1. Display the employee’s last name and employee number along with the manager’s last name and
manager number. Label the columns: Employee, Emp#, Manager, and Mgr#, respectively.
SELECT e.last_name AS Employee, e.employee_id AS Emp#, m.last_name AS Manager, m.employee_id AS Mgr#
FROM employees e
JOIN employees m ON (e.manager_id = m.employee_id);

2. Modify question 1 to display all employees and their managers, even if the employee does not
have a manager. Order the list alphabetically by the last name of the employee.
SELECT e.last_name AS Employee, e.employee_id AS Emp#, m.last_name AS Manager, m.employee_id AS Mgr#
FROM employees e
JOIN employees m ON (e.manager_id = m.employee_id)
ORDER BY e.last_name;

3. Display the names and hire dates for all employees who were hired before their managers, along
with their managers’ names and hire dates. Label the columns Employee, Emp Hired, Manager
and Mgr Hired, respectively.
SELECT e.first_name || ' ' || e.last_name AS Employee,  e.hire_date AS "Emp Hired", 
       m.first_name || ' ' || m.last_name AS Manager,   m.hire_date AS "Mgr Hired"
FROM employees e
JOIN employees m ON e.manager_id = m.employee_id
WHERE e.hire_date < m.hire_date;

4. Write a report that shows the hierarchy for Lex De Haans department. Include last name, salary,
and department id in the report.
SELECT last_name, salary, department_id
FROM employees
START WITH first_name = 'Lex' AND last_name = 'De Haan'
CONNECT BY PRIOR employee_id = manager_id;

5. What is wrong in the following statement?
SELECT last_name, department_id, salary
FROM employees
START WITH last_name = 'King'
CONNECT BY PRIOR employee_id = manager_id;

6. Create a report that shows the organization chart for the entire employee table. Write the report
so that each level will indent each employee 2 spaces. Since Oracle Application Express cannot
display the spaces in front of the column, use - (minus) instead.
SELECT LPAD('-', 2 * (LEVEL - 1), '-') || last_name AS Employee,  employee_id,  manager_id,  department_id
FROM employees
START WITH manager_id IS NULL
CONNECT BY PRIOR employee_id = manager_id;

7. Re-write the report from 6 to exclude De Haan and all the people working for him.
AND PRIOR employee_id NOT IN (SELECT employee_id  FROM employees  WHERE last_name = 'De Haan')
AND employee_id NOT IN (SELECT employee_id  FROM employees  WHERE last_name = 'De Haan');
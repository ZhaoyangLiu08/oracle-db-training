Try It / Solve It
Use aliases to make the output more readable.
1. Create a report that shows the Global Fast Foods promotional name, start date, and end date
from the f_promotional_menus table. If there is an end date, temporarily replace it with “end in two
weeks.” If there is no end date, replace it with today’s date.
select name,start_date,nvl2(end_date,"end in two weeks",sysdate)
from f_promotional_menus;

2. Not all Global Fast Foods staff members receive overtime pay. Instead of displaying a null value
for these employees, replace null with zero. Include the employee’s last name and overtime rate in
the output. Label the overtime rate as “Overtime Status”.
SELECT last_name ,NVL(overtime_rate, 0) AS "Overtime Status"
FROM Employees;


3. The manager of Global Fast Foods has decided to give all staff who currently do not earn
overtime an overtime rate of $5.00. Construct a query that displays the last names and the
overtime rate for each staff member, substituting $5.00 for each null overtime value.
SELECT last_name ,NVL(overtime_rate, 5.00) AS "Overtime Rate"
FROM Employees;

4. Not all Global Fast Foods staff members have a manager. Create a query that displays the
employee last name and 9999 in the manager ID column for these employees.
SELECT last_name ,NVL(manager_id, 9999) 
FROM Employees;

5. Which statement(s) below will return null if the value of v_sal is 50?
c. SELECT nullif(v_sal, 50) FROM emp;

6. What does this query on the Global Fast Foods table return?
SELECT COALESCE(last_name, to_char(manager_id)) as NAME
FROM f_staffs;
If the last_name exists, it displays the last_name.
If the last_name is NULL, it displays the manager_id as a string instead.

7.
a. Create a report listing the first and last names and month of hire for all employees in the
EMPLOYEES table (use TO_CHAR to convert hire_date to display the month).
SELECT first_name ,  last_name , TO_CHAR(hire_date, 'Month')
FROM EMPLOYEES;

b. Modify the report to display null if the month of hire is September. Use the NULLIF function.
SELECT first_name ,  last_name , nullif(TO_CHAR(hire_date, 'Month'),'September')
FROM EMPLOYEES;

8. For all null values in the specialty column in the DJs on Demand d_partners table, substitute “No
Specialty.” Show the first name and s
SELECT first_name ,  NVL(specialty, 'No Specialty') 
FROM d_partners;

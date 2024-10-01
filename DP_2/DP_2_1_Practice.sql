Try It / Solve It
1. The manager of Global Fast Foods would like to send out coupons for the upcoming sale. He
wants to send one coupon to each household. Create the SELECT statement that returns the
customer last name and a mailing address.
SELECT DISTINCT last_name, mailing_address
FROM customers;

2. Each statement below has errors. Correct the errors and execute the query in Oracle Application
Express.
a.
SELECT first_name
FROM f_staffs;
b.
SELECT first_name ||" "|| last_name AS "DJs on Demand Clients"
FROM d_clients;
c.
SELECT DISTINCT f_order_lines
FROM quantity;
d.
SELECT order_number
FROM f_orders;

3. Sue, Bob, and Monique were the employees of the month. Using the f_staffs table, create a
SELECT statement to display the results as shown in the Super Star chart.
Super Star
*** Sue *** Sue ***
*** Bob *** Bob ***
*** Monique *** Monique ***
SELECT '*** ' || first_name || ' *** ' || first_name || ' ***' AS "Super Star"
FROM f_staffs
WHERE first_name IN ('Sue', 'Bob', 'Monique');

4. Which of the following is TRUE about the following query?
SELECT first_name, DISTINCT birthdate
FROM f_staffs;
d. No rows will be returned.

5. Global Fast Foods has decided to give all staff members a 5% raise. Prepare a report that
presents the output as shown in the chart.
EMPLOYEE LAST NAME CURRENT SALARY SALARY WITH 5% RAISE
select last_name as "EMPLOYEE LAST NAME",  salary as "CURRENT SALARY", salary * 1.05 as "SALARY WITH 5% RAISE"
from f_staffs;

6. Create a query that will return the structure of the Oracle database EMPLOYEES table. Which
columns are marked “nullable”? What does this mean?

7. The owners of DJs on Demand would like a report of all items in their D_CDs table with the
following column headings: Inventory Item, CD Title, Music Producer, and Year Purchased.
Prepare this report.
SELECT item_id AS "Inventory Item", cd_title AS "CD Title", producer AS "Music Producer", year_purchased AS "Year Purchased"
FROM D_CDs;

8. True -- The following SELECT statement executes successfully:
SELECT last_name, job_id, salary AS Sal
FROM employees;
9. True -- The following SELECT statement executes successfully:
SELECT *
FROM job_grades;

10. There are four coding errors in this statement. Can you identify them?
SELECT employee_id, last_name, salary * 12 as "ANNUAL SALARY"
FROM employees;

11. In the arithmetic expression salary*12 - 400, which operation will be evaluated first?
*12

12. Which of the following can be used in the SELECT statement to return all columns of data in the
Global Fast Foods f_staffs table?
b. *

13. Using SQL to choose the columns in a table uses which capability?
b. projection

14. SELECT last_name AS "Employee". The column heading in the query result will appear as:
c. Employee

15. Which expression below will produce the largest value?
b. SELECT salary* (6 + 100)

16. Which statement below will return a list of employees in the following format?
Mr./Ms. Steven King is an employee of our company.
c. SELECT 'Mr./Ms. '||first_name||' '||last_name ||' '||'is an employee of our company.' AS
"Employees"
FROM employees ;

17. Which is true about SQL statements?
c. Keywords cannot be abbreviated or split across lines.

18. Which queries will return three columns each with UPPERCASE column headings?
b. SELECT DEPARTMENT_ID, LAST_NAME, FIRST_NAME
FROM employees;

19. Which statement below will likely fail?
a. SELCT * FROM employees;
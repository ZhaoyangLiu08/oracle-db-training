DP_8_1_Practice
Try It / Solve It
1. Define and give an example of the seven group functions: AVG, COUNT, MAX, MIN, STDDEV,
SUM, and VARIANCE.

2. Create a query that will show the average cost of the DJs on Demand events. Round to two
decimal places.
select round(avg(cost),2)
from events;

3. Find the average salary for Global Fast Foods staff members whose manager ID is 19.
select avg(salary)
from employees
where manager_id = 19;

4. Find the sum of the salaries for Global Fast Foods staff members whose IDs are 12 and 9.
select sum(salary)
from employees
where id in (12,9);

5. Using the Oracle database, select the lowest salary, the most recent hire date, the last name of
the person who is at the top of an alphabetical list of employees, and the last name of the person
who is at the bottom of an alphabetical list of employees. Select only employees who are in
departments 50 or 60.
SELECT MIN(salary) , MAX(hire_date) , MIN(last_name) , MAX(last_name) 
FROM employees
WHERE department_id IN (50, 60);

6. Your new Internet business has had a good year financially. You have had 1,289 orders this year.
Your customer order table has a column named total_sales. If you submit the following query, how
many rows will be returned?
SELECT sum(total_sales)
FROM orders;
one row for the sum

7. You were asked to create a report of the average salaries for all employees in each division of the
company. Some employees in your company are paid hourly instead of by salary. When you ran
the report, it seemed as though the averages were not what you expected—they were much
higher than you thought! What could have been the cause?
Differentiates between salaried employees and hourly employees

8. Employees of Global Fast Foods have birth dates of July 1, 1980, March 19, 1979, and March 30,
1969. If you select MIN(birthdate), which date will be returned?
March 30, 1969

9. Create a query that will return the average order total for all Global Fast Foods orders from
January 1, 2002, to December 21, 2002.
SELECT AVG(total_sales) 
FROM orders
WHERE order_date BETWEEN '2002-01-01' AND '2002-12-21';

10. What was the hire date of the last Oracle employee hired?
SELECT MAX(hire_date) 
FROM employees

11. In the following SELECT clause, which value returned by the SELECT statement will be larger?
SELECT SUM(operating_cost), AVG(operating_cost)
sum 

12. Refer to the DJs on Demand database D_EVENTS table:
Which code is valid as part of an SQL query?
___I____a. FROM event_date
___V____b. SELECT SUM(cost)
___I____c. SELECT SUM(event_date)
___V____d. SELECT AVG(cost) AS "Expense"
___I____e. WHERE MIN(id) = 100
___I____f. SELECT MAX(AVG(cost))
___V____g. SELECT MIN(event_date)


DP_8_2_Practice
Try It / Solve It
1. How many songs are listed in the DJs on Demand D_SONGS table?
SELECT COUNT(*)
FROM D_SONGS;

2. In how many different location types has DJs on Demand had venues?
SELECT COUNT(DISTINCT location_type) 
FROM D_VENUES;

3. The d_track_listings table in the DJs on Demand database has a song_id column and a
cd_number column. How many song IDs are in the table and how many different CD numbers are
in the table?
SELECT COUNT(song_id) , COUNT(DISTINCT cd_number) 
FROM d_track_listings;

4. How many of the DJs on Demand customers have email addresses?
select count(email)
from customer;

5. Some of the partners in DJs on Demand do not have authorized expense amounts
(auth_expense_amt). How many partners do have this privilege?
select count(auth_expense_amt)
from partner;

6. What values will be returned when the statement below is issued?
SELECT COUNT(shoe_color), COUNT(DISTINCT shoe_color)
FROM shoes;
ID type shoe_color
456 oxford brown
463 sandal tan
262 heel black
433 slipper tan
4,3

7. Create a query that will convert any null values in the auth_expense_amt column on the DJs on
Demand D_PARTNERS table to 100000 and find the average of the values in this column. Round
the result to two decimal places.
SELECT ROUND(AVG(NVL(auth_expense_amt, 100000)), 2) 
FROM D_PARTNERS;

8. Which statement(s) is/are True about the following SQL statement:
SELECT AVG(NVL(selling_bonus, 0.10))
FROM bonuses;
__F___ a. The datatypes of the values in the NVL clause can be any datatype except date data.
__T___ b. If the selling_bonus column has a null value, 0.10 will be substituted.
__T___ c. There will be no null values in the selling_bonus column when the average is calculated.
__F___ d. This statement will cause an error. There cannot be two functions in the SELECT
statement.
9. Which of the following statements is/are TRUE about the following query?
SELECT DISTINCT colors, sizes
FROM items;
_____ a. Each color will appear only once in the result set.
_____ b. Each size will appear only once in the result set.
__T___ c. Unique combinations of color and size will appear only once in the result set.
_____ d. Each color and size combination will appear more than once in the result set.

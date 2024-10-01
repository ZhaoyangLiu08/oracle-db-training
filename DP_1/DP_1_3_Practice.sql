#Try It / Solve It

1. Write a SQL statement that demonstrates projection.
select id from student;

2. Write a query that displays the last_name and email addresses for all the people in the DJs on Demand d_client table. The column headings should appear as “Client” and “Email Address.”
select last_name as Client, email_addresses as "Email Address" from d_client;

3. The manager of Global Fast Foods decided to give all employees at 5%/hour raise + a $.50
bonus/hour. However, when he looked at the results, he couldn't figure out why the new raises
were not as he predicted. Ms. Doe should have a new salary of $7.59, Mr. Miller's salary should
be $11.00, and Monique Tuttle should be $63.50. He used the following query. What should he
have done?
SELECT last_name, (salary *1.05) +.50 as newsalary
FROM f_staffs;

4. Which of the following would be the easiest way to see all rows in the d_songs table?
c. SELECT *

5. If tax = 8.5% * car_cost and license = car_cost * .01%, which value will produce the largest car
payment?
b. Payment = car_cost * 1.25 + 5.00 - (tax - license)

6. In the example below, identify the keywords, the clause(s), and the statement(s):
SELECT employee_id, last_name
FROM employees

7. Label each example as SELECTION or PROJECTION.
a. Please give me Mary Adam''s email address.---SELECTION
b. I would like only the manager_id column, and none of the other columns.---PROJECTION

8. Which of the following statements are true?
c. null * .05 = null

9. How will the column headings be labeled in the following example?
SELECT bear_id bears, color AS Color, age “age”
FROM animals;
c. BEARS, COLOR, age

10. Which of the following words must be in a SELECT statement in order to return all rows?
b. SELECT and FROM
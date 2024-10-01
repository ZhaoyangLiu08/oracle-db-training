Try It / Solve It
1. Execute the two queries below. Why do these nearly identical statements produce two different
results? Name the difference and explain why.
SELECT code, description
FROM d_themes
WHERE code >200 AND description IN('Tropical', 'Football', 'Carnival');
SELECT code, description
FROM d_themes
WHERE code >200 OR description IN('Tropical', 'Football', 'Carnival');
difference between and and or

2. Display the last names of all Global Fast Foods employees who have “e” and “i” in their last
names.
select lastname
from employee
where lastname like '%e%' and lastname like '%i%';

3. I need to know who the Global Fast Foods employees are that make more than $6.50/hour and
their position is not order taker.
SELECT firstname, lastname, position, salary
FROM employees
WHERE salary > 6.50
AND position <> 'order taker';


4. Using the employees table, write a query to display all employees whose last names start with “D”
and have “a” and “e” anywhere in their last name.
select *
from employees
where lastname like 'D%' and lastname like '%a%' and lastname like '%e%';

5. In which venues did DJs on Demand have events that were not in private homes?
SELECT name
FROM venues
WHERE location_type <> 'Private Home';


6. Which list of operators is in the correct order from highest precedence to lowest precedence?
c. NOT, AND, OR

For questions 7 and 8, write SQL statements that will produce the desired output.
7. Who am I?
I was hired by Oracle after May 1998 but before June of 1999. My salary is less than $8000 per
month, and I have an “en” in my last name.
SELECT firstname, lastname, hire_date, salary
FROM employees
WHERE hire_date > '1998-05-31'
AND hire_date < '1999-06-01'
AND salary < 8000
AND lastname LIKE '%en%';

8. What's my email address?
Because I have been working for Oracle since the beginning of 1996, I make more than $9000 per
month. Because I make so much money, I don't get a commission
SELECT email
FROM employees
WHERE hire_date >= '1996-01-01'
AND salary > 9000
AND commission IS NULL;
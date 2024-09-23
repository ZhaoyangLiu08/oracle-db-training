Try It / Solve It
1. Display Oracle database employee last_name and salary for employee_ids between 100 and 102.
Include a third column that divides each salary by 1.55 and rounds the result to two decimal
places.
SELECT last_name, salary, ROUND(salary / 1.55, 2) AS adjusted_salary
FROM employees
WHERE employee_id BETWEEN 100 AND 102;

2. Display employee last_name and salary for those employees who work in department 80. Give
each of them a raise of 5.333% and truncate the result to two decimal places.
SELECT last_name, salary, TRUNC(salary * (1 + 5.333 / 100), 2) AS new_salary
FROM employees
WHERE department_id = 80;

3. Use a MOD number function to determine whether 38873 is an even number or an odd number.
SELECT 
    38873 AS number, 
    CASE 
        WHEN MOD(38873, 2) = 0 THEN 'Even' 
        ELSE 'Odd' 
    END AS number_type
FROM dual;

4. Use the DUAL table to process the following numbers:
845.553 - round to one decimal place
30695.348 - round to two decimal places
30695.348 - round to -2 decimal places
2.3454 - truncate the 454 from the decimal place
select 
    round(845.533,1),
    round(30695.348,2),
    round(30695.348,-2),
    trunc(2.3454,1)
from dual;

5. Divide each employee's salary by 3. Display only those employees' last names and salaries who
earn a salary that is a multiple of 3.
SELECT last_name, salary, salary / 3 AS salary_3
FROM employee
WHERE MOD(salary, 3) = 0;

6. Divide 34 by 8. Show only the remainder of the division. Name the output as EXAMPLE.
SELECT MOD(34, 8) AS EXAMPLE
FROM dual;

7. How would you like your paycheck – rounded or truncated? What if your paycheck was calculated
to be $565.784 for the week, but you noticed that it was issued for $565.78. The loss of .004 cent
would probably make very little difference to you. However, what if this was done to one thousand
people, one hundred thousand people, or one million people! Would it make a difference then?
How much of a difference?
round

1. For each task, choose whether a single-row or multiple row function would be most appropriate:
a. Showing all of the email addresses in upper case letters ---single-row
b. Determining the average salary for the employees in the sales department ---row-function
c. Showing hire dates with the month spelled out (September 1, 2004) ---single-row
d. Finding out the employees in each department that had the most seniority (the earliest hire
date) ---row-function
e. Displaying the employees’ salaries rounded to the hundreds place ---single-row
f. Substituting zeros for null values when displaying employee commissions. ---single-row

2. The most common multiple-row functions are: AVG, COUNT, MAX, MIN, and SUM. Give your own
definition for each of these functions.

3. Test your definitions by substituting each of the multiple-row functions into this query.
SELECT FUNCTION(salary)
FROM employees
Write out each query and its results.

SELECT AVG(salary)
FROM employees;

SELECT COUNT(salary)
FROM employees;

SELECT MAX(salary)
FROM employees;

SELECT MIN(salary)
FROM employees;

SELECT SUM(salary)
FROM employees;
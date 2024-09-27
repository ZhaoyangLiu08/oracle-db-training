Try It / Solve It
In each of the following exercises, feel free to use labels for the converted column to make the output
more readable.
1. List the last names and birthdays of Global Fast Food Employees. Convert the birth dates to
character data in the Month DD, YYYY format. Suppress any leading zeros.
select lastname , to_char(birthdate,'month dd, yyyy')
from employee;

2. Convert January 3, 04, to the default date format 03-Jan-2004.
select to_date('January 3, 04', 'Month DD, YY')
from dual;

3. Format a query from the Global Fast Foods f_promotional_menus table to print out the start_date
of promotional code 110 as: The promotion began on the tenth of February 2004.
SELECT     'The promotion began on the ' || TO_CHAR(Start_Date, 'FMDDth') || ' of ' || TO_CHAR(Start_Date, 'Month YYYY') AS PromotionStart
FROM f_promotional_menus
WHERE promo_code = 110;

4. Convert today’s date to a format such as: “Today is the Twentieth of March, Two Thousand Four”
SELECT 'Today is the ' || TO_CHAR(SYSDATE, 'FMDDth') || ' of ' || TO_CHAR(SYSDATE, 'Month') || ', ' || TO_CHAR(SYSDATE, 'YEAR') AS FormattedDate
FROM dual;

5. List the ID, name, and salary for all Global Fast Foods employees. Display salary with a $ sign
and two decimal places.
SELECT EmployeeID, EmployeeName, '$' || TO_CHAR(Salary, '999,999.00') AS FormattedSalary
FROM GlobalFastFoodEmployees;

6. Ellen Abel is an employee who has received a $2,000 raise. Display her first name and last name,
her current salary, and her new salary. Display both salaries with a $ and two decimal places.
Label her new salary column AS New Salary.
SELECT 
    FirstName, 
    LastName, 
    '$' || TO_CHAR(Salary, '999,999.00') AS CurrentSalary,
    '$' || TO_CHAR(Salary + 2000, '999,999.00') AS "New Salary"
FROM GlobalFastFoodEmployees
WHERE FirstName = 'Ellen' AND LastName = 'Abel';

7. On what day of the week and date did Global Fast Foods’ promotional code 110 Valentine’s
Special begin?
SELECT 
    TO_CHAR(Start_Date, 'Month DD, YYYY') AS StartDate,
    TO_CHAR(Start_Date, 'Day') AS DayOfWeek
FROM f_promotional_menus
WHERE promo_code = 110;

8. Create one query that will convert 25-Dec-2004 into each of the following (you will have to convert
25-Dec-2004 to a date and then to character data):
December 25th, 2004
DECEMBER 25TH, 2004
25th december, 2004
SELECT 
    TO_CHAR(TO_DATE('25-Dec-2004', 'DD-Mon-YYYY'), 'Month DDth, YYYY') AS "Format 1",
    TO_CHAR(TO_DATE('25-Dec-2004', 'DD-Mon-YYYY'), 'FMMONTH DDth, YYYY') AS "Format 2",
    TO_CHAR(TO_DATE('25-Dec-2004', 'DD-Mon-YYYY'), 'DDth FMmonth, YYYY') AS "Format 3"
FROM dual;


9. Create a query that will format the DJs on Demand d_packages columns, low-range and high-
range package costs, in the format $2500.00.
SELECT package_name,
    '$' || TO_CHAR(low_range, '999999.00') AS LowRange,
    '$' || TO_CHAR(high_range, '999999.00') AS HighRange
FROM d_packages;

10. Convert JUNE192004 to a date using the fx format model.
SELECT TO_DATE('JUNE192004', 'FXMonthDDYYYY')
FROM dual;

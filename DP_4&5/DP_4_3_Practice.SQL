1. For DJs on Demand, display the number of months between the event_date of the Vigil wedding
and today’s date. Round to the nearest month.
SELECT ROUND(MONTHS_BETWEEN(SYSDATE, event_date))
FROM events
WHERE event_name = 'Vigil wedding';

2. Display the days between the start of last summer’s school vacation break and the day school
started this year. Assume 30.5 days per month. Name the output “Days.”
SELECT ROUND(MONTHS_BETWEEN(school_start_date, vacation_start_date) * 30.5) AS "Days"
FROM school_calendar;

3. Display the days between January 1 and December 31.
SELECT DATEDIFF('2023-12-31', '2023-01-01') AS days_between
FROM dual;

4. Using one statement, round today’s date to the nearest month and nearest year, and truncate it to
the nearest month and nearest year. Use an alias for each column.
SELECT 
    ROUND(SYSDATE, 'MONTH') AS month_round,
    ROUND(SYSDATE, 'YEAR') AS year_round,
    TRUNC(SYSDATE, 'MONTH') AS month_trunc,
    TRUNC(SYSDATE, 'YEAR') AS year_trunc
FROM dual;

5. What is the last day of the month for June 2005? Use an alias for the output.
SELECT LAST_DAY(TO_DATE('2005-06-01', 'YYYY-MM-DD')) AS last_day_of_june
FROM dual;

6. Display the number of years between the Global Fast Foods employee Bob Miller’s birthday and
today. Round to the nearest year.
SELECT ROUND(MONTHS_BETWEEN(SYSDATE, birthday) / 12) 
FROM employee
WHERE first_name = 'Bob' AND last_name = 'Miller';

7. Your next appointment with the dentist is six months from today. On what day will you go to the
dentist? Name the output, “Appointment.”
SELECT ADD_MONTHS(SYSDATE, 6) AS "Appointment"
FROM dual;

8. The teacher said you have until the last day of this month to turn in your research paper. What day
will this be? Name the output, “Deadline.”
SELECT LAST_DAY(SYSDATE) AS "Deadline"
FROM dual;

9. How many months between your birthday this year and January 1 next year?
SELECT MONTHS_BETWEEN(TO_DATE('2025-01-01', 'YYYY-MM-DD'), TO_DATE('2024-08-24', 'YYYY-MM-DD')) 
FROM dual;

10. What’s the date of the next Friday after your birthday this year? Name the output, “First Friday.”
SELECT NEXT_DAY(TO_DATE('2024-08-24', 'YYYY-MM-DD'), 'FRIDAY') AS "First Friday"
FROM dual;

11. Name a date function that will return a number. 
MONTHS_BETWEEN

12. Name a date function that will return a date.
ADD_MONTHS

Extension Exercises
1. Using DUAL, write a statement that will convert 86.678 to 86.68.
SELECT ROUND(86.678, 2) 
FROM dual;

2. Write a statement that will display the DJs on Demand CD titles for cd_numbers 90 and 91 in
uppercase in a column headed “DJs on Demand Collections.”
SELECT UPPER(cd_title) AS "DJs on Demand Collections"
FROM cds
WHERE cd_number IN (90, 91);

3. Write a statement that will create computer usernames for the DJs on Demand partners. The
usernames will be the lowercase letters of the last name + the uppercase first letter in the first
name. Title the column “User Passwords.” For example, Mary Smythers would be smythersM.
SELECT LOWER(last_name) || UPPER(SUBSTR(first_name, 1, 1)) AS "User Passwords"
FROM partners;

4. Write a statement that will convert “It’s a small world” to “HELLO WORLD.”
SELECT REPLACE('It’s a small world', 'It’s a small world', 'HELLO WORLD') AS new_string
FROM dual;

5. Write a statement that will remove the “fiddle” from “fiddledeedee” and the “dum” from
“fiddledeedum.” Display the result “fiddledeedeedee” in a column with the heading “Nonsense.”

6. Replace every “i” in Mississippi with “$.”
SELECT REPLACE('Mississippi', 'i', '$') 
FROM dual;

7. Using DUAL, convert 5332.342 to 5300.
SELECT ROUND(5332.342, -2) 
FROM dual;

8. Using DUAL, convert 3.14159 to 3.14.
SELECT ROUND(3.14159, 2) 
FROM dual;

9. Using DUAL, convert 73.892 to 73.8.
SELECT trunc(73.892, 1) 
FROM dual;

10. What is the next Friday six months from now? Label the column “Future.”
SELECT NEXT_DAY(ADD_MONTHS(SYSDATE, 6), 'FRIDAY') AS "Future"
FROM dual;

11. What is the date 10 years from now? Label the column “Future.”
SELECT ADD_MONTHS(SYSDATE, 120) AS "Future"
FROM dual;

12. Leap years occur every four years. Remember, 2004 was a leap year. Now create a function that
will show the date of the next leap year as 29-Feb-2008. Label the column “Future.”

13. Write a statement that will find any of the DJs on Demand CD themes that have an “ie” in their
names.
SELECT cd_title
FROM cds
WHERE cd_title LIKE '%ie%';

14. Write a statement that will return only the DJs on Demand CDs with years greater than 2000 but
less than 2003. Display both the title and year.
SELECT cd_title, cd_year
FROM cds
WHERE cd_year BETWEEN 2001 AND 2002;

15. Write a statement that will return the Oracle database employee’s employee ID and his starting
hire dates between January 1, 1997 and today. Display the result ordered from most recently
hired to the oldest.
SELECT employee_id, hire_date
FROM employees
WHERE hire_date BETWEEN TO_DATE('1997-01-01', 'YYYY-MM-DD') AND SYSDATE
ORDER BY hire_date DESC;

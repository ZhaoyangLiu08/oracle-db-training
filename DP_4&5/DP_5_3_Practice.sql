Try It / Solve It
1. From the DJs on Demand d_songs table, create a query that replaces the 2-minute songs with
“shortest” and the 10-minute songs with “longest”. Label the output column “Play Times”.
SELECT DECODE(song_duration, 2, 'shortest',  10, 'longest',  'others') AS "Play Times"
FROM d_songs;

2. Use the Oracle database employees table and CASE expression to decode the department id.
Display the department id, last name, salary, and a column called “New Salary” whose value is
based on the following conditions:
If the department id is 10 then 1.25 * salary
If the department id is 90 then 1.5 * salary
If the department id is 130 then 1.75 * salary
Otherwise, display the old salary.
SELECT  department_id,  last_name,  salary, 
    CASE 
        WHEN department_id = 10 THEN salary * 1.25
        WHEN department_id = 90 THEN salary * 1.5
        WHEN department_id = 130 THEN salary * 1.75
        ELSE salary
    END AS "New Salary"
FROM employees;


3. Display the first name, last name, manager ID, and commission percentage of all employees in
departments 80 and 90. In a 5th column called “Review”, again display the manager ID. If they
don’t have a manager, display the commission percentage. If they don’t have a commission,
display 99999.
SELECT  first_name,  last_name,manager_id, commission_pct,
    COALESCE(TO_CHAR(manager_id), TO_CHAR(commission_pct), '99999') AS "Review"
FROM employees
WHERE department_id IN (80, 90);

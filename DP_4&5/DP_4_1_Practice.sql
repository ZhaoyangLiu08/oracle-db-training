Try It / Solve It
1. Using the three separate words “Oracle,” “Internet,” and
“Academy,” use one command to produce the following output:
The Best Class
Oracle Internet Academy
SELECT 'Oracle' || ' ' || 'Internet' || ' ' || 'Academy' AS "The Best Class"
FROM dual;
  
2. Use the string “Oracle Internet Academy” to produce the following output:
The Net
net
SELECT  SUBSTR('Oracle Internet Academy', INSTR('Oracle Internet Academy', 'net'), 3) AS "The Net"
FROM dual;

3. What is the length of the string “Oracle Internet Academy”?
SELECT LENGTH('Oracle Internet Academy') 
FROM dual;

4. What’s the position of “I” in “Oracle Internet Academy”?
SELECT INSTR('Oracle Internet Academy', 'I') 
FROM dual;
  
5. Starting with the string “Oracle Internet Academy”, pad the string to
create ****Oracle****Internet****Academy****
SELECT '****' || REPLACE('Oracle Internet Academy', ' ', '****') || '****' 
FROM dual;

6. Starting with the string “Oracle Internet Academy”, pad the string to produce:
Oracle$$$Internet$$$Academy
SELECT REPLACE('Oracle Internet Academy', ' ', '$$$')  
FROM dual;

7. Using the string ‘Oracle Internet Academy’, produce the output shown using the REPLACE
function.
The Best Class
Oracle 2013-2014 Academy
SELECT REPLACE('Oracle Internet Academy', 'Internet', '2013-2014')  as "The Best Class"
FROM dual;

8. List the order date and the order total from the Global Fast Foods F_ORDERS table. Name the
order total as TOTAL, and fill in the empty spaces to the left of the order total with $.
SELECT order_date,  LPAD(order_total, 10, '$') AS TOTAL
FROM F_ORDERS;
  
9. Write a query that will output a column called “ADDRESS” which has the following information:
ZOE TWEE 1009 OLIVER AVENUE BOSTON, MA 12889. Use the Global Fast Foods
F_CUSTOMERS table.
SELECT 
  CONCAT(CONCAT(first_name, ' '), last_name) || ' ' ||
  street_address || ' ' ||
  city || ', ' || 
  state || ' ' || 
  zip_code AS ADDRESS
FROM F_CUSTOMERS;
where first_name = 'ZOE' and last_name = 'TWEE"
  
10. Write a query to return the first character of the first name concatenated to the last_name, the
salary, and the department id for employees working in department 20. Give the first expression
an alias of Name. Use the EMPLOYEES table. Change the query to use a substitution variable
instead of the hard coded value 20 for department id. Run the query for department 30 and 50
without changing the original where-clause in your statement.
SELECT   SUBSTR(first_name, 1, 1) || '. ' || last_name AS "Name",  salary,  department_id
FROM   EMPLOYEES
WHERE  department_id = :dept_id;

  
11. Using a substitution variable for the department name, write a query listing department id,
department name, and location id for departments located in the_department_of_your_choice.
Use the DEPARTMENTS table. Note: All substitution variables in OAE are treated as character
strings, so no quotes (‘ ‘) are needed.
SELECT  department_id,   department_name,  location_id
FROM  DEPARTMENTS
WHERE  department_name = :dept_name;
  
12. Write a query that returns all the employee data depending on the month of their hire date. Use
the EMPLOYEES table. The statement should return the month part of the hiredate which is then
compared to an abbreviated month (JAN, FEB, MAR) passed into the query via a substitution
variable.
SELECT *
FROM EMPLOYEES
WHERE TO_CHAR(hire_date, 'MON') = :UPPER(&month_abbr);
  

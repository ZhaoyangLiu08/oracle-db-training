DP_17_1_Practice
Try It / Solve It
4. What commands are necessary to allow Scott access to the database with a password of tiger?
CREATE USER scott IDENTIFIED BY tiger;
GRANT CONNECT TO scott;

5. What are the commands to allow Scott to SELECT from and UPDATE the d_clients table?
GRANT SELECT, UPDATE ON d_clients TO scott;

6. What is the command to allow everybody the ability to view the d_songs table?
GRANT SELECT ON d_songs TO PUBLIC;

7. Query the data dictionary to view the object privileges granted to you the user.
SELECT * 
FROM USER_TAB_PRIVS;

8. What privilege should a user be given to create tables?
GRANT CREATE TABLE TO username;

9. If you create a table, how can you pass along privileges to other users just to view your table?
GRANT SELECT ON table_name TO username;

10. What syntax would you use to grant another user access to your copy_employees table?
GRANT SELECT ON copy_employees TO username;

11. How can you find out what privileges you have been granted for columns in the tables belonging
to others?
SELECT * 
FROM USER_COL_PRIVS;

DP_17_2_Practice
Try It / Solve It
3. Give the ability to another user in your class to look at one of your tables. Give him the right to let
other students have that ability.
GRANT SELECT ON your_table TO user_name WITH GRANT OPTION;

4. You are the DBA. You are creating many users who require the same system privileges. What
should you use to make your job easier?
CREATE ROLE role_name;
GRANT privilege_name TO role_name;
GRANT role_name TO user_name;

5. What is the syntax to accomplish the following?
a. Create a role of manager that has the privileges to select, insert, and update and delete
from the employees table
CREATE ROLE manager;
GRANT SELECT, INSERT, UPDATE, DELETE ON employees TO manager;

b. Create a role of clerk that just has the privileges of select and insert on the employees
table
CREATE ROLE clerk;
GRANT SELECT, INSERT ON employees TO clerk;

c. Grant the manager role to user scott
GRANT manager TO scott;

d. Revoke the ability to delete from the employees table from the manager role
REVOKE DELETE ON employees FROM manager;

DP_17_3_Practice
Try It / Solve It
1. Working with the employees table, and using regular expressions, write a query that returns
employees whose first names start with a “S” (uppercase) followed by either a “t” (lowercase) or
“h” (lowercase).
SELECT *
FROM employees
WHERE REGEXP_LIKE(first_name, '^S[th]');

2. Investigate the LOCATIONS table.
a. Describe the table.
DESC LOCATIONS;

b. Perform a select that returns all rows and all columns of that table.
SELECT *
FROM LOCATIONS;

c. Write a query using regular expressions that removes the spaces in the street_address
column in the LOCATIONS table.
SELECT REGEXP_REPLACE(street_address, ' ', '') AS street_address_no_spaces
FROM LOCATIONS;

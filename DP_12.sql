DP_12_1_Practice
Try It / Solve It
Students should execute DESC tablename before doing INSERT to view the data types for each
column. VARCHAR2 data-type entries need single quotation marks in the VALUES statement.
2. DJs on Demand just purchased four new CDs. Use an explicit INSERT statement to add each CD
to the copy_d_cds table. After completing the entries, execute a SELECT * statement to verify
your work.
CD_Number Title Producer Year
97 Celebrate the Day R & B Inc. 2003
98 Holiday Tunes for All Ages Tunes are Us 2004
99 Party Music Old Town Records 2004
100 Best of Rock and Roll Old Town Records 2004

INSERT INTO copy_d_cds (CD_Number, Title, Producer, Year)
VALUES (97, 'Celebrate the Day', 'R & B Inc.', 2003);

INSERT INTO copy_d_cds (CD_Number, Title, Producer, Year)
VALUES (98, 'Holiday Tunes for All Ages', 'Tunes are Us', 2004);

INSERT INTO copy_d_cds (CD_Number, Title, Producer, Year)
VALUES (99, 'Party Music', 'Old Town Records', 2004);

INSERT INTO copy_d_cds (CD_Number, Title, Producer, Year)
VALUES (100, 'Best of Rock and Roll', 'Old Town Records', 2004);

SELECT * FROM copy_d_cds;

3. DJs on Demand has two new events coming up. One event is a fall football party and the other
event is a sixties theme party. The DJs on Demand clients requested the songs shown in the table
for their events. Add these songs to the copy_d_songs table using an implicit INSERT statement.
ID Title Duration Type_Code
52 Surfing Summer Not known 12
53 Victory Victory 5 min 12

INSERT INTO copy_d_songs
VALUES (52, 'Surfing Summer', 'Not known', 12);

INSERT INTO copy_d_songs
VALUES (53, 'Victory Victory', '5 min', 12);

4. Add the two new clients to the copy_d_clients table. Use either an implicit or an explicit INSERT.
Client_Number First_Name Last_Name Phone Email
6655 Ayako Dahish 3608859030 dahisha@harbor.net
6689 Nick Neuville 9048953049 nnicky@charter.net

INSERT INTO copy_d_clients
VALUES (6655, 'Ayako', 'Dahish', '3608859030', 'dahisha@harbor.net');

INSERT INTO copy_d_clients
VALUES (6689, 'Nick', 'Neuville', '9048953049', 'nnicky@charter.net');

5. Add the new client’s events to the copy_d_events table. The cost of each event has not been
determined at this date.
ID Name Event_
Date
Description Cost Venue_
ID
Package_
Code
Theme_
Code
Client_
Number
110 Ayako
Anniversary
07-Jul-
2004
Party for 50,
sixties
dress,
decorations
245 79 240 6655
115 Neuville
Sports
Banquet
09-
Sep-
2004
Barbecue at
residence,
college
alumni, 100
people
315 87 340 6689

INSERT INTO copy_d_events (ID, Name, Event_Date, Description, Cost, Venue_ID, Package_Code, Theme_Code, Client_Number)
VALUES (110, 'Ayako Anniversary', '2004-07-07', 'Party for 50, sixties dress, decorations', '', 245, 79, 240, 6655);

INSERT INTO copy_d_events (ID, Name, Event_Date, Description, Cost, Venue_ID, Package_Code, Theme_Code, Client_Number)
VALUES (115, 'Neuville Sports Banquet', '2004-09-09', 'Barbecue at residence, college alumni, 100 people', '', 315, 87, 340, 6689);

6. Create a table called rep_email using the following statement:
CREATE TABLE rep_email (
id NUMBER(3) CONSTRAINT rel_id_pk PRIMARY KEY,
first_name VARCHAR2(10),
last_name VARCHAR2(10),
email_address VARCHAR2(10))
Populate this table by running a query on the employees table that includes only those employees
who are REP’s.

CREATE TABLE rep_email (
    id NUMBER(3) CONSTRAINT rel_id_pk PRIMARY KEY,
    first_name VARCHAR2(10),
    last_name VARCHAR2(10),
    email_address VARCHAR2(10)
);

INSERT INTO rep_email (id, first_name, last_name, email_address)
SELECT id, first_name, last_name, email_address
FROM employees
WHERE job_title = 'REP';

DP_12_2_Practice
Try It / Solve It
If any change is not possible, give an explanation as to why it is not possible.
1. Monique Tuttle, the manager of Global Fast Foods, sent a memo requesting an immediate change
in prices. The price for a strawberry shake will be raised from $3.59 to $3.75, and the price for
fries will increase to $1.20. Make these changes to the copy_f_food_items table.

UPDATE copy_f_food_items
SET price = 3.75
WHERE item_name = 'Strawberry Shake' AND price = 3.59;

UPDATE copy_f_food_items
SET price = 1.20
WHERE item_name = 'Fries';

2. Bob Miller and Sue Doe have been outstanding employees at Global Fast Foods. Management
has decided to reward them by increasing their overtime pay. Bob Miller will receive an additional
$0.75 per hour and Sue Doe will receive an additional $0.85 per hour. Update the copy_f_staffs
table to show these new values. (Note: Bob Miller currently doesn’t get overtime pay. What
function do you need to use to convert a null value to 0?)

UPDATE copy_f_staffs
SET overtime_pay = COALESCE(overtime_pay, 0) + 0.75
WHERE first_name = 'Bob' AND last_name = 'Miller';

UPDATE copy_f_staffs
SET overtime_pay = COALESCE(overtime_pay, 0) + 0.85
WHERE first_name = 'Sue' AND last_name = 'Doe';

3. Add the orders shown to the Global Fast Foods copy_f_orders table:
ORDER_NUMBER ORDER_DATE ORDER_TOTAL CUST_ID STAFF_ID
5680 June 12, 2004 159.78 145 9
5691 09-23-2004 145.98 225 12
5701 July 4, 2004 229.31 230 12

INSERT INTO copy_f_orders (ORDER_NUMBER, ORDER_DATE, ORDER_TOTAL, CUST_ID, STAFF_ID)
VALUES (5680, '2004-06-12', 159.78, 145, 9);

INSERT INTO copy_f_orders (ORDER_NUMBER, ORDER_DATE, ORDER_TOTAL, CUST_ID, STAFF_ID)
VALUES (5691, '2004-09-23', 145.98, 225, 12);

INSERT INTO copy_f_orders (ORDER_NUMBER, ORDER_DATE, ORDER_TOTAL, CUST_ID, STAFF_ID)
VALUES (5701, '2004-07-04', 229.31, 230, 12);

4. Add the new customers shown below to the copy_f_customers table. You may already have
added Katie Hernandez. Will you be able to add all these records successfully?
ID FIRST_
NAME
LAST_
NAME
ADDRESS CITY STATE ZIP PHONE_NUMBER
145 Katie Hernandez 92 Chico
Way
Los
Angeles
CA 98008 8586667641
225 Daniel Spode 1923
Silverado
Denver CO 80219 7193343523
230 Adam Zurn 5 Admiral
Way
Seattle WA 4258879009

INSERT INTO copy_f_customers (ID, FIRST_NAME, LAST_NAME, ADDRESS, CITY, STATE, ZIP, PHONE_NUMBER)
VALUES (145, 'Katie', 'Hernandez', '92 Chico Way', 'Los Angeles', 'CA', '98008', '8586667641'),
       (225, 'Daniel', 'Spode', '1923 Silverado', 'Denver', 'CO', '80219', '7193343523'),
       (230, 'Adam', 'Zurn', '5 Admiral Way', 'Seattle', 'WA','', '4258879009');

5. Sue Doe has been an outstanding Global Foods staff member and has been given a salary raise.
She will now be paid the same as Bob Miller. Update her record in copy_f_staffs.

UPDATE copy_f_staffs
SET salary = (SELECT salary FROM copy_f_staffs WHERE first_name = 'Bob' AND last_name = 'Miller')
WHERE first_name = 'Sue' 
AND last_name = 'Doe';

6. Global Fast Foods is expanding their staff. The manager, Monique Tuttle, has hired Kai Kim. Not
all information is available at this time, but add the information shown here.
ID FIRST_NAME LAST_NAME BIRTHDATE SALARY STAFF_TYPE
25 Kai Kim 3-Nov-1988 6.75 Order Taker

INSERT INTO copy_f_staffs (ID, FIRST_NAME, LAST_NAME, BIRTHDATE, SALARY, STAFF_TYPE)
VALUES (25, 'Kai', 'Kim', '1988-11-03', 6.75, 'Order Taker');

7. Now that all the information is available for Kai Kim, update his Global Fast Foods record to
include the following: Kai will have the same manager as Sue Doe. He does not qualify for
overtime. Leave the values for training, manager budget, and manager target as null.

UPDATE copy_f_staffs
SET manager = (SELECT manager FROM copy_f_staffs WHERE first_name = 'Sue' AND last_name = 'Doe'),
    overtime_eligible = 'No', 
    training = NULL,
    manager_budget = NULL,
    manager_target = NULL
WHERE first_name = 'Kai' 
AND last_name = 'Kim';

9. Kim Kai has decided to go back to college and does not have the time to work and go to school.
Delete him from the Global Fast Foods staff. Verify that the change was made.

DELETE FROM copy_f_staffs
WHERE first_name = 'Kai'
AND last_name = 'Kim';

10. Create a copy of the employees table and call it lesson7_emp;
Once this table exists, write a correlated delete statement that will delete any employees from the
lesson7_employees table that also exist in the job_history table.

CREATE TABLE lesson7_emp AS
SELECT * 
FROM employees;

DELETE FROM lesson7_emp
WHERE employee_id IN (
    SELECT employee_id 
    FROM job_history
);

DP_12_3_Practice
2. Currently, the Global Foods F_PROMOTIONAL_MENUS table START_DATE column does not
have SYSDATE set as DEFAULT. Your manager has decided she would like to be able to set the
starting date of promotions to the current day for some entries. This will require three steps:
a. In your schema, Make a copy of the Global Foods F_PROMOTIONAL_MENUS table using the
following SQL statement:
CREATE TABLE copy_f_promotional_menus
AS (SELECT * FROM f_promotional_menus)
b. Alter the current START_DATE column attributes using:
ALTER TABLE copy_f_promotional_menus
MODIFY(start_date DATE DEFAULT SYSDATE)
c. INSERT the new information and check to verify the results.
INSERT a new row into the copy_f_promotional_menus table for the manager’s new
promotion. The promotion code is 120. The name of the promotion is ‘New Customer.’ Enter
DEFAULT for the start date and '01-Jun-2005' for the ending date. The giveaway is a 10%
discount coupon. What was the correct syntax used?
INSERT INTO copy_f_promotional_menus (promotion_code, promotion_name, start_date, end_date, giveaway)
VALUES (120, 'New Customer', DEFAULT, '01-Jun-2005', '10% discount coupon');

3. Allison Plumb, the event planning manager for DJs on Demand, has just given you the following
list of CDs she acquired from a company going out of business. She wants a new updated list of
CDs in inventory in an hour, but she doesn’t want the original D_CDS table changed. Prepare an
updated inventory list just for her.
a. Assign new cd_numbers to each new CD acquired.
b. Create a copy of the D_CDS table called manager_copy_d_cds. What was the correct syntax
used?
c. INSERT into the manager_copy_d_cds table each new CD title using an INSERT statement.
Make up one example or use this data:
20, 'Hello World Here I Am', 'Middle Earth Records', '1998'
What was the correct syntax used?
d. Use a merge statement to add to the manager_copy_d_cds table, the CDs from the original
table. If there is a match, update the title and year. If not, insert the data from the original table.
What was the correct syntax used?

CREATE TABLE manager_copy_d_cds
AS (SELECT * FROM d_cds);

INSERT INTO manager_copy_d_cds (cd_number, title, record_label, release_year)
VALUES (20, 'Hello World Here I Am', 'Middle Earth Records', '1998');

MERGE INTO manager_copy_d_cds mc
USING d_cds d
ON (mc.cd_number = d.cd_number)
WHEN MATCHED THEN
    UPDATE SET mc.title = d.title, mc.release_year = d.release_year
WHEN NOT MATCHED THEN
    INSERT (cd_number, title, record_label, release_year)
    VALUES (d.cd_number, d.title, d.record_label, d.release_year);

4. Run the following 3 statements to create 3 new tables for use in a Multi-table insert statement. All
3 tables should be empty on creation, hence the WHERE 1=2 condition in the WHERE clause.
CREATE TABLE sal_history (employee_id, hire_date, salary)
AS SELECT employee_id, hire_date, salary
FROM employees
WHERE 1=2;
CREATE TABLE mgr_history (employee_id, manager_id, salary)
AS SELECT employee_id, manager_id, salary
FROM employees
WHERE 1=2;
CREATE TABLE special_sal (employee_id, salary)
AS SELECT employee_id, salary
FROM employees
WHERE 1=2;
Once the tables exist in your account, write a Multi-Table insert statement to first select the
employee_id, hire_date, salary, and manager_id of all employees. If the salary is more than
20000 insert the employee_id and salary into the special_sal table. Insert the details of
employee_id, hire_date, and salary into the sal_history table. Insert the employee_id,
manager_id, and salary into the mgr_history table.
You should get a message back saying 39 rows were inserted. Verify you get this message and
verify you have the following number of rows in each table:
Sal_history: 19 rows
Mgr_history: 19 rows
Special_sal: 1

INSERT ALL
    WHEN salary > 20000 THEN
        INTO special_sal (employee_id, salary)
        VALUES (employee_id, salary)
    INTO sal_history (employee_id, hire_date, salary)
    VALUES (employee_id, hire_date, salary)
    INTO mgr_history (employee_id, manager_id, salary)
    VALUES (employee_id, manager_id, salary)
SELECT employee_id, hire_date, salary, manager_id
FROM employees;

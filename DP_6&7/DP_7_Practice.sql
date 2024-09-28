DP_7_1_Practice
Try It / Solve It
1. Create a Cartesian product that displays the columns in the d_play_list_items and the
d_track_listings in the DJs on Demand database.
SELECT *
FROM d_play_list_items
CROSS JOIN d_track_listings;

2. Correct the Cartesian product produced in question 1 by creating an equijoin using a common
column.
SELECT *
FROM d_play_list_items p
JOIN d_track_listings t
ON (p.track_id = t.track_id);

3. Write a query to display the title, type, description, and artist from the DJs on Demand database.
SELECT t.title, t.type,  t.description, a.artist_name
FROM d_track_listings t JOIN d_artists a
ON (t.artist_id = a.artist_id);

4. Rewrite the query in question 3 to select only those titles with an ID of 47 or 48.
SELECT t.title, t.type,  t.description, a.artist_name
FROM d_track_listings t JOIN d_artists a
ON (t.artist_id = a.artist_id)
WHERE t.track_id IN (47, 48);

5. Write a query that extracts information from three tables in the DJs on Demand database, the
d_clients table, the d_events table, and the d_job_assignments table.
SELECT c.client_name, e.event_name, e.event_date, j.job_title,  j.assignment_date
FROM d_clients c
JOIN d_events e
ON (c.client_id = e.client_id)
JOIN d_job_assignments j
ON (e.event_id = j.event_id);

6. Create and execute an equijoin between DJs on Demand tables d_track_listings and d_cds.
Return the song_id and the title only.
SELECT t.song_id,   t.title
FROM d_track_listings t
JOIN d_cds c
ON (t.cd_id = c.cd_id);

7. Mark T for the statements that are true and F for the statements that are false.
__F__ a. A join is a type of query that gets data from more than one table based on columns with
the same name.
__T__ b. To join tables using an equijoin, there must be a common column in both tables and that
column is usually a primary key in one of the tables.
__T__ c. A Cartesian product occurs because the query does not specify a WHERE clause.
__F__ d. Table aliases are required to create a join condition.
__T__ e. If a table alias is used for a table name in the FROM clause, it must be substituted for the
table name throughout the SELECT statement.
__F__ f. Table alias must be only one character in length.
__T__ g. A simple join or inner join is the same as an equijoin.

DP_7_2_Practice
Try It / Solve It
2. Using the Oracle database, create a query that returns the employee last name, salary, and job-
grade level based on the salary. Select the salary between the lowest and highest salaries.
SELECT e.last_name,  e.salary, j.grade_level
FROM employees e
JOIN job_grades j
ON (e.salary BETWEEN j.low_salary AND j.high_salary);

4. Rewrite the following nonequijoin statement using the logical condition operators (AND, OR,
NOT): WHERE a.ranking BETWEEN g.lowest_rank AND g.highest_rank
WHERE a.ranking >= g.lowest_rank AND a.ranking <= g.highest_rank

6. What kind of join would you use if you wanted to find data between a range of numbers?
join on between and

7. You need to produce a report for Global Fast Foods showing customers and orders. A customer
must be included on the report even if the customer has had no orders.
SELECT c.customer_id, c.customer_name, o.order_id, o.order_date, o.order_total
FROM customers c
LEFT outer JOIN orders o
ON (c.customer_id = o.customer_id);

8. Create a query of the Oracle database that shows employee last names, department IDs, and
department names. Include all employees even if they are not assigned to a department.
SELECT e.last_name,  e.department_id,  d.department_name
FROM employees e
LEFT outer JOIN departments d
ON (e.department_id = d.department_id);

9. Modify the query in problem 8 to return all the department IDs even if no employees are assigned
to them.
SELECT e.last_name,  e.department_id,  d.department_name
FROM employees e
right outer JOIN departments d
ON (d.department_id = e.department_id);

10. There are one or more errors in each of the following statements. Describe the errors and correct
them.
a. WHERE e.department_id(+) = d.department_id;
b. SELECT e.employee id, e. last name, d. location id
FROM employees e left outer join departments d 
on( e.department_id = d.department_id);

11. Create a query that will show all CD titles and song IDs in the DJs on Demand database even if
there is no CD number in the track-listings table.
SELECT c.cd_title, t.song_id
FROM cds c
LEFT outer JOIN track_listings t
ON (c.cd_id = t.cd_id);

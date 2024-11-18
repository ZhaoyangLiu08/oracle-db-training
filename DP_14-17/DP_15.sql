DP_15_1_Practice
Try It / Solve It
2. Create a simple view called view_d_songs that contains the ID, title, and artist from the DJs on
Demand table for each “New Age” type code. In the subquery, use the alias “Song Title” for the
title column.
CREATE VIEW view_d_songs AS
SELECT 
    id,
    title AS "Song Title",
    artist
FROM DJs_on_Demand
WHERE type_code = 'New Age';

3. SELECT *
FROM view_d_songs.
What was returned?
id
Song Title (alias for title)
artist

4. REPLACE view_d_songs. Add type_code to the column list. Use aliases for all columns.
CREATE OR REPLACE VIEW view_d_songs AS
SELECT 
    id AS "ID",
    title AS "Song Title",
    artist AS "Artist",
    type_code AS "Type Code"
FROM DJs_on_Demand
WHERE type_code = 'New Age';

5. Jason Tsang, the disk jockey for DJs on Demand, needs a list of the past events and those
planned for the coming months so he can make arrangements for each event’s equipment setup.
As the company manager, you do not want him to have access to the price that clients paid for
their events. Create a view for Jason to use that displays the name of the event, the event date,
and the theme description. Use aliases for each column name.
CREATE VIEW view_events_for_jason AS
SELECT 
    event_name AS "Event Name",
    event_date AS "Event Date",
    theme_description AS "Theme"
FROM Events
WHERE dj = 'Jason Tsang';

6. It is company policy that only upper-level management be allowed access to individual employee
salaries. The department managers, however, need to know the minimum, maximum, and
average salaries, grouped by department. Use the Oracle database to prepare a view that
displays the needed information for department managers.
CREATE VIEW view_department_salaries AS
SELECT 
    department_id AS "Department",
    MIN(salary) AS "Minimum Salary",
    MAX(salary) AS "Maximum Salary",
    AVG(salary) AS "Average Salary"
FROM Employees
GROUP BY department_id;

DP_15_2_Practice
Try It / Solve It
1. Query the data dictionary USER_UPDATABLE_COLUMNS to make sure the columns in the base
tables will allow UPDATE, INSERT, or DELETE. Use a SELECT statement. All table names in the
data dictionary are stored in uppercase.
SELECT 
    TABLE_NAME, 
    COLUMN_NAME, 
    INSERTABLE, 
    UPDATABLE, 
    DELETABLE
FROM USER_UPDATABLE_COLUMNS
WHERE TABLE_NAME IN ('COPY_D_SONGS', 'COPY_D_EVENTS', 'COPY_D_CDS', 'COPY_D_CLIENTS');

2. Use the CREATE or REPLACE option to create a view of all the columns in the copy_d_songs
table called view_copy_d_songs.
CREATE OR REPLACE VIEW view_copy_d_songs AS
SELECT *
FROM copy_d_songs;

3. Use view_copy_d_songs to INSERT the following data into the underlying copy_d_songs table.
Execute a SELECT * from copy_d_songs to verify your DML command. See the graphic.
ID TITLE DURATION ARTIST TYPE_CODE
88 Mello Jello 2 The What 4
INSERT INTO view_copy_d_songs (ID, TITLE, DURATION, ARTIST, TYPE_CODE)
VALUES (88, 'Mello Jello', 2, 'The What', 4);

SELECT * FROM copy_d_songs;

4. Create a view based on the DJs on Demand COPY_D_CDS table. Name the view
read_copy_d_cds. Select all columns to be included in the view. Add a WHERE clause to restrict
the year to 2000. Add the WITH READ ONLY option.
CREATE OR REPLACE VIEW read_copy_d_cds AS
SELECT *
FROM copy_d_cds
WHERE year = 2000
WITH READ ONLY;

5. Using the read_copy_d_cds view, execute a DELETE FROM read_copy_d_cds WHERE
cd_number = 90;
DELETE FROM read_copy_d_cds WHERE cd_number = 90;

6. Use REPLACE to modify read_copy_d_cds. Replace the READ ONLY option with WITH CHECK
OPTION CONSTRAINT ck_read_copy_d_cds. Execute a SELECT * statement to verify that the
view exists.
CREATE OR REPLACE VIEW read_copy_d_cds AS
SELECT *
FROM copy_d_cds
WHERE year = 2000
WITH CHECK OPTION CONSTRAINT ck_read_copy_d_cds;

SELECT * FROM USER_VIEWS WHERE VIEW_NAME = 'READ_COPY_D_CDS';

7. Use the read_copy_d_cds view to delete any CD of year 2000 from the underlying copy_d_cds.
DELETE FROM read_copy_d_cds WHERE year = 2000;

8. Use the read_copy_d_cds view to delete cd_number 90 from the underlying copy_d_cds table.
DELETE FROM read_copy_d_cds WHERE cd_number = 90;

9. Use the read_copy_d_cds view to delete year 2001 records.
DELETE FROM read_copy_d_cds WHERE year = 2001;

10. Execute a SELECT * statement for the base table copy_d_cds. What rows were deleted?
SELECT * FROM copy_d_cds;

DP_15_3_Practice
Try It / Solve It
1. Create a view from the copy_d_songs table called view_copy_d_songs that includes only the title
and artist. Execute a SELECT * statement to verify that the view exists.
CREATE VIEW view_copy_d_songs AS
SELECT 
    title,
    artist
FROM copy_d_songs;

SELECT * FROM view_copy_d_songs;

2. Issue a DROP view_copy_d_songs. Execute a SELECT * statement to verify that the view has
been deleted.
DROP VIEW view_copy_d_songs;

SELECT * FROM view_copy_d_songs;

3. Create a query that selects the last name and salary from the Oracle database. Rank the salaries
from highest to lowest for the top three employees.
SELECT 
    last_name, 
    salary,
    RANK() OVER (ORDER BY salary DESC) AS rank
FROM employees
WHERE RANK() OVER (ORDER BY salary DESC) <= 3;

4. Construct an inline view from the Oracle database that lists the last name, salary, department ID,
and maximum salary for each department. Hint: One query will need to calculate maximum salary
by department ID.
SELECT 
    e.last_name,
    e.salary,
    e.department_id,
    d.max_salary
FROM employees e
JOIN (
    SELECT 
        department_id, 
        MAX(salary) AS max_salary
    FROM employees
    GROUP BY department_id
) d
ON e.department_id = d.department_id;

5. Create a query that will return the staff members of Global Fast Foods ranked by salary from
lowest to highest.
SELECT 
    last_name, 
    salary,
    RANK() OVER (ORDER BY salary ASC) AS rank
FROM employees
WHERE company_name = 'Global Fast Foods';

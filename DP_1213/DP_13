DP_13_1_Practice
Try It / Solve It
2. Write the syntax to create the grad_candidates table.
CREATE TABLE grad_candidates (
    student_id NUMBER(6) PRIMARY KEY,
    last_name VARCHAR2(20) NOT NULL,
    first_name VARCHAR2(20) NOT NULL,
    credits NUMBER(3) NOT NULL,
    graduation_date DATE,
    CONSTRAINT fk_credits FOREIGN KEY (credits) REFERENCES requirements(credits)
);

3. Confirm creation of the table using DESCRIBE.
DESCRIBE grad_candidates;

4. Create a new table using a subquery. Name the new table your last name -- e.g., smith_table.
Using a subquery, copy grad_candidates into smith_table.
CREATE TABLE liu_table AS
SELECT * FROM grad_candidates;

5. Insert your personal data into the table created in question 4.
INSERT INTO liu_table (student_id, last_name, first_name, credits, graduation_date)
VALUES (123456, 'liu', 'zhaoyang', 100, TO_DATE('2024-10-23', 'YYYY-MM-DD'));

6. Query the data dictionary for each of the following:
• USER_TABLES
• USER_OBJECTS
• USER_CATALOG or USER_CAT
In separate sentences, summarize what each query will return.
SELECT * FROM USER_TABLES;
SELECT * FROM USER_OBJECTS;
SELECT * FROM USER_CATALOG;

DP_13_2_Practice
Copyright © 2020, Oracle and/or its affiliates. All rights reserved. Oracle and Java are registered trademarks of Oracle and/or its affiliates. Other names may be trademarks of their respective owners.
2
Try It / Solve It
1. Create tables using each of the listed time-zone data types, use your time-zone and one other in
your examples. Answers will vary.
a. TIMESTAMP WITH LOCAL TIME ZONE
b. INTERVAL YEAR TO MONTH
c. INTERVAL DAY TO SECOND

CREATE TABLE timestamp_local_example (
    event_id NUMBER,
    event_time TIMESTAMP WITH LOCAL TIME ZONE
);

INSERT INTO timestamp_local_example (event_id, event_time)
VALUES (1, TIMESTAMP '2024-10-23 12:00:00 America/New_York');

CREATE TABLE interval_year_to_month_example (
    project_id NUMBER,
    project_duration INTERVAL YEAR TO MONTH
);

INSERT INTO interval_year_to_month_example (project_id, project_duration)
VALUES (1, INTERVAL '2-6' YEAR TO MONTH);

CREATE TABLE interval_day_to_second_example (
    task_id NUMBER,
    task_duration INTERVAL DAY TO SECOND
);

INSERT INTO interval_day_to_second_example (task_id, task_duration)
VALUES (1, INTERVAL '10 5:30:15' DAY TO SECOND); -- 10 days, 5 hours, 30 minutes, 15 seconds

2. Execute a SELECT * from each table
to verify your input.
SELECT * FROM timestamp_local_example;
SELECT * FROM interval_year_to_month_example;
SELECT * FROM interval_day_to_second_example;

3. Give 3 examples of organizations and personal
situations where it is important to know to which time
zone a date-time value refers.
Airline 
Remote work
Global institutions
Stocks

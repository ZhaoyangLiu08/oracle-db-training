DP_14_1_Practice
1. What is a “constraint” as it relates to data integrity?
It ensures that the data stored in the database meets specific conditions or business rules

2. What are the limitations of constraints that may be applied at the column level and at the table
level?
Column-level constraints, Table-level constraints

3. Why is it important to give meaningful names to constraints?
Ease of management

4. Based on the information provided by the owners, choose a datatype for each column. Indicate
the length, precision, and scale for each NUMBER datatype.
Column Name	Data Type	Length/Precision	Nullable	Default
id	NUMBER	Precision: 10	NOT NULL	N/A
name	VARCHAR2	Length: 50	NOT NULL	N/A
date_opened	DATE	N/A	NOT NULL	N/A
address	VARCHAR2	Length: 100	NOT NULL	N/A
city	VARCHAR2	Length: 50	NOT NULL	N/A
zip/postal code	VARCHAR2	Length: 10	NOT NULL	N/A
phone	VARCHAR2	Length: 15	NULLABLE	NULL
email	VARCHAR2	Length: 100	NOT NULL	N/A
manager_id	NUMBER	Precision: 10	NULLABLE	NULL
emergency_contact	VARCHAR2	Length: 100	NULLABLE	NULL

5. Use “nullable” to indicate those columns that can have null values.

6. Write the CREATE TABLE statement for the Global Fast Foods locations table to define the
constraints at the column level.
CREATE TABLE global_locations (
    id NUMBER(10) CONSTRAINT pk_global_locations PRIMARY KEY,
    name VARCHAR2(50) NOT NULL,
    date_opened DATE NOT NULL,
    address VARCHAR2(100) NOT NULL,
    city VARCHAR2(50) NOT NULL,
    zip_postal_code VARCHAR2(10) NOT NULL,
    phone VARCHAR2(15),
    email VARCHAR2(100) CONSTRAINT uq_email UNIQUE NOT NULL,
    manager_id NUMBER(10),
    emergency_contact VARCHAR2(100)
);

7. Execute the CREATE TABLE statement in Oracle Application Express.

8. Execute a DESCRIBE command to view the Table Summary information.
DESCRIBE global_locations;

9. Rewrite the CREATE TABLE statement for the Global Fast Foods locations table to define the
UNIQUE constraints at the table level. Do not execute this statement.
CREATE TABLE global_locations (
    id NUMBER(10) NOT NULL,
    name VARCHAR2(50) NOT NULL,
    date_opened DATE NOT NULL,
    address VARCHAR2(100) NOT NULL,
    city VARCHAR2(50) NOT NULL,
    zip_postal_code VARCHAR2(10) NOT NULL,
    phone VARCHAR2(15),
    email VARCHAR2(100) NOT NULL,
    manager_id NUMBER(10),
    emergency_contact VARCHAR2(100),
    CONSTRAINT pk_global_locations PRIMARY KEY (id),
    CONSTRAINT uq_email UNIQUE (email)
);

DP_14_2_Practice
1. What is the purpose of a
a. PRIMARY KEY
Enforces uniqueness and non-nullability
b. FOREIGN KEY
Ensures referential integrity
c. CHECK CONSTRAINT
Ensures that values in a column meet specific conditions

2. Using the column information for the animals table below, name constraints where applicable at
the table level, otherwise name them at the column level. Define the primary key (animal_id). The
license_tag_number must be unique. The admit_date and vaccination_date columns cannot
contain null values.
animal_id NUMBER(6)
name VARCHAR2(25)
license_tag_number NUMBER(10)
admit_date DATE
adoption_id NUMBER(5),
vaccination_date DATE
CREATE TABLE animals (
    animal_id NUMBER(6) CONSTRAINT pk_animal PRIMARY KEY,
    name VARCHAR2(25),
    license_tag_number NUMBER(10) CONSTRAINT uq_license_tag UNIQUE,
    admit_date DATE NOT NULL,
    adoption_id NUMBER(5),
    vaccination_date DATE NOT NULL
);

3. Create the animals table. Write the syntax you will use to create the table.
4. Enter one row into the table. Execute a SELECT * statement to verify your input. Refer to the
graphic below for input.
ANIMAL_
ID
NAME LICENSE_TAG_
NUMBER
ADMIT_DATE ADOPTION_
ID
VACCINATION_
DATE
101 Spot 35540 10-Oct-2004 205 12-Oct-2004
INSERT INTO animals (animal_id, name, license_tag_number, admit_date, adoption_id, vaccination_date)
VALUES (101, 'Spot', 35540, TO_DATE('10-Oct-2004', 'DD-Mon-YYYY'), 205, TO_DATE('12-Oct-2004', 'DD-Mon-YYYY'));

SELECT * FROM animals;

5. Write the syntax to create a foreign key (adoption_id) in the animals table that has a
corresponding primary- key reference in the adoptions table. Show both the column-level and
table-level syntax. Note that because you have not actually created an adoptions table, no
adoption_id primary key exists, so the foreign key cannot be added to the animals table.
CREATE TABLE animals (
    animal_id NUMBER(6) CONSTRAINT pk_animal PRIMARY KEY,
    name VARCHAR2(25),
    license_tag_number NUMBER(10) CONSTRAINT uq_license_tag UNIQUE,
    admit_date DATE NOT NULL,
    adoption_id NUMBER(5) CONSTRAINT fk_adoption REFERENCES adoptions(adoption_id),
    vaccination_date DATE NOT NULL
);
CREATE TABLE animals (
    animal_id NUMBER(6) CONSTRAINT pk_animal PRIMARY KEY,
    name VARCHAR2(25),
    license_tag_number NUMBER(10) CONSTRAINT uq_license_tag UNIQUE,
    admit_date DATE NOT NULL,
    adoption_id NUMBER(5),
    vaccination_date DATE NOT NULL,
    CONSTRAINT fk_adoption FOREIGN KEY (adoption_id) REFERENCES adoptions(adoption_id)
);

6. What is the effect of setting the foreign key in the ANIMAL table as:
a. ON DELETE CASCADE
b. ON DELETE SET NULL
adoption_id column set to NULL

DP_14_3_Practice
2. Since the tables are copies of the original tables, the integrity rules are not passed onto the new
tables; only the column datatype definitions remain. You will need to add a PRIMARY KEY
constraint to the copy_d_clients table. Name the primary key copy_d_clients_pk . What is the
syntax you used to create the PRIMARY KEY constraint to the copy_d_clients.table?
ALTER TABLE copy_d_clients
ADD CONSTRAINT copy_d_clients_pk PRIMARY KEY (client_number);

3. Create a FOREIGN KEY constraint in the copy_d_events table. Name the foreign key
copy_d_events_fk. This key references the copy_d_clients table client_number column. What is
the syntax you used to create the FOREIGN KEY constraint in the copy_d_events table?
ALTER TABLE copy_d_events
ADD CONSTRAINT copy_d_events_fk FOREIGN KEY (client_number)
REFERENCES copy_d_clients(client_number);

4. Use a SELECT statement to verify the constraint names for each of the tables. Note that the
tablenames must be capitalized.
SELECT constraint_name, table_name, constraint_type
FROM user_constraints
WHERE table_name IN ('COPY_D_CLIENTS', 'COPY_D_EVENTS');
a. The constraint name for the primary key in the copy_d_clients table is _______________.
b. The constraint name for the foreign key in the copy_d_events table is _______________.
5. Drop the PRIMARY KEY constraint on the copy_d_clients table. Explain your results.
ALTER TABLE copy_d_clients
DROP CONSTRAINT copy_d_clients_pk;

6. Add the following event to the copy_d_events table. Explain your results.
ID NAME EVENT_DATE DESCRIPTION COST VENUE
_ID
PACKAGE_
CODE
THEME_
CODE
CLIENT_
NUMBER
140 Cline
Bas
Mitzvah
15-Jul-2004 Church and
Private Home
formal
4500 105 87 77 7125
INSERT INTO copy_d_events (id, name, event_date, description, cost, venue_id, package_code, theme_code, client_number)
VALUES (140, 'Cline Bas Mitzvah', TO_DATE('15-Jul-2004', 'DD-Mon-YYYY'), 'Church and Private Home formal', 4500, 105, 87, 77, 7125);

7. Create an ALTER TABLE query to disable the primary key in the copy_d_clients table. Then add
the values from #6 to the copy_d_events table. Explain your results.
ALTER TABLE copy_d_clients
DISABLE CONSTRAINT copy_d_clients_pk;

8. Repeat question 6: Insert the new values in the copy_d_events table. Explain your results.
9. Enable the primary-key constraint in the copy_d_clients table. Explain your results.
ALTER TABLE copy_d_clients
ENABLE CONSTRAINT copy_d_clients_pk;

10. If you wanted to enable the foreign-key column and reestablish the referential integrity between
these two tables, what must be done?
ALTER TABLE copy_d_events
DROP CONSTRAINT copy_d_events_fk;

ALTER TABLE copy_d_events
ADD CONSTRAINT copy_d_events_fk FOREIGN KEY (client_number)
REFERENCES copy_d_clients(client_number);

11. Why might you want to disable and then re-enable a constraint?
12. Query the data dictionary for some of the constraints that you have created. How does the data
dictionary identify each constraint type?
SELECT constraint_name, constraint_type, table_name, status
FROM user_constraints
WHERE table_name IN ('COPY_D_CLIENTS', 'COPY_D_EVENTS');

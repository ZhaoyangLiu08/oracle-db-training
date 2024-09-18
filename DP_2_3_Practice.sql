Try It / Solve It

1. Display the first name, last name, and salary of all Global Fast Foods staff whose salary is
between $5.00 and $10.00 per hour.
select firstname , lastname , salary
from staff
where salary between 5 and 10;

2. Display the location type and comments for all DJs on Demand venues that are Private Home.
SELECT location_type, comments
FROM venues
WHERE  location_type = 'Private Home';

3. Using only the less than, equal, or greater than operators, rewrite the following query:
SELECT first_name, last_name
FROM f_staffs
WHERE salary >= 20.00 and salary <= 60.00;

4. Create a list of all the DJs on Demand CD titles that have “a” as the second letter in the title.
SELECT title
FROM d_cds
WHERE  title LIKE '_a%';

5. Who are the partners of DJs on Demand who do not get an authorized expense amount?
SELECT partner_name
FROM partners
WHERE authorized_expense_amount IS NULL;


6. Select all the Oracle database employees whose last names end with “s”. Change the heading of
the column to read Possible Candidates.
select lastname as "Possible Candidates"
from employee
where lastname like '%s';

7. Which statement(s) are valid?
c. WHERE quantity IS NULL;

8. Write a SQL statement that lists the songs in the DJs on Demand inventory that are type code 77,
12, or 1
select *
from d_cds
where type in (77,12,1);
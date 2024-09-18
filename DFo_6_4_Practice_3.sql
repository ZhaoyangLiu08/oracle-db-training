alter table FacultyLoginDetail
add Detail VARCHAR2(50);

update FacultyLoginDetail
set Detail = 'test1'
where LoginDateTime = TO_TIMESTAMP('01-JUN-17 05.10.39.000000 PM', 'DD-MON-YY HH.MI.SSXFF AM');

update FacultyLoginDetail
set Detail = 'test2'
where LoginDateTime = TO_TIMESTAMP('01-JUN-17 05.13.21.000000 PM', 'DD-MON-YY HH.MI.SSXFF AM');
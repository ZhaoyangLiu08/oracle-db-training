insert into Faculty
values (800,'JILL','MILLER','JMILL@SCHOOL.EDU',20,'FullTime',10000,'HEALTH',null);

insert into Faculty
values (810,'JAMES','BORG','JBORG@SCHOOL.EDU',10,'FullTime',30000,'HEALTH,DENTAL',null);

insert into Faculty
values (820,'LYNN','BROWN','LBROWN@SCHOOL.EDU',30,'PartTime',null,null,50);

insert into Faculty
values (830,'ARTHUR','SMITH','ASMITH@SCHOOL.EDU',10,'PartTime',null,null,40);

insert into Faculty
values (840,'SALLY','JONES','SJONES@SCHOOL.EDU',40,'FullTime',50000,'HEALTH,DENTAL,VISION',null);

alter table FacultyLoginDetail
drop primary key;

insert into FacultyLoginDetail
values (800,to_timestamp('01-JUN-17 05.10.39.000000 PM','DD-MON-YY HH.MI.SSXFF AM'));

insert into FacultyLoginDetail
values (800,to_timestamp('01-JUN-17 05.13.15.000000 PM','DD-MON-YY HH.MI.SSXFF AM'));

insert into FacultyLoginDetail
values (810,to_timestamp('01-JUN-17 05.13.21.000000 PM','DD-MON-YY HH.MI.SSXFF AM'));

insert into FacultyLoginDetail
values (840,to_timestamp('01-JUN-17 05.13.26.000000 PM','DD-MON-YY HH.MI.SSXFF AM'));

insert into FacultyLoginDetail
values (820,to_timestamp('01-JUN-17 05.13.31.000000 PM','DD-MON-YY HH.MI.SSXFF AM'));

insert into FacultyLoginDetail
values (830,to_timestamp('01-JUN-17 05.13.36.000000 PM','DD-MON-YY HH.MI.SSXFF AM'));
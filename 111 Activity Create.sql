CREATE DATABASE MKs121HDonovan
GO

use MKs121HDonovan

Create table Student(
StudID		integer		primary key,
StudFName	varchar(15),
StudLName	varchar(20),
)
Create table Unit(
UnitID		varchar(10)	primary key,
UnitName	varchar(100),
)
Create table Enrolment(
EnrolID		integer		primary key,
EnrolSem	integer,
EnrolYear	integer,
Result		varchar(20),
StudID		integer		FOREIGN KEY REFERENCES Student(StudID),
UnitID		varchar(10)	FOREIGN KEY REFERENCES Unit(UnitID),
)

/*FOREIGN KEY REFERENCES Persons(PersonID)*/

Insert into Student
(StudID, StudFName, StudLName)
values(1,'Donald','Duck'),
(2,'Daisy','Duck'),
(3,'Tom','Cruise'),
(4,'Cindi','Lauper')

Insert into Unit
(UnitID, UnitName)
values ('ICTDBS403','Create basic databases'),
('ICTPRG402','Apply query language'),
('ICTPRG425','Use structured query language'),
('ICTPRG414','Apply introductory programming skills in another language'),
('ICTPRG418','Apply intermediate programming skills in another language')

Insert into Enrolment
(EnrolID, EnrolSem, EnrolYear, Result, StudID, UnitID)
values (1,1,2017,null,1,'ICTDBS403'),
(2,2,2016,'competent',3,'ICTPRG418'),
(3,1,2017,'not yet competent',2,'ICTPRG425'),
(4,2,2016,'competent',4,'ICTPRG402'),
(5,1,2017,null,3,'ICTPRG425')

/*Queries from your tables
Execute the following queries from your tables:*/
/*Show all records from student*/
Select *
From Student

/*Show all records from unit*/
Select *
From Unit

/*Show all records from enrolment*/
Select *
From Enrolment

/*Show the names of all students enrolled in semester 1 2017*/

Select *
from Student, Enrolment
where Enrolment.studID=Student.StudID and Enrolment.EnrolSem=1 and Enrolment.EnrolYear=2017

/*Add the following data to the student table:*/

Insert into Student
(StudID, StudFName, StudLName)
values (5,'Reece','Witherspoon'),
(6,'Danny','De Vito'),
(7,'James','Cagney'),
(8,'Daniel','O''Herlihy'),
(9,'Peter','O''Toole')

/*Note – SQL gets confused with a single quote in a name like O’Toole, as it guesses that the quote is the ending of the string. Enter O'Toole in your SQL code as O''Toole – 2 single quotes inside your quotes around the name. It will go in as only 1 single quote in the middle of the name.
Add the following data into the Unit table:*/

Insert into Unit
(UnitID, UnitName)
values ('ICTICT418','Contribute to copyright, ethics and privacy in an ICT environment'),
('ICTICT417','Identify, evaluate and apply current industry-specific technologies to meet industry standards')

/*Add the following data into the Enrolment table. */
Insert into Enrolment
(EnrolID, EnrolSem, EnrolYear, Result, StudID, UnitID)
values (5,2,2016,null,5,'ICTICT418'),
(6,2,2016,null,12,'ICTICT418'),
(7,1,2017,'competent',7,'ICTICT411')

/*Note that if your tables are designed correctly you should get some errors here. Why? (see error below, also foreign keys were wrong.
Correct the errors in the data and reenter it.*/

/*Msg 2627, Level 14, State 1, Line 90
Violation of PRIMARY KEY constraint 'PK__Enrolmen__605C73764D542E92'. Cannot insert duplicate key in object 'dbo.Enrolment'. The duplicate key value is (5).
The statement has been terminated.*/

Insert into Enrolment
(EnrolID, EnrolSem, EnrolYear, Result, StudID, UnitID)
values (6,2,2016,null,5,'ICTPRG418'),
(7,2,2016,null,6,'ICTPRG418'),
(8,1,2017,'competent',7,'ICTICT417')

/*I had to change EnrolID, StudID and UnitID data to make it work... in the real world you would want to make sure the data was actually correct!!*/
/*Relating tables
Examine the following tables in the MK database:
Products
Suppliers
You may wish to do a select * on each table (use a new query window for each select on each table so that you can jump easily between the windows. Or you can examine the primary and foreign keys.
There are four records in the Suppliers table, and nine in the Products table.*/

use mk

Select *
From Products

Select *
From Suppliers


/*Write a query to display the tables joined appropriately, telling SQL to make sure that the Primary Key 
from the Suppliers table must be equal to the Foreign Key from the Products table. 
How many records display? Hint – there should be as many records as the largest of the 2 tables, in this case 9 records.*/

Select *
From Products, Suppliers
where Products.SuppID = Suppliers.SuppID

/*or can be this*/

Select *
From Suppliers
Inner Join Products on Products.SuppID = Suppliers.SuppID

/*Now write a query that does not tell SQL how to link the 2 tables. 
How many records display? Hint – there should be one record from each table displayed against every record from the other table, 
so 9 x 4 means that there should be 36 records. 
You are also being given garbage – Harry’s hammers ONLY supply hammers – 
yet in this last example they are also supplying every other type of tool.*/

Select *
From Products, Suppliers


/*Bridging table
Create the following 2 tables in your database:*/

Use MKs121HDonovan

Create table Fishing_Location(
LocaName		varchar(30)		primary key,
LocaDescr		varchar(100),
LocaDateCreat		datetime,
)

Create table Fish(
FishName		varchar(12)	primary key,
FishScientName		varchar(50),
FishDescr		varchar(50),
FishDateCreat		datetime,
)

/*Enter the following data into the fish table*/

Insert into Fish
(FishName, FishScientName, FishDescr,FishDateCreat)
values('carp','cyprinus carpio','imported','2013-01-05'),
('herring','clupea pallasii','northern blue','2014-05-12'),
('mullet','mugil cephalis','wavy fins','2014-10-19')



/*Enter the following data into the Fishing_location table*/


Insert into Fishing_Location
(LocaName, LocaDescr, LocaDateCreat)
values('Cronulla Pier','Ferry wharf in Gunamatta Bay','2014-06-9'),	
('Bonnet Bay','southern-most groine','2015-07-12'),
('Como Baths','western rocks past Baths','2015-09-19'),
('Hallidays Point','southern rocks past pool','2015-10-21')

/*Now create a bridging table called Fish_Sightings. 
It should have its own primary key (use an integer), and the foreign keys of both the other tables. 
Enter some data that indicates which fish were seen or caught at which location.

A bridging table is simply a normal table that creates a link between two other tables that are related but dont share common fields */

Create table Fish_Sightings(
FishSightingsID		integer		primary key,
FishName		varchar(12)		FOREIGN KEY REFERENCES Fish(FishName),
LocaName		varchar(30)	FOREIGN KEY REFERENCES Fishing_location(LocaName),
FishSightingsDescr		varchar(50),
FishSightingsDate		datetime,
)
/*Lets insert random data for this table*/
Insert into Fish_Sightings
(FishSightingsID, FishName, LocaName,FishSightingsDescr,FishSightingsDate)
values(1,'carp','Bonnet Bay','lots around','2016-10-21')


/*Alter tables
Using the database you created last week, make the following modifications to the tables:*/
Use MKs121HDonovan
/*Add columns for street, suburb, state and phone to the Student table. Pick appropriate datatypes.*/
ALTER TABLE Student
ADD Street varchar(50), Suburb varchar(30), State varchar(15), Phone varchar(15)

/*If you need to remove columns do it like this*/
ALTER TABLE Student
Drop Column street, Suburb, State, Phone

/*Change every student’s state to NSW.*/
update Student
set state='NSW'

/*Add addresses and phone numbers for each student (make them up).*/

Update Student
set Street='1 Fake Street',Suburb='St George',Phone='02-1234 1234' 
where StudID=1

Update Student set Street='2 Fake Street',Suburb='St George',Phone='02-1234 1234' where StudID=2
Update Student set Street='3 Fake Street',Suburb='St George',Phone='02-1234 2345' where StudID=3
Update Student set Street='4 Fake Street',Suburb='St George',Phone='02-1234 3456' where StudID=4
Update Student set Street='5 Fake Street',Suburb='St George',Phone='02-1234 4567' where StudID=5
Update Student set Street='6 Fake Street',Suburb='St George',Phone='02-1234 5678' where StudID=6
Update Student set Street='7 Fake Street',Suburb='St George',Phone='02-1234 6789' where StudID=7
Update Student set Street='8 Fake Street',Suburb='St George',Phone='02-1234 7890' where StudID=8
Update Student set Street='9 Fake Street',Suburb='St George',Phone='02-1234 8900' where StudID=9

/*the above works... but maybe there is an easier way to do this*/

/*Add a comments field to the Unit table.*/

ALTER TABLE Unit
ADD Comments varchar(150)
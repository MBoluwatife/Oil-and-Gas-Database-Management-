-- DATABASE FOR TIFEA OIL & GAS

-- LOCATION:- NETHERLANDS

CREATE DATABASE OilGasOperations;
USE OilGasOperations;
show tables;

CREATE TABLE Wells (Well_ID int primary key,
				    Well_Name varchar(50),
                    Location varchar(100),
                    Depth float,
                    Status_well varchar(20),
                    Date_Drillded date
);
                    
SELECT * FROM Wells;

INSERT INTO Wells (Well_ID,Well_Name,Location,Depth,Status_well,Date_Drillded)
VALUES(1, 'Well A', 'Niger Delta', 2500.5, 'Active','2010-05-14'),
(2,'Well B', 'Lagos Offshore', 3200.7, 'Inactive', '2008-08-21'),
(3, 'Well C', 'Akwa Ibom', 1500.7, 'Under Testing ', '2015-11-30'),
(4, 'Well D', 'Rivers State', 2100.4, 'Abandoned', '2000-04-10'),
(5, 'Well E', 'Ondo Coastal', 3000.2, 'Active', '2018-09-05'),
(6, 'Well F', 'Cross River Offshore', 2800.2, 'Inactive', '2011-02-17'),
(7, 'Well G', 'Anambra Basin', 1900.6, 'Active', '2016-07-12'),
(8, 'Well H', 'Bayelsa', 2400.3, 'Abandoned', '2022-03-19'),
(9, 'Well I', 'Delta Offshore', 2900.5, 'Under Testing', '2020-01-10'),
(10, 'Well J', 'Ebonyi', 1600.7, 'Active', '2021-06-25');


 CREATE TABLE Equipment (Equipment_ID int primary key,
                         Equipment_Name varchar(50),
                         Type_Equipment varchar(50),
                         Well_ID int,
                         Installation_Date date,
					     Equipment_Status varchar(20)
);
                         
SELECT * FROM Equipment;

INSERT INTO Equipment (Equipment_ID,Equipment_Name,Type_Equipment,Well_ID,Installation_Date,Equipment_Status)
VALUES(01,'Drill Rig Alpha', 'Drill', 1, '2022-04-25','Active'),
(02,'Mud Pump 500x', 'Pump', 2, '2021-07-14', 'Inactive'),
(03, 'Drill Bit HD', 'Drill', 3, '1979-09-5', 'Active'),
(04, 'Power Tongs PT300', 'Tool', 4, '2015-03-25','Active'),
(05, 'Top Drive TD8000', 'Drill', 5, '2018-12-15', 'Active'),
(06, 'Shale Shaker MK11', 'Shaker', 6, '2020-11-1', 'Inactive'),
(07, 'Hydraulic Hoist HH20', 'Hoist', 7, '2019-07-4', 'Active'),
(08, 'Blowout Preventer BOPX', 'Safety', 8, '2018-08-18', 'Inactive');


  CREATE TABLE Personnels (Personnel_ID int primary key,
                          First_Name varchar(30),
                          Last_Name varchar(30),
                          Personnel_Role varchar(30),
                          Well_ID int,
                          Hire_Date date
);
 
 SELECT * FROM Personnels;             
  
INSERT INTO Personnels (Personnel_ID,First_Name,Last_Name,Personnel_Role,Well_ID,Hire_Date)
VALUES(001,'Daniel', 'Adebayo', 'Chief Surveyor', 1, '2022-09-25'),
(002,'David', 'Lawrence', 'Assistant Surveyor', 2, '2022-03-04'),
(003, 'Steve', 'Job', 'Engineer', 3,  '2023-03-27'),
(004, 'Jerry', 'Alabi', 'Technicial', 4,  '2023-02-28'),
(005, 'Stella', 'Jomiloju', 'Driller', 5,  '2024-03-30'),
(006, 'Mary', 'Johnson', 'Cook', 6, '2024-05-01'),
(007, 'Moses', 'Tarvis', 'Technicial', 7, '2022-05-11');


-- QUERYING DATA FROM TIFEA OIL AND GAS 

-- Retrieve Specific columns

Select Well_Name,
Location
From wells;

Select First_Name,
Last_Name
From personnels;

--  Retrieve Multiple columns

Select Well_Name,
Depth,
Status_well
From wells;

Select Equipment_Name,
Type_Equipment,
Equipment_Status
From equipment;

-- Using Order by 
Select *
From Wells
Order by Depth;

Select Well_Name
From Wells
Order by Depth;

Select *
From personnels
Order by Hire_Date desc;

-- Using Limit
Select *
from Wells
limit 5;

Select *
from personnels
Order by Hire_Date
limit 3;

-- Using Update
Update  Wells
Set Status_Well = 'Maintenance'
where Status_Well = 'Active'
And Depth > 2000;

Select *
from Wells;

Update equipment
set equipment_status = 'Active'
where Installation_Date > '2020-01-1';

select *
from equipment;

-- Using Group by and Having

Select Status_Well, Count(Status_well)
From Wells
group by Status_well; 

Select Personnel_Role, count(Personnel_Role)
From personnels
group by Personnel_Role;

-- Using AND
Select *
from Wells
where Status_Well = 'Active'
And Depth > 2000;

Select *
from personnels
where Personnel_Role = 'Engineer'
And Hire_Date > '2023-01-01';


-- Using OR
Select *
from Wells
where Status_Well = 'Active'
Or Status_Well = 'Under Testing';

Select *
from personnels
where Hire_Date > '2023-01-01'
Or Personnel_Role = 'Technician';


-- using Upper and Lower
Select *, upper(Well_Name)
from Wells
where Location = 'Niger Delta';

Select *,
lower(First_Name)
from personnels;
select *,
lower(Last_Name)
from personnels;

-- Using IN
select * 
from Wells 
where location in ('Niger Delta','Lagos Offshore','Akwa Ibom');

select First_Name, Last_Name
from personnels
where Personnel_Role in ('Engineer','Driller');
-- Using CONCAT
Select *,
concat(First_Name,' ',Last_Name) as Full_Name
from personnels;

select *,
concat(Well_Name,' - ',Location) as Well_Info
from Wells;

-- Using Like
select *
from wells
where Location like '%Delta%';

select *
from personnels
where Last_Name like '%s';

Create DATABASE hackathonDB;
Create TABLE Employee(
	Employee_ID INT NOT NULL UNIQUE,
	F_Name VARCHAR(20) NOT NULL,
	L_Name VARCHAR(20) NOT NULL,
	Company_ID INT NOT NULL,
	Sex VARCHAR(1),
	Phone_no INT(10) NOT NULL,
	Address VARCHAR(50) NOT NULL,
	PRIMARY KEY (Employee_ID)
);

CREATE TABLE Job(
	Job_ID INT NOT NULL UNIQUE,
	Title VARCHAR (30) NOT NULL,
	PRIMARY KEY (Job_ID)
);

CREATE TABLE Company(
	Company_ID INT NOT NULL UNIQUE,
    Company_name VARCHAR (30) NOT NULL,
    Score INT,
    PRIMARY KEY (Company_ID)
    );

CREATE TABLE Task(
	Task_ID INT NOT NULL UNIQUE,
    Task_name VARCHAR (30) NOT NULL,
    Start_date DATE NOT NULL,
    Start_time TIME NOT NULL,
    End_time TIME NOT NULL,
    Task_value INT NOT NULL,
    Winner INTEGER,
    PRIMARY KEY (Task_ID)
    );
    
CREATE TABLE Prototype(
	Prototype_ID INT NOT NULL UNIQUE,
    COMPANY_ID INT NOT NULL,
    Demonstrator_ID INT NOT NULL,
    PRIMARY KEY (Prototype_ID)
);

CREATE TABLE Ranking (
	Task_ID INT NOT NULL,
    Prototype_ID INT NOT NULL,
    Ranking INT,
    PRIMARY KEY(Task_ID,Prototype_ID)
);

CREATE TABLE Participant(
	Task_ID INT NOT NULL,
    Company_ID INT NOT NULL,
    Employee_ID INT NOT NULL,
    Job_ID INT NOT NULL,
    PRIMARY KEY (Task_ID, Company_ID, Employee_ID, Job_ID)
);    

ALTER TABLE Employee 
ADD FOREIGN KEY (Company_ID) REFERENCES Company(Company_ID);  

ALTER TABLE Participant
ADD FOREIGN KEY (Task_ID) REFERENCES Task(Task_ID),
ADD FOREIGN KEY (Company_ID) REFERENCES Company(Company_ID),
ADD FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID),
ADD FOREIGN KEY (Job_ID) REFERENCES JOB(Job_ID);

ALTER TABLE Task
ADD FOREIGN KEY (Winner) REFERENCES Company(Company_ID);

ALTER TABLE Prototype
ADD FOREIGN KEY (Company_ID) REFERENCES Company(Company_ID),
ADD Foreign KEY (Demonstrator_ID) REFERENCES Employee(Employee_ID);

ALTER TABLE Ranking 
ADD FOREIGN KEY (Task_ID) REFERENCES Task(Task_ID),
ADD FOREIGN KEY (Prototype_ID) REFERENCES Prototype(Prototype_ID);

/*Constraints*/
ALTER TABLE Employee
ADD CONSTRAINT CHK_Phone_valid
CHECK (Phone_No >= 0800000000 AND Phone_No <= 0900000000),
ADD CONSTRAINT Chk_AddressLen 
CHECK (CHAR_LENGTH(Address) > 15);

ALTER TABLE Task DROP CONSTRAINT Chk_StartTime;

ALTER TABLE Task
ADD CONSTRAINT Chk_Dates CHECK (Start_date >= '2020-11-11'),
ADD CONSTRAINT CHK_StartTime CHECK (Start_time >= '09:00:00'),
ADD CONSTRAINT CHK_EndTime CHECK (End_time < '20:00:00');

INSERT INTO COMPANY
VALUES
(1, 'Chromium', null),
(2, 'Gamma', null),
(3, 'Mobilni', null),
(4, 'Tesla', null),
(5, 'Shababa', null),
(6, 'Protek', null),
(7, 'Allday', null),
(8, 'Browns', null);

CREATE ROLE DB_Admin;
CREATE ROLE Organiser;

CREATE USER YoniAssia;
CREATE USER GinniRometty;

GRANT DB_Admin TO YoniAssia;
GRANT Organiser TO GinniRometty;

GRANT ALL ON hackathonDB TO DB_Admin;
GRANT INSERT, UPDATE, DELETE ON Employee TO Organiser;
GRANT INSERT, UPDATE, DELETE ON Company TO Organiser;
-- Create Trigger --
INSERT INTO Employee 
VALUES
(1,'Alexander', 'Bublik', 1,'M',0821092822, 'Almaty Grove Dublin'),
(2,'Sascha', 'Zverev', 3, 'M', 0821410211, 'Kilbarrack Way Dublin'),
(3, 'Katerina', 'Siniakova', 8,  'F',082111010, 'Ocean Drive Meath'),
(4,'Lukasz', 'Popek', 7,'M',0821929387, 'Lodz Castle Meath'),
(5,'Aine', 'Doyle', 2, 'F', 0827278798, 'Shalogue Crescent Dublin'),
(6, 'Maria', 'Keating', 5,  'F',0821199228, 'Lionel Street Dublin'),
(7,'Gustavs', 'Butelis', 4,'M',0820876251, 'Almaty Grove Dublin'),
(8,'Sean', 'Connery', 6, 'M', 0821402718, 'Mallow Grove Dublin'),
(9, 'Polina', 'Gagarina', 1,  'F',0893726353, 'Newhaven Avenue Dublin'),
(10,'Tina', 'Karol', 3,'F',082122109, 'Meath Street Meath'),
(11,'Aisha', 'Muhammad', 8, 'F', 0821321476, 'Shaunas Way Meath'),
(12, 'Dima', 'Bilan', 7,  'M',0891111187, 'King Street Meath'),
(13,'Priyanka', 'Chopra', 2,'F',0821818112, 'Rome Street Dublin'),
(14,'Kamile', 'Juozapaviciute', 5, 'F', 0821823746, 'Paddy Street Dublin'),
(15, 'Justas', 'Landsbergis', 4,  'M',0898273644, 'Baldonell Rise Dublin'),
(16,'Oisin', 'King', 6,'M',0821021109, 'Milltown Street Dublin'),
(17,'Michal', 'Stalkowski', 1, 'M', 082147721, 'Cappagh Rise Dublin'),
(18, 'Orlaith', 'Connors', 3,  'F',0898765287, 'Clare Downs Meath'),
(19,'Max', 'Atta', 8,'M',0820890852, 'Milly Cross Meath'),
(20,'Fiona', 'Larsson', 7, 'M', 0821411908, 'Crosslands Park Meath'),
(21, 'Bastien', 'Colin', 2,  'M',0891029112, 'Shangan Road Dublin'),
(22,'Ada', 'Lovelace', 5,'F',0822123093, 'Berlin Drive Dublin'),
(23,'Elona', 'Santiago', 4, 'F', 0820927219, 'Queens Avenue Dublin'),
(24, 'Kelvin', 'Aina', 6,  'M',0891827346, 'Ballina Terrace Dublin');


INSERT INTO Job
VALUES 
(1,'Manager'),
(2,'Accountant'),
(3,'Software Developer'),
(4,'Mechanical Engineer'),
(5,'Lawyer'),
(6,'Designer'),
(7,'HR Representative');

INSERT INTO Task
VALUES
(1, 'Buggy Design', '2020-11-12', '09:00:00', '12:00:00', 200, null);
(2, 'Phone Design','2020-11-12', '14:00:00', '18:00:00', 300, null),
(3, 'Car Design','2020-11-13', '09:00:00', '12:00:00', 100, null),
(4, 'System Design','2020-11-14', '09:00:00', '17:00:00', 500, null),
(5, 'Material Design', '2020-11-15', '12:00:00', '16:30:00', 300, null),
(6, 'Calculator Design','2020-11-16', '09:30:00', '12:30:00', 200, null);

INSERT INTO Participant
VALUES
(1,1,9),
(2,8,11),
(3,3,2),
(4,7,4),
(5,5,6),
(6,6,8),
(7,4,23),
(8,2,21);

INSERT INTO Ranking
VALUE
(1,8,null),
(1,3,null),
(1,2,null),
(1,4,null),
(1,5,null),
(1,6,null),
(1,1,null),
(1,7,null);

INSERT INTO Participant
VALUES
(1,8,11,1),
(1,1,9,3),
(1,3,2,2),
(1,7,4,2),
(1, 5,6,3),
(1, 6,8,3),
(1,4,23,3),
(1,2,21,3);


ALTER TABLE Employee ADD CHECK (Employee_ID>0);
ALTER TABLE Company ADD CHECK (Company_ID>0);
ALTER TABLE Job ADD CHECK (Job_ID>0);
ALTER TABLE Task ADD CHECK (Task_ID>0);
ALTER TABLE Prototype ADD Check (Prototype_ID>0);


CREATE VIEW Company_Scores
AS SELECT Company_Name, score from Company
ORDER BY Score DESC;

SELECT * FROM Company_Scores;

CREATE VIEW Employee_List
AS SELECT F_Name, L_Name,Company_Name
FROM EMPLOYEE JOIN COMPANY
ON Employee.Company_ID =Company.Company_ID;


SELECT * FROM Employee_List;

UPDATE Company SET Score = Score + 200 Where Company_ID = 1;
UPDATE Company SET Score = 100 Where Company_ID = 2;
UPDATE Company SET Score = Score + 300 Where Company_ID = 3;
UPDATE Company SET Score = 500 Where Company_ID = 4;
UPDATE Company SET Score = 1100 Where Company_ID = 5;
UPDATE Company SET Score = Score + 350 Where Company_ID = 6;
UPDATE Company SET Score = 800 Where Company_ID = 7;
UPDATE Company SET Score = 900 Where Company_ID = 8;

SELECT * FROM Company_Score_List
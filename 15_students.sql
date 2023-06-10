CREATE DATABASE db_school

CREATE TABLE tbl_studnts(
name varchar(50),
address varchar(50),
ID int PRIMARY KEY,
age int
)
INSERT INTO tbl_studnts(name,address,ID,age)
VALUES('aayush','Kathmandu',2,20),('Chandan','Lalitpur',12,21),('Bikash','Bhaktapur',8,19),('Deepak','Dhulikhel',14,20),('Ganesh','Chitwan',16,18),('Sabin','Tokha',32,19),('Looza','Mid baneshwor',24,20),('Arnab','Hattiban',6,21),('Hari','Anamnagar',18,22),('Mohit','Tinkune',25,20)
SELECT * FROM tbl_studnts

UPDATE tbl_studnts
SET name='chand'
WHERE name='aayush'
SELECT * FROM tbl_studnts
SELECT name as naam 
FROM tbl_studnts
CREATE TABLE tbl_Subjects(
name varchar(50),
department varchar(50)
);
SELECT *FROM tbl_studnts
WHERE name='chandan' OR  address='Kathmandu'

SELECT *
FROM tbl_studnts
WHERE not age=20


SELECT age FROM tbl_studnts
WHERE age BETWEEN 19 AND 22

SELECT name FROM tbl_studnts
WHERE name LIKE '%a'

SELECT address FROM tbl_studnts
WHERE address LIKE '%du'


SELECT name FROM tbl_studnts
WHERE name LIKE '_i%'

SELECT name FROM tbl_studnts
WHERE name LIKE '__K%'

CREATE TABLE tbl_Marks(
name varchar(50),
marks int,
ID int FOREIGN KEY REFERENCES tbl_studnts(ID)
);
SELECT * FROM tbl_Marks



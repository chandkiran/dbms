
CREATE DATABASE db_employee
DROP DATABASE db_employee
CREATE TABLE
    tbl_employee (
        employee_name VARCHAR(255) NOT NULL,
        street VARCHAR(255) NOT NULL,
        city VARCHAR(255) NOT NULL,
        PRIMARY KEY(employee_name)
    );




CREATE TABLE
    tbl_Works (
        employee_name VARCHAR(255) NOT NULL,
        FOREIGN KEY (employee_name) REFERENCES tbl_employee(employee_name),
        company_name VARCHAR(255),
        salary DECIMAL(10, 2)
    );
	

CREATE TABLE
    tbl_Company (
        company_name VARCHAR(255) NOT NULL,
        city VARCHAR(255),
        PRIMARY KEY(company_name)
    );

CREATE TABLE
    tbl_Manages (
        employee_name VARCHAR(255) NOT NULL,
        FOREIGN KEY (employee_name) REFERENCES tbl_employee(employee_name),
        manager_name VARCHAR(255)
    );

INSERT INTO
    tbl_employee (employee_name, street, city)
VALUES (
        'Alice Williams',
        '321 Maple St',
        'Houston'
    ), (
        'Sara Davis',
        '159 Broadway',
        'New York'
    ), (
        'Mark Thompson',
        '235 Fifth Ave',
        'New York'
    ), (
        'Ashley Johnson',
        '876 Market St',
        'Chicago'
    ), (
        'Emily Williams',
        '741 First St',
        'Los Angeles'
    ), (
        'Michael Brown',
        '902 Main St',
        'Houston'
    ), (
        'Samantha Smith',
        '111 Second St',
        'Chicago'
    );
	

INSERT INTO
    tbl_employee (employee_name, street, city)
VALUES (
        'Patrick',
        '123 Main St',
        'New Mexico'
    );



INSERT INTO
    tbl_Works (
        employee_name,
        company_name,
        salary
    )
VALUES (
        'Patrick',
        'Pongyang Corporation',
        500000
    );

INSERT INTO
    tbl_Works (
        employee_name,
        company_name,
        salary
    )
VALUES (
        'Sara Davis',
        'First Bank Corporation',
        82500.00
    ), (
        'Mark Thompson',
        'Small Bank Corporation',
        78000.00
    ), (
        'Ashley Johnson',
        'Small Bank Corporation',
        92000.00
    ), (
        'Emily Williams',
        'Small Bank Corporation',
        86500.00
    ), (
        'Michael Brown',
        'Small Bank Corporation',
        81000.00
    ), (
        'Samantha Smith',
        'Small Bank Corporation',
        77000.00
    );
INSERT INTO
    tbl_Company (company_name, city)
VALUES (
        'Small Bank Corporation', 'Chicago'), 
        ('ABC Inc', 'Los Angeles'), 
        ('Def Co', 'Houston'), 
        ('First Bank Corporation','New York'), 
        ('456 Corp', 'Chicago'), 
        ('789 Inc', 'Los Angeles'), 
        ('321 Co', 'Houston'),
        ('Pongyang Corporation','Chicago'
    );

INSERT INTO
    tbl_Manages(employee_name, manager_name)
VALUES 
    ('Mark Thompson', 'Emily Williams'),
    ('Alice Williams', 'Emily Williams'),
    ('Samantha Smith', 'Sara Davis'),
    ('Patrick', 'Jane Doe');

SELECT * FROM tbl_employee;
SELECT * FROM tbl_Works;
SELECT * FROM tbl_Manages;
SELECT * FROM tbl_Company;

-- Update the value of salary to 1000 where employee name= John Smith and company_name = First Bank Corporation
UPDATE tbl_Works
SET salary = '1000'
WHERE
    employee_name = 'Sara Davis'
AND company_name = 'First Bank Corporation';

--counts the number of employees under each manager
SELECT manager_name, COUNT(employee_name)AS number_of_employee FROM tbl_manages
GROUP BY manager_name
having count(employee_name)>1

--find the name of all employee who works for first bank corporation
SELECT employee_name FROM tbl_employee 
WHERE  employee_name IN (SELECT employee_name FROM tbl_Works WHERE company_name='First  Bank Corporation');
SELECT employee_name FROM tbl_Works WHERE company_name='First  Bank Corporation'


--B)Find the names and cities of residence of all employees who work for First Bank Corporation
SELECT employee_name,city FROM tbl_employee WHERE  employee_name IN (SELECT employee_name FROM tbl_Works WHERE company_name='First Bank Corporation')



--c)Find the names, street addresses, and cities of residence of all employees who work for First Bank Corporation and earn more than $10,000.
SELECT employee_name,street,city FROM tbl_employee WHERE employee_name IN(SELECT employee_name FROM tbl_Works WHERE company_name='First Bank Corporation' AND salary>'10000');--(d) Find all employees in the database who live in the same cities as the companies for which they work.
SELECT tbl_employee.employee_name  FROM  tbl_employee,tbl_Company,tbl_Works WHERE 
tbl_employee.city=tbl_Company.city AND 
tbl_Company.company_name=tbl_Works.company_name
AND tbl_employee.employee_name=tbl_Works.employee_name

--(e) Find all employees in the databasee in the same cities and on the same streets as do their managers.
SELECT s.employee_name,s.city,s.street,e.employee_name AS m,e.street AS ms 
FROM tbl_employee s join tbl_Manages on 
s.employee_name =tbl_manages.employee_name
join tbl_employee e on e.employee_name =tbl_manages.manager_name
where s.city= e.city
and s.street=e.street


--f) Find all employees in the database who do not work for First Bank Corporation
SELECT employee_name FROM tbl_Works WHERE NOT company_name='First Bank Corporation'

--g)Find all employees in the database who earn more than each employee of Small Bank Corporation.
SELECT employee_name FROM tbl_Works WHERE  salary >ALL(SELECT salary FROM tbl_Works WHERE company_name='Small Bank Corporation');

--(h) Assume that the companies may be located in several cities. Find all companies located
--in every city in which Small Bank Corporation is located
SELECT company_name FROM tbl_Company
WHERE city IN (SELECT city FROM tbl_Company 
WHERE company_name = 'small bank corporation');

--(j) Find the company that has the most employees.
SELECT company_name FROM tbl_Works 
GROUP BY company_name 
HAVING count(distinct employee_name) >all(SELECT count(distinct employee_name) FROM tbl_Works group by company_name)

--l) Find those companies whose employees earn a higher salary, on average, than the
--average salary at First Bank Corporation
SELECT company_name FROM tbl_Works
GROUP BY company_name 
HAVING avg(salary) >all(SELECT avg(salary) FROM tbl_Works WHERE company_name='First Bank Corporation')


--(a) Modify the database so that Sara Davis now lives in Newtown.
UPDATE  tbl_employee
SET city='NEWTON'
WHERE employee_name='Sara Davis'








---qsn 3









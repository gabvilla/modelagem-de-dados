use company_constraints;
show tables;

load data infile 'path' into table employee
	fields terminated by ','
    lines terminated by ';';

select * from employee where Dno = 5;
insert into employee values ('John', 'B', 'Smith', 123456789, '1950-01-09', '731-Fondren-Houston-TX', 'M', '30000', null, 5);
insert into employee values ('Franklin', 'T', 'Wong', 234567890, '1955-12-08', '638-Voss-Houston-TX', 'M', '40000', null, 5),
							('Alicia', 'J', 'Zelaya', 345678912, '1968-01-19', '3321-Castle-Spring-TX', 'F', '25000', null, 4),
							('Jennifer', 'S', 'Wallace', 456789123, '1941-06-20', '291-Berry-Bellaire-Texas', 'F', '43000', null, 4),
							('Ramesh', 'K', 'Narayan', 567891234, '1962-09-15', '975-Fire-Oak-Texas', 'M', '38000', null, 5),
							('Joyce', 'A', 'English', 678912345, '1972-07-31', '5631-Rice-Houston-Texas', 'M', '25000', null, 1);

insert into dependent values (123456789, 'Alice', 'F','1986-04-05', 'Daughter'),
							 (123456789, 'Theodore', 'M', '1983-10-25', 'Son'),
                             (234567890, 'Joy', 'F','1958-05-03', 'Spouse'),
                             (678912345, 'Abner', 'M','1942-02-28', 'Spouse'),
                             (567891234, 'Michael', 'M','1983-09-12', 'Son'),
                             (456789123, 'Elizabeth', 'F','1981-02-28', 'Daughter');
                             
insert into department values ('Research', 5, 567891234, '1988-05-22', '1986-05-21'),
							  ('Administration', 4, 456789123, '1995-01-01', '1994-01-01'),
                              ('Headquarters', 1, 678912345, '1981-06-19', '1980-06-18');
                                                            
insert into dept_locations values (1, 'Houston'),
								  (4, 'Stafford'),
                                  (5, 'Bellaire'),
                                  (5, 'Sugarland'),
                                  (5, 'Houston');
                                  
insert into project values ('ProductX', 1, 'Bellaire', 5),
						   ('ProductY', 2, 'Sugarland', 5),
                           ('ProductZ', 3, 'Houston', 5),
                           ('Computerization', 10, 'Stafford', 4),
                           ('Reorganization', 20, 'Houston', 1);
                           
insert into works_on values (123456789, 1, 32.5),
							(234567890, 2, 7.5),
                            (567891234, 3, 40),
                            (345678912, 10, 20),
                            (678912345, 20, 20);
						
-- gerente e seu departamento
select Ssn, Fname, Dname from employee e, department d where (e.Ssn = d.Mgr_ssn);

-- dados dos dependentes
select Fname, Dependent_name, Relationship from employee, dependent where Essn = Ssn;

-- dados de employee por nome
select Bdate, Address from employee 
	where Fname = 'John' and Minit = 'B' and Lname = 'Smith';

-- recuperando departamento específico
select * from department where Dname = 'Research';

-- recuperando employees de um departamento
select Fname, Lname, Address from employee, department
	where Dname = 'Research' and Dnumber = Dno;
    
select Pname, Essn, Fname, Hours from project, works_on, employee where Pnumber = Pno and Essn = Ssn;
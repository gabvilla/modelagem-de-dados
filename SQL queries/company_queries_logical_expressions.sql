use company_constraints;
show tables;

-- recuperando informações dos departamentos presentes em Stafford
select Dname as Department_name, Mgr_ssn as Manager, Address from department d, dept_locations l, employee e
	where d.Dnumber = l.Dnumber and Dlocation = 'Stafford';

-- recuperando todos os gerentes que trabalham em Stafford
select Dname as Department_name, concat(Fname, ' ', Lname) as Manager, Address from department d, dept_locations l, employee e
	where d.Dnumber = l.Dnumber and Dlocation = 'Stafford' and Mgr_ssn = e.Ssn;

-- recuperando todos os gerentes, departamentos e seus nomes
select Dname as Department_name, concat(Fname, ' ', Lname) as Manager, Address from department d, dept_locations l, employee e
	where d.Dnumber = l.Dnumber and Mgr_ssn = e.Ssn;
    
select Pnumber, Lname, Address, Bdate from department d, project p, employee e
	where d.Dnumber = p.Dnum and Mgr_ssn = e.Ssn and p.PLocation = 'Stafford';
    
-- like e between
select concat(Fname, ' ', Lname) Complete_name, Dname as Department_name from employee, department
	where (Dno = Dnumber and Address like '%Houston%');
    
select concat(Fname, ' ', Lname) Complete_name, Address from employee
	where (Address like '%Houston%');
    
select Fname, Lname, Salary from employee
	where (Salary between 30000 and 40000);
    
--
-- Operadores Lógicos
--

select Bdate, Address from employee
	where Fname = 'John' and Lname = 'Smith';
    
select * from department
	where Dname = 'Research' or Dname = 'Administration';
    
select Fname, Lname from department, employee 
	where Dname = 'Research' and Dnumber = Dno;
    



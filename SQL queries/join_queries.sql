use company_constraints;

-- JOIN statement
select * from employee join works_on;


-- JOIN ON --> INNER JOIN
select * from employee, works_on where Ssn = Essn;
select * from employee join department on Ssn = Mgr_Ssn;

select Fname, Lname, Address
	from (employee join department on Dno = Dnumber)
    where Dname = 'Research';

select * from dept_locations; -- address e Dnumber
select * from department; -- Dname e Dept_create_date

select Dname Department, Dept_create_date Start_date, Dlocation Location
	from department join dept_locations using (Dnumber)
    order by Start_date;

-- CROSS JOIN - produto cartesiano

select * from employee cross join dependent;

-- JOIN com 3 ou mais tabelas

select concat(Fname, ' ', Lname) Employee_name, Dno Dept_number, Pname Project_name, Pnumber, Plocation Location from employee
	inner join works_on on Ssn = Essn
    inner join project on Pno = Pnumber
    where Pname like 'Product%'
    order by Pnumber;
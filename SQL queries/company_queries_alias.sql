use company_constraints;
show tables;

-- Dnumber: deparment, dept_locations.
desc dept_locations;

select * from department;
select * from dept_locations;

select Dname, l.Dlocation as Department_name 
	from department as d, dept_locations as l
	where d.Dnumber = l.Dnumber;

select concat(Fname, ' ', Lname) as Employee from employee;
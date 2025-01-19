use company_constraints;
show tables;

-- Dnumber: deparment, dept_locations.
desc dept_locations;

update employee set Salary = 30000 where Ssn = '123456789';

select * from department;
select * from dept_locations;

select Dname, l.Dlocation as Department_name 
	from department as d, dept_locations as l
	where d.Dnumber = l.Dnumber;

select concat(Fname, ' ', Lname) as Employee from employee;

-- recolhendo valor do INSS
select Fname, Lname, Salary, round(Salary*0.011, 2) as INSS from employee;

-- definir um aumento de salário para os gerentes a partir de uma condição
select concat(Fname, ' ', Lname) as Employee_name, Salary, round(Salary * 1.1, 2) as increased_salary 
	from employee e, works_on as w, project as p
    where (e.Ssn = w.Essn and w.Pno = p.Pnumber and p.Pname = 'ProductX');
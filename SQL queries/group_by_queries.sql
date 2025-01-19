-- funções e cláusulas de agrupamento

use company_constraints;

select * from employee;
select count(*) from employee;

select count(*) from employee, department
	where Dno = Dnumber and Dname = 'Research';
    
select Dno, count(*) as Number_of_Employees, round(avg(Salary), 2) as Salary_Avg 
	from employee
	group by Dno;
    
select Pnumber, Pname, count(*) 
	from project, works_on
	where Pnumber = Pno
    group by Pnumber, Pname;
    
select count(distinct Salary) from employee;
select sum(Salary) as total_sal, max(Salary) as max_sal, min(Salary) as min_sal, avg(Salary) as avg_sal from employee;

select Pnumber, Pname, count(*)
	from project, works_on
    where Pnumber = Pno
    group by Pnumber, Pname;
    
select Pnumber, Pname, count(*) as Number_of_register, round(avg(Salary), 2) as Avg_salary
	from project, works_on, employee
    where Pnumber = Pno and Ssn = Essn
    group by Pnumber, Pname;
    
select Pnumber, Pname, count(*) as Number_of_register, round(avg(Salary), 2) as Avg_salary
	from project, works_on, employee
    where Pnumber = Pno and Ssn = Essn
    group by Pnumber
    order by Avg_salary desc;
    
    
    
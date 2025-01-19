-- clausulas de ordenação

use company_constraints;

select * from employee order by Fname, Lname;

desc department;

-- nome do departamento e nome do gerente
select distinct d.Dname, concat(e.Fname, ' ', e.Lname) as Manager, Address 
	from department d, employee e, works_on w, project p
	where d.Dnumber = e.Dno and e.Ssn = d.Mgr_ssn and w.Pno = p.Pnumber
    order by d.Dname;
    
-- recuperar todos os empregados e seus projetos em andamento
select d.Dname as Department, concat(e.Fname, ' ', e.Lname) as Employee, Address
	from department d, employee e, works_on w, project p
    where (d.Dnumber = e.Dno and e.Ssn = w.Essn and w.Pno = p.Pnumber)
    order by d.Dname desc, concat(e.Fname, ' ', e.Lname) asc;
    

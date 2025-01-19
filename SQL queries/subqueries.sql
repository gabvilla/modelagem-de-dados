-- subqueries

use company_constraints;

select distinct Pnumber from project p
	where Pnumber in
		(
        select Pnumber
			from project, department, employee
			where (Mgr_ssn = Ssn and Lname = 'Wallace' and Dnum = Dnumber))
        or
		(
        select distinct Pno
			from works_on, employee
			where (Essn = Ssn and Lname = 'Wallace')
		);
        
select distinct * from works_on
	where (Pno, Hours) in (select Pno, Hours
							from works_on
                            where Essn = 123456789);
                            
-- cláusulas com exists e unique

-- quais employees possuem dependentes
select e.Fname, e.Lname from employee as e
	where exists (select * from dependent as d
					where e.Ssn = d.Essn);
                  
-- empregados que não possuem dependentes
select e.Fname, e.Lname from employee as e
	where not exists (select * from dependent as d
					where e.Ssn = d.Essn);

-- gerentes que possuem dependentes                    
select e.Fname, e.Lname from employee as e, department d
	where (e.Ssn = d.Mgr_ssn) and exists (select * from dependent as d
											where e.Ssn = d.Essn);
      
-- funcionários com 2 ou mais dependentes
select Fname, Lname from employee 
	where (select count(*) from dependent where Ssn = Essn) >= 2;
    
    
select distinct Essn, Pno from works_on where Pno in (1, 2, 3);


            
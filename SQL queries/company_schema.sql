create schema if not exists company;

create table if not exists company.employee(
	Fname varchar(15) not null,
    Minit char,
    Lname varchar (15) not null,
    Ssn char(9) not null,
    Bdate date,
    Address varchar(30),
    Sex char,
    Salary decimal(10, 2),
    Super_ssn char(9),
    Dno int not null,
    primary key (Ssn)
);

alter table employee
	add constraint fk_employee
    foreign key(Super_ssn) references employee(Ssn)
    on delete set null
    on update cascade;

use company;

create table if not exists department(
	Dname varchar(15) not null,
    Dnumber int not null,
    Mgr_ssn char(9),
    Mgr_start_date date,
    primary key (Dnumber),
    unique (Dname),
    foreign key (Mgr_ssn) references employee(Ssn)
);

alter table department drop constraint department_ibfk_1;
alter table department
	add constraint fk_department foreign key (Mgr_ssn) references employee(Ssn)
    on update cascade;

create table if not exists dept_locations(
	Dnumber int not null,
    Dlocation varchar(15) not null,
    primary key (Dnumber, Dlocation),
    foreign key (Dnumber) references department(Dnumber)
);

alter table dept_locations drop constraint fk_dept_locations;
alter table dept_locations
	add constraint fk_dept_locations foreign key (Dnumber) references department(Dnumber)
    on delete cascade
    on update cascade;

create table if not exists project(
	Pname varchar(15) not null,
    Pnumber int not null,
    Plocation varchar(15),
    Dnum int not null,
    primary key (Pnumber),
    unique (Pname),
    foreign key (Dnum) references department (Dnumber)
);

create table if not exists works_on(
	Essn char(9) not null,
    Pno int not null,
    Hours decimal(3, 1) not null,
    primary key (Essn, Pno),
    foreign key (Essn) references employee(Ssn),
    foreign key (Pno) references project(Pnumber)    
);

create table if not exists dependent(
	Essn char(9) not null,
    Dependent_name varchar(15) not null,
	Sex char, -- F ou M
    Bdate date,
    Relationship varchar(8),
    primary key (Essn, Dependent_name),
    foreign key (Essn) references employee(Ssn)
    
);

select * from information_schema.table_constraints
	where constraint_schema = 'company' and TABLE_NAME = 'project';

show tables;
desc dependent;
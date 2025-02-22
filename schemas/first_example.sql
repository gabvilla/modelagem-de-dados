create database first_example;
use first_example;
show tables;
CREATE TABLE person(
	person_id smallint unsigned,
	fname varchar(20),
	lname varchar(20),
	gender enum('M', 'F'),
	birth_date date,
	street varchar(30),
	city varchar(20),
	state varchar(20),
	country varchar(20),
	postal_code varchar(20),
    constraint pk_person primary key (person_id)
);

desc person

create table favorite_food(
	person_id smallint unsigned,
    food varchar(20),
    constraint pk_favorite_food primary key (person_id, food),
    constraint fk_favorite_food_person_id foreign key (person_id) references person(person_id)
);

desc favorite_food;

select * from information_schema.table_constraints
where constraint_schema = 'first_example';

desc person;

insert into person values ('1', 'Carolina','Silva', 'F', '1979-08-21',
							'rua tal', 'Cidade J', 'RJ', 'Brasil','26054-89');
                            
select * from person;


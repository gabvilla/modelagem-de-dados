select now() as Timestamp;

create database manipulation;
use manipulation;

create table bankAccounts (
	Id_account int auto_increment primary key,
    Ag_num int not null,
    Ac_num int not null,
    Saldo float,
    constraint indentification_account_constraint unique (Ag_num, Ac_num)
);

alter table bankAccounts add LimiteCredito float 
	not null default 500.00;
    
desc bankAccounts;

create table bankClient (
	Id_client int auto_increment,
    ClientAccount int,
    CPF char(11) not null,
    RG char(9) not null,
    Nome varchar(50) not null,
    Endereço varchar (100) not null,
    Renda_mensal float,
    primary key (Id_client, ClientAccount),
    constraint fk_account_client foreign key (ClientAccount) references bankAccounts(Id_account)
	on update cascade
);

create table bankTransactions(
	Id_transaction int auto_increment primary key,
    Ocorrencia datetime,
    Status_transaction varchar(20),
    Valor_transferido float,
    Source_account int,
    Destination_account int,
    constraint fk_source_transaction foreign key (Source_account) references
		bankAccounts(Id_account),
	constraint fk_destination_transaction foreign key (Destination_account) references
		bankAccounts(Id_account)
);

-- Inserir dados na tabela bankAccounts
INSERT INTO bankAccounts (Ag_num, Ac_num, Saldo, LimiteCredito) VALUES
(101, 1001, 1500.00, 500.00),
(101, 1002, 2500.00, 500.00),
(102, 1003, 3000.00, 500.00),
(103, 1004, 4000.00, 500.00),
(104, 1005, 500.00, 500.00),
(105, 1006, 10000.00, 500.00),
(106, 1007, 1200.00, 500.00),
(107, 1008, 3500.00, 500.00),
(108, 1009, 800.00, 500.00),
(109, 1010, 1500.00, 500.00);

-- Inserir dados na tabela bankClient
INSERT INTO bankClient (ClientAccount, CPF, RG, Nome, Endereço, Renda_mensal) VALUES
(1, '12345678901', '123456789', 'João Silva', 'Rua A, 123', 2500.00),
(2, '23456789012', '234567890', 'Maria Oliveira', 'Rua B, 456', 3000.00),
(3, '34567890123', '345678901', 'Carlos Souza', 'Rua C, 789', 3500.00),
(4, '45678901234', '456789012', 'Ana Pereira', 'Rua D, 101', 2800.00),
(5, '56789012345', '567890123', 'Pedro Costa', 'Rua E, 202', 4000.00),
(6, '67890123456', '678901234', 'Fernanda Lima', 'Rua F, 303', 3200.00),
(7, '78901234567', '789012345', 'Ricardo Santos', 'Rua G, 404', 3300.00),
(8, '89012345678', '890123456', 'Juliana Alves', 'Rua H, 505', 2900.00),
(9, '90123456789', '901234567', 'Luciana Ferreira', 'Rua I, 606', 3100.00),
(10, '01234567890', '012345678', 'Roberto Martins', 'Rua J, 707', 3600.00);

-- Inserir dados na tabela bankTransactions
INSERT INTO bankTransactions (Ocorrencia, Status_transaction, Valor_transferido, Source_account, Destination_account) VALUES
('2025-01-10 10:00:00', 'COMPLETA', 500.00, 1, 2),
('2025-01-10 11:00:00', 'PENDENTE', 1000.00, 2, 3),
('2025-01-11 09:30:00', 'COMPLETA', 200.00, 3, 4),
('2025-01-12 14:45:00', 'PENDENTE', 150.00, 4, 5),
('2025-01-13 16:00:00', 'COMPLETA', 2500.00, 5, 6),
('2025-01-13 17:15:00', 'COMPLETA', 1200.00, 6, 7),
('2025-01-14 09:00:00', 'PENDENTE', 300.00, 7, 8),
('2025-01-14 10:30:00', 'COMPLETA', 1500.00, 8, 9),
('2025-01-15 15:00:00', 'PENDENTE', 800.00, 9, 10),
('2025-01-16 13:30:00', 'COMPLETA', 400.00, 10, 1);

select * from bankAccounts;




-- definindo a tabela 
create table tb_medico(
crm int not null primary key unique,
nome varchar(45) not null,
especialidade varchar(50) DEFAULT 'oftalmo',
CHECK(especialidade IN ('Oftalmo','Pediatra','Geriatra'))
);

CREATE TABLE tb_paciente(
id int not null primary key unique auto_increment, -- auto increment para a cada novo recebimento, ordenar sozinho
nome varchar(50),
cpf int(11) unique not null,
-- sexo enum('F','M')
sexo CHAR(1),
crm INT,
CHECK (sexo IN('F','M')),
foreign key (crm) references tb_medico(crm)

);
INSERT INTO tb_medico(crm,nome,especialidade)values
(1001,ana,oftalmo),
(1002,maria,pediatra),
(1003,pedro,geriatra),
(1015,joana,oftalmo);

INSERT INTO tb_paciente values -- pode colocar os valores direto ou criar parentese, como no ex acima
(default,'hugo porto', 08319128471, M, 1002 );

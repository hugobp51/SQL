USE banco;
CREATE TABLE tb_banco(
banco_id INT UNIQUE PRIMARY KEY,
nome VARCHAR(40) NOT NULL 
);

CREATE TABLE tb_agencia(
Cod_banco INT ,
Num_agencia INT NOT NULL,
Endereço VARCHAR(60) NOT NULL,	
PRIMARY KEY(Cod_banco,Num_agencia),
FOREIGN KEY(Cod_banco) REFERENCES tb_banco(banco_id)
);

CREATE TABLE tb_cliente(
cpf VARCHAR(14) PRIMARY KEY,
nome VARCHAR(40) NOT NULL,
endereço VARCHAR(60) NOT NULL,
sexo CHAR(1)
CHECK(sexo IN('m','f'))
);

CREATE TABLE tb_conta(
Num_conta VARCHAR(8) PRIMARY KEY,
saldo DECIMAL(8,2) NOT NULL,
tipo_conta INT,
Num_banco INT NOT NULL,
FOREIGN KEY (Num_banco) REFERENCES tb_banco(banco_id)
);

CREATE TABLE tb_historico(
cpf_cliente VARCHAR(14),
Num_conta VARCHAR(7),
data_inicio DATE NOT NULL,
FOREIGN KEY (cpf_cliente) REFERENCES tb_cliente(cpf),
FOREIGN KEY (Num_conta) REFERENCES tb_conta(Num_conta),
PRIMARY KEY(cpf_cliente, Num_conta)
);

CREATE TABLE tb_telefone_cliente(
cpf_cli VARCHAR(14),
telefone VARCHAR(13),
PRIMARY KEY (cpf_cli,telefone), 
FOREIGN KEY (cpf_cli) REFERENCES tb_cliente(cpf)
);

ALTER TABLE tb_cliente ADD COLUMN país CHAR(3) DEFAULT "BRA";

ALTER TABLE tb_cliente ADD COLUMN email VARCHAR(35);

INSERT INTO tb_banco(banco_id, nome) 
VALUES(1,"BANCO DO BRASIL");

INSERT INTO tb_banco(banco_id, nome) 
VALUES(3,"CAIXA ECONÔMICA FEDERAL");

INSERT INTO tb_agencia(Num_agencia,endereço,Cod_banco) 
VALUES(322,"AV.Walfred Macedo Brandao,1139",3);

INSERT INTO tb_agencia(Num_agencia,endereço,Cod_banco) 
VALUES(1253,"AV.Bancario Sergio Guerra,17",1);

INSERT INTO tb_cliente(cpf, nome, sexo, endereço ) 
VALUES("111.222.333-44"," Bruna Andrade","f","Rua José Firmino Ferreira, 1050");

INSERT INTO tb_cliente(cpf, nome, sexo, endereço ) 
VALUES("666.777.888-99","Radegondes Silva","m","Av. Epitácio Pessoa, 1008");

INSERT INTO tb_cliente(cpf, nome, sexo, endereço ) 
VALUES("555.444.777-33","Miguel Xavier","m","Rua Bancário Sérgio Guerra, 640");

INSERT INTO tb_conta(Num_conta, saldo, tipo_conta, Num_banco ) 
VALUES("11765-2",22745.05, 2, 1);

INSERT INTO tb_conta(Num_conta, saldo, tipo_conta, Num_banco ) 
VALUES("21010-7",3100.96, 1, 3);

INSERT INTO tb_historico(cpf_cliente, Num_conta, data_inicio ) 
VALUES("111.222.333-44","11765-2","2015-12-22" );

INSERT INTO tb_historico(cpf_cliente, Num_conta, data_inicio ) 
VALUES("666.777.888-99","11765-2","2016-10-05" );

INSERT INTO tb_historico(cpf_cliente, Num_conta, data_inicio ) 
VALUES("555.444.777-33","21010-7","2012-08-29" );

INSERT INTO tb_telefone_cliente(cpf_cli, telefone) 
VALUES("111.222.333-44","(83)3222-1234");

INSERT INTO tb_telefone_cliente(cpf_cli, telefone) 
VALUES("666.777.888-99","(83)99443-9999");

ALTER TABLE tb_telefone_cliente MODIFY telefone VARCHAR(15);

-- UPDATE tb_telefone_cliente SET="(83)99443-9999" WHERE cpf_cli="666.777.888-99";

INSERT INTO tb_telefone_cliente(cpf_cli, telefone) 
VALUES("666.777.888-99","(83)3233-2267");

DELETE FROM tb_conta WHERE Num_conta="11765-2";

SET SQL_SAFE_UPDATES = 0;

UPDATE tb_agencia SET Num_agencia = 6342 WHERE Num_agencia= 322;






























CREATE TABLE vendedor(
codigo INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
salario DECIMAL(8,2),
telefone INT,
sexo CHAR(1),
CHECK (sexo in ('m', 'f'))
);

CREATE TABLE fabricante(
codigo INT PRIMARY KEY NOT NULL,
nome VARCHAR(100) NOT NULL
);

CREATE TABLE produto(
codigo INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
preco DECIMAL(8,2),
fabricante INT,
FOREIGN KEY (fabricante) REFERENCES fabricante(codigo) ON DELETE RESTRICT
);

CREATE TABLE cliente(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
nome_rua VARCHAR(60),
bairro VARCHAR(40),
cep INT NOT NULL,
cpf VARCHAR(15) UNIQUE,
uf CHAR(2),
telefone INT NOT NULL,
desconto DECIMAL(3,1),
sexo char(1),
CHECK (sexo in ('m','f')),
CHECK (uf IN ('AC','AL','AP','AM','BA','CE','DF','ES','GO','MA','MT','MS','MG','PA','PB','PR','PE','PI','RJ','RN','RS','RO','RR','SC','SP','SE','TO'))
);

CREATE TABLE pedido(
id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
tipopagamento VARCHAR(100),
dataentrada DATE NOT NULL,
dataembarque DATE NOT NULL,
desconto DECIMAL(3,1),
valortotal DECIMAL(8,2) NOT NULL,
telefone INT NOT NULL,
formapagamento VARCHAR(40),
FOREIGN KEY (cliente) REFERENCES cliente(id) ON DELETE RESTRICT
);

CREATE TABLE itemPedido(
codigoproduto INT,
idpedido INT,
quantidade INT NOT NULL,
PRIMARY KEY (codigoproduto,idpedido),
FOREIGN KEY (codigoproduto) REFERENCES produto(codigo) ON DELETE RESTRICT,
FOREIGN KEY (idpedido) REFERENCES pedido(id) ON DELETE RESTRICT
);

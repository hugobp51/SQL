INSERT INTO tb_colaborador(ID,nome,sexo,dataADM)
values(1,'maria','k','2022-01-17');

INSERT INTO tb_colaborador(ID,nome,sexo,dataADM)
VALUES (3,'jose maria da silva','m','2023-01-02');

ALTER TABLE tb_colaborador MODIFY nome VARCHAR(60);

INSERT INTO tb_colaborador(nome,ID,sexo)
VALUES ('pedro',4,'m');


-- inserindo dados tabela empresa:

INSERT INTO tb_empresa(cnpj,fantasia,uf) VALUES (101,'tecoteco','pb'),(102,'rara','pe'),
(103,'big','pb'),(104,'assai','pb');

INSERT INTO tb_empresa VALUES(105,'mix','pb');

SELECT * FROM tb_empresa order by uf desc, fantasia asc;

SELECT cnpj AS CNPJ, fantasia AS EMPRESA from tb_empresa WHERE cnpj>102 AND uf='pb' ORDER BY uf ASC;
-- filtrando melhor a pesquisa

UPDATE tb_empresa SET fantasia='carrefour' WHERE cnpj='104';
-- trocando o valor dentro da tabela 

SET SQL_SAFE_UPDATES = 1; -- desabilitando ou habilitando o modo de segurança de dados em UPDATE para mudar mais de um dado

UPDATE tb_empresa SET fantasia='Do dia' WHERE uf='pe';

-- Apagar dados das tabelas

DELETE FROM tb_empresa WHERE cnpj='104';

INSERT INTO tb_empresa VALUES(104,'assai','pe');

DELETE FROM tb_empresa WHERE cnpj <= '104';

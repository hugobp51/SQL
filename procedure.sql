/* Store Procedure */

/* CREATE PROCEDURE sp+nomeprocebdimento ( p_parâmetros)
<instruções SQL: SELECT/ DELETE / UPDATE / INSERT > */

/* CALL sp_nomeprocedimento - Executar o procedimento */
/* DROP PROCEDURE sp_nomeprocedimento - Apagar o procedimento */

# Ex.: 
#	DELIMITER $$
#	CREATE PROCEDURE test1 (p1,p2,p3)
#	SELECT ...
# 	...
# 	...
# 	END $$

/* Criar um procedimento armazenado para consultar todos os dados da tabela livros */

DELIMITER $$
CREATE PROCEDURE exemplo1()
SELECT * FROM tb_livro;
$$

CALL exemplo1;
-----------------------------------------------------------------------------------------------------
/* Criar um procedimento armazenado qe envie uma mensagem ao usuário que 
está tentando acessar a base de dados e o mesmo não tem
permissão de acesso. Coloque a seguinte mensagem: Uusuário não autorizado! */

DELIMITER $$
CREATE PROCEDURE sp_exemplo2()
BEGIN
	SELECT 'Usuário não autorizado!' as Mensagem;
END $$

CALL sp_exemplo2;
-----------------------------------------------------------------------------------------------------
/* Criar um procedimento armazenado para inserir dados na tabela editora onde o usuário 
chamará o procedimento fornecendo os dados a serem inseridos na tabela */

DELIMITER $$
CREATE PROCEDURE sp_exemplo3(IN p_codigo INT, p_nome VARCHAR(20))
BEGIN
	INSERT INTO tb_editora (codigo, nome) 
    VALUES
    (p_codigo, p_nome);
END $$

CALL sp_exemplo3(10, 'Singular');
CALL sp_exemplo3(10, 'Singular');

-----------------------------------------------------------------------------------------------------
/* Crirar um procedimento para consultar códpgp da editora, nome do assunto, titulo do livro, ano do lvro e valor do livro */

DELIMITER $$
CREATE PROCEDURE sp_exemplo4()
BEGIN
	SELECT tb_editora.codigo, tb_assunto.nome, tb_livro.titulo, tb_livro.ano, tb_livro.valor
    FROM tb_editora, tb_assunto, tb_livro
    WHERE tb_editora.codigo=tb_livro.editora AND tb_assunto.sigla=tb_livro.assunto;
END $$

	CALL sp_exemplo4;
    
-----------------------------------------------------------------------------------------------------
/* Crirar um procedimento para consultar códpgp da editora, nome do assunto, titulo do livro, ano do lvro e valor do livro passando
como parametro o nome da editora */

DELIMITER $$
CREATE PROCEDURE sp_exemplo5(IN p_nome VARCHAR(20))
BEGIN
	SELECT a.nome, l.titulo, l.ano, l.valor 
    FROM tb_assunto a, tb_livro l, tb_editora e
    WHERE a.sigla=l.assunto AND e.codigo=l.editora
    AND e.nome=p_nome;
END $$

CALL sp_exemplo5('saraiva');


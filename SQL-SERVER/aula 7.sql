-- TRIGGER
--- TG_teste emitirá um aviso toda vez que um registro for incluido na tabela cargo
  
SELECT * INTO COPYCARGO FROM CARGO--- Joga os dados na tabela de copia do cargo

CREATE TRIGGER TG_Teste1
	ON COPYCARGO
		AFTER INSERT
AS
PRINT 'Um registro foi inserido na tabela COPYCARGO...'

INSERT INTO COPYCARGO VALUES ('99', 'Registro Testel', '80', '3')

--- TG_Teste2 que irá somar 10 reais no valor da inscrição dos professor,
--- a cada vez que um registro for alterado na tabela copycargo
CREATE TRIGGER TG_Teste2
	ON COPYCARGO
		AFTER UPDATE
AS
	UPDATE COPYCARGO
	SET valor_inscricao = valor_inscricao+10
	WHERE descricao LIKE 'PROF%'

UPDATE COPYCARGO SET grau=7 WHERE codcargo=5

--- Tg_Cancela realiza o rollback em qualquer ação sendo insert, update, delete
CREATE TRIGGER TG_Cancela
	ON COPYCARGO
		FOR INSERT, UPDATE, DELETE
AS
  BEGIN
		PRINT 'AÇÃO CANCELADA . . .'
		ROLLBACK
  END

INSERT INTO COPYCARGO VALUES ('88',  'DBA', '100', '4')
UPDATE COPYCARGO SET grau=7 WHERE codcargo=14

--- TG_Test4 realiza o update de 50% sempre que realiza algum insert
SELECT * INTO COPYCARGO2 FROM CARGO

CREATE TRIGGER TG_Teste4
	ON COPYCARGO2
		INSTEAD OF INSERT
AS
	BEGIN
		UPDATE COPYCARGO2
		SET valor_inscricao = valor_inscricao*1.5
	END

insert into COPYCARGO2 values ('100', 'TESTE', 40, 2)

---- TG_Cancela2  não deixa excluir nenhum dado da tabela
SELECT * INTO COPYINSCRITOS FROM INSCRITOS
SELECT * FROM COPYINSCRITOS

CREATE TRIGGER TG_Cancela2
	ON COPYINSCRITOS
		AFTER DELETE
AS
  BEGIN
		PRINT 'Houve tentativa de exclusão de dados....Ação cancelada'
		ROLLBACK
  END

 DELETE FROM COPYINSCRITOS
 WHERE  nome = 'renato fonseca oliveira'; 

 --- TG_VALOR_INSERIDO criando tabela
  SELECT * FROM INSERTED WHERE CPF IS NULL
 select * from USUARIO
 CREATE TABLE USUARIO
 (
	CPF NUMERIC(11) NOT NULL PRIMARY KEY,
	NOME VARCHAR(50) NOT NULL,
	EMAIL VARCHAR(50) NOT NULL,
	FONE VARCHAR(50) NOT NULL
 )

 CREATE TRIGGER TG_VALOR_INSERIDO
 ON USUARIO
 AFTER INSERT
 AS
	IF(SELECT COUNT(*) FROM inserted) = 1
		PRINT 'O registro foi inserido com sucesso'

INSERT INTO USUARIO (CPF, NOME, EMAIL,FONE) VALUES (18509565606,'Gutierrez', 'gutierrez@gmail.com', '(91)998587456')

--- Tg atualza o valor da tabela 
 CREATE TRIGGER TG_ATUALIZA_VALOR
 ON USUARIO
	FOR UPDATE
 AS
	IF(SELECT COUNT(*) FROM deleted) <> 0
		SELECT * FROM deleted
		SELECT * FROM inserted

UPDATE USUARIO
	SET NOME = 'Carlos Gutierrez'
	WHERE NOME='Gutierrez'

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
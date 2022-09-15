--- TG_teste emitirá um aviso toda vez que um registro for incluido na tabela cargo
 
SELECT * INTO COPYCARGO FROM CARGO --- Joga os dados na tabela de copia do cargo

CREATE TRIGGER TG_Teste1
	ON COPYCARGO
		AFTER INSERT
AS
PRINT 'Um registro foi inserido na tabela COPYCARGO...'

INSERT INTO COPYCARGO VALUES ('99', 'Registro Testel', '80', '3')
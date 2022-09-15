---------------------------------------------
USE VENDAS2022
GO
CREATE TABLE CAIXA 
   (
	DATA			DATE,
	SALDO_INICIAL	DECIMAL(10,2),
	SALDO_FINAL		DECIMAL(10,2)
   )
--------------------------------------------
INSERT INTO CAIXA VALUES (getdate(), 100, 100)
---------------------------------------------
CREATE TABLE VENDAS 
   (
	DATA			DATE,
	CODIGO		INT,
	VALOR		DECIMAL(10,2)
   )

---------------------------------------------
CREATE TRIGGER TG_ATUALIZA_SALDO
   ON VENDAS
        FOR INSERT
AS
    BEGIN
   DECLARE
   	   @VALOR	DECIMAL(10,2),
	   @DATA	DATE
   SELECT @DATA = DATA, @VALOR = VALOR FROM INSERTED
   UPDATE CAIXA 
		SET SALDO_FINAL = SALDO_FINAL + @VALOR
  		WHERE DATA = @DATA
    END
---------------------------------------------
INSERT INTO VENDAS VALUES ('2022-09-15', 1, 150)
INSERT INTO VENDAS VALUES ('2022-09-15', 2, 100)

---------------------------------------------
CREATE TRIGGER TG_ESTORNO_CAIXA
   ON VENDAS
       FOR DELETE
AS
    BEGIN
        DECLARE
    @VALOR	DECIMAL(10,2),
    @DATA	DATE
       SELECT @DATA = DATA, @VALOR = VALOR FROM DELETED
       UPDATE CAIXA 
	SET SALDO_FINAL = SALDO_FINAL -  @VALOR
	WHERE DATA = @DATA
    END
---------------------------------------------
DELETE FROM VENDAS WHERE CODIGO=1
---------------------------------------------
SELECT * FROM VENDAS
SELECT * FROM CAIXA

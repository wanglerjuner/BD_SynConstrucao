--CRIAÇÃO DA TABELA--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE TABLE PRODUTOS (

    COD_PROD INT PRIMARY KEY IDENTITY (1,1),
    NOME_PROD VARCHAR(255) NOT NULL,
    QTD_PROD INT,
    NF_PROD VARCHAR(20),
    DATA_PROD DATETIME,
    LAST_UPDATE DATETIME
);


--PRIMEIRO INSERT (NECESSARIO PARA QUE A PROCEDURE FUNCIONE)
INSERT INTO PRODUTOS ( NOME_PROD,QTD_PROD, NF_PROD,DATA_PROD,LAST_UPDATE)
VALUES ( 'PARAFUSO', '5', '123456789',  GETDATE(), GETDATE())


--EXCLUIR OU LIMPAR TABELA
//DROP TABLE PRODUTOS;
//TRUNCATE TABLE PRODUTOS;

SELECT * FROM PRODUTOS



--PROCEDURE PARA INSERIR-------------------------------------------------------------------------------------------------------
CREATE PROCEDURE INSERE_PROD 

	@nome_produto varchar(255),
	@quantidade_produto varchar(10),
	@notafiscal_produto VARCHAR(20)
AS 
BEGIN
	declare	@vInserir int;
		IF EXISTS(SELECT NOME_PROD FROM PRODUTOS WHERE NOME_PROD = @nome_produto)
		SELECT 'PRODUTO JA  CADASTRADO' AS ANALISE
		
	ELSE 
	
	
		insert into produtos ( NOME_PROD, QTD_PROD,NF_PROD,DATA_PROD,LAST_UPDATE)
			values ( @nome_produto, @quantidade_produto,@notafiscal_produto, GETDATE(), GETDATE());
END;
GO
´--EXECUTAR PROCEDURE (CAMPOS OBRIGATORIOS 'NOME DO PRODUTO', 'QUANTIDADE' E 'NOTA FISCAL'
EXEC INSERE_PROD 'TIJOLO',10, '1235928982'

--EXCLUIR PROCEDURE
//DROP PROCEDURE INSERE_PROD






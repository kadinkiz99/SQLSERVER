---- TRIGGER DELETE 

CREATE TRIGGER TRG_TRANSACTION_DELETE -- TRIGGER ?SM? 
ON ITEMTRANSECTION --HANG? TABLO ?ZER?NDE ?ALI?ACAK 
AFTER DELETE              -- HANG? ??LME ???N TET?KLEME YAPILACAK 
AS 
BEGIN
  DECLARE @ITEMID AS INT 
  DECLARE @AMOUNT AS INT 
  DECLARE @IOTYPE AS SMALLINT 

   SELECT @ITEMID= @ITEMID , @AMOUNT= AMOUNT , @IOTYPE=IOTYPE FROM DELETED

     IF @IOTYPE =1 -- G?R?? YAPILAN KAYDI S?LM?? ?SEM  
        UPDATE STOCK SET STOCK =STOCK-@AMOUNT WHERE @ITEMID=@ITEMID -- STOCK AZLATMA ??LEM? 
     IF @IOTYPE =2 -- ?IKI? YAPILDI ?SE 
        UPDATE STOCK SET STOCK =STOCK+@AMOUNT WHERE @ITEMID=@ITEMID --STOCK ARTIRM ??LEM? 
END 



----------------------------------------------

-- TR?GGER DELET TET?KLEME 

SELECT * FROM ITEMS WHERE ID=1
SELECT * FROM [dbo].[ITEMTRANSECTION] WHERE ITEMID=1
SELECT *FROM STOCK WHERE ITEMID=1

DELETE FROM [ITEMTRANSECTION] WHERE ID =1
-- user defined functions

CREATE  FUNCTION DBO.TOPLA (@SAYI1 AS INT , @SAYI2 AS INT )
RETURNS INT 
AS BEGIN 

DECLARE @SONUC AS INT 
SET @SONUC = @SAYI1 + @SAYI2
RETURN  @SONUC 

END 

SELECT DBO.TOPLA(25, 30)
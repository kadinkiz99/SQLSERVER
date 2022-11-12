-- ��ER�S�NE TABLODAN DO�UM TAR�H� ALIP YA�INI BULAN FONKS�YON 
CREATE FUNCTION DBO.CALCULATE_AGE (@BIRTHDATE AS DATETIME)
RETURNS INT 
AS BEGIN

DECLARE @RESULT AS INT 
SET @RESULT = DATEDIFF(YEAR,@BIRTHDATE,GETDATE())
RETURN @RESULT 
END 
-- FONSK�YON DENEMES�N�N YAPILMASI 
SELECT DBO.CALCULATE_AGE('19910101')


-- �STEN�LEN TABLODAN DO�UM TAR�H� VER�LER�N�N �EK�L�P YA� HESAPLAMASININ YAPILMASI 
SELECT TOP 1000 *,
DBO.CALCULATE_AGE(BIRTHDATE) AS KULLANICIYASI
 FROM [dbo].[USERS]
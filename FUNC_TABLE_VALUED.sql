----- TABLE VALUED FUNCTION 
CREATE FUNCTION DBO.GET_ITEM_INFO(@ITEMID AS INT )
RETURNS TABLE 
AS 
RETURN 
(
SELECT
    MIN(UNITPRICE) AS MINPRICE,
    MAX(UNITPRICE) AS MAXPRICE,
	AVG(UNITPRICE) AS AVGPRICE,
	SUM(LINETOTAL) AS TOTALSALE,
	SUM(AMOUNT ) AS TOTLAMOUNT

FROM ORDERDETAILS WHERE ITEMID = @ITEMID
)
SELECT * FROM DBO.GET_ITEM_INFO(68)

--- B�RDEN FAZLA SATIR GET�RMEK ���N 
SET STATISTICS TIME ON -- CPU HIZINA BAKTIK 
SELECT TOP 100
ITM.ITEMCODE AS MALZEMEKODU ,ITM.ITEMNAME MALZEMEADI,
     ITEMINFO.MINPRICE AS ENDUSUKFIYAT,
     ITEMINFO.MAXPRICE AS YUKSEKFIYAT,
     ITEMINFO.AVGPRICE AS ORTALAMAFIYAT,
     ITEMINFO.TOTALSALE AS TOPLAMSATISTUTARI,
     ITEMINFO.TOTLAMOUNT AS TOPLAMSATISMIKTAR
  FROM  ITEMS ITM

CROSS APPLY DBO.GET_ITEM_INFO(ITM.ID)   AS  ITEMINFO
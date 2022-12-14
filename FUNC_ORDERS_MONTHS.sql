--ay ad?n? getiren fonskiyon 
 CREATE FUNCTION DBO.MONTHNAME_(@DATE AS DATETIME)
 RETURNS VARCHAR(10)
 AS 
 BEGIN 
 DECLARE @RESULT AS VARCHAR(10)
 IF DATEPART(MONTH,@DATE) =1  SET @RESULT='01.OCAK'
 IF DATEPART(MONTH,@DATE) =2  SET @RESULT='02.?UBAT'
 IF DATEPART(MONTH,@DATE) =3  SET @RESULT='03.MART'
 IF DATEPART(MONTH,@DATE) =4  SET @RESULT='04.N?SAN '
 IF DATEPART(MONTH,@DATE) =5  SET @RESULT='05.MAYIS'
 IF DATEPART(MONTH,@DATE) =6  SET @RESULT='06.HAZ?RAN'
 IF DATEPART(MONTH,@DATE) =7  SET @RESULT='07. TEMMUZ '
 IF DATEPART(MONTH,@DATE) =8  SET @RESULT='08.A?USTOS'
 IF DATEPART(MONTH,@DATE) =9  SET @RESULT='09.EYL?L'
 IF DATEPART(MONTH,@DATE) =10  SET @RESULT='10.EK?M'
 IF DATEPART(MONTH,@DATE) =11 SET @RESULT='11.KASIN'
 IF DATEPART(MONTH,@DATE) =12 SET @RESULT='12.ARALIK.'
 RETURN @RESULT
 END 

 SELECT DBO.MONTHNAME_('20190107')

 ---ORDERS TABLOSUNDA  FONSK?YON KULLANIMI
SELECT 
U.USERNAME_ KULLANICIADI  , U.NAMESURNAME ADSOYAD ,U.TELNR1,U.TELNR2 , ITM.CATEGORY1, ITM.CATEGORY2 ,
ITM.CATEGORY3, ITM.CATEGORY4,  C.COUNTRY ULKE ,CT.CITY SEHIR ,T.TOWN ILCE , A.ADDRESSTEXT ACIKADRES
,O.ID SIPARISID ,ITM.ITEMCODE URUNKODU ,ITM.ITEMNAME  URUNADI, ITM.BRAND MARKA,
OD.AMOUNT MIKTAR, OD.UNITPRICE BIRIMFIYAT,OD.LINETOTAL SATIRTOPLAMI ,
CONVERT(DATE,O.DATE_) AS SPARISTARIHI ,CONVERT(TIME,O.DATE_) AS SPARISZAMANI , 
DATEPART(YEAR,O.DATE_) AS YIL,
DBO.MONTHNAME_(O.DATE_) AY 
FROM 
ORDERDETAILS OD 
INNER JOIN ORDERS O ON OD.ORDERID=O.ID
INNER JOIN ITEMS ITM ON ITM.ID=OD.ID
INNER JOIN USERS U ON U.ID = O.USERID
INNER JOIN ADDRESS A ON A.ID= O.ADDRESSID
INNER JOIN COUNTRIES C ON C.ID=A.COUNTRYID
INNER JOIN CITIES CT ON CT.ID=A.CITYID
INNER JOIN TOWNS T ON T.ID = A.TOWNID
INNER JOIN PAYMENTS P ON P.ORDERID = O.ID
 

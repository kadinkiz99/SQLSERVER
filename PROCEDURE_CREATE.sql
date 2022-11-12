--stored procedure 
--TURN�KE KARTLI GE��� S�STEM� 

INSERT INTO WORKERS 
(WORKERCODE, WORKERNAME, GENDER, BIRTHDATE, TCNO, WORKERBARCODE )
VALUES ('1234567890' , 'A A ' , 'e','19900101','1234567890' ,NEWID())

INSERT INTO WORKERTRANSECTION 
( WORKERID, DATE_, IOTYPE, GATEID)
VALUES (1,'2020-04-12 17:32:34' , 'C' ,6)

SELECT *FROM WORKERTRANSECTION
SELECT *FROM WORKERS


TRUNCATE TABLE WORKERTRANSECTION

INSERT INTO WORKERTRANSECTION 
( WORKERID, DATE_, IOTYPE, GATEID)
VALUES (1,'2020-04-12 08:20:34' , 'G' ,6)

SELECT * FROM WORKERS WHERE WORKERBARCODE='67626C15-B9BF-42E8-AF03-6692839B4DC0'

---PROSED�R OLU�TURMA 

CREATE PROCEDURE SP_CART_CONTROL
@WORKERBARCODE AS VARCHAR(50)
AS 
BEGIN 
SELECT *FROM WORKERS WHERE WORKERBARCODE=@WORKERBARCODE
END 

--PROSED�R �A�IRMA 

EXEC SP_CART_CONTROL @WORKERBARCODE ='77626C15-B9BF-42E8-AF03-6692839B4DC0'

---CREATE PROCEDURE SP_CART_CONTROL --- 1 . YOL 
ALTER  PROCEDURE SP_CART_CONTROL
 @WORKERBARCODE AS VARCHAR(50)
AS 
BEGIN 
  IF EXISTS (SELECT *FROM WORKERS WHERE WORKERBARCODE=@WORKERBARCODE)
  BEGIN
   SELECT 'KART DO�RU '
  END 
ELSE 
  BEGIN
    SELECT 'KART GE�ERS�Z '
  END 
 
END 

---CREATE PROCEDURE SP_CART_CONTROL --- 2 . YOL 
ALTER  PROCEDURE SP_CART_CONTROL
 @WORKERBARCODE AS VARCHAR(100)
AS 
BEGIN 
  DECLARE @WORKERNAME AS VARCHAR(100)
  SELECT @WORKERNAME=@WORKERNAME FROM WORKERS WHERE WORKERCODE=@WORKERBARCODE
  IF @WORKERNAME IS NULL
  BEGIN
   RAISERROR ('KART GE�ERS�Z',16,1)
   RETURN 
  END 
ELSE 
  BEGIN 
  SELECT  @WORKERNAME
  END 
 
END 
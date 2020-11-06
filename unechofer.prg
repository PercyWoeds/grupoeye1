CLOSE DATABASES all
SET EXACT ON 
SET EXCLUSIVE OFF 

SELECT 1
USE x:\chofer

SELECT 2 
USE y:\chofer

SELECT 3
USE z:\chofer

SELECT 4
USE w:\chofer
INDEX on code TO x

GO top

SELECT 3
GO top


DO WHILE !EOF()
STORE code TO lcCode
STORE name TO lcName
SELECT 4

IF !SEEK(lcCode) AND !EMPTY(lcCode )
	APPEND BLANK
	REPLACE code WITH lcCode
	REPLACE name WITH lcName
ELSE 

	REPLACE name WITH lcName
ENDIF 
	
SELECT 3

IF !EOF()
	skip
ELSE 
	EXIT 
ENDIF 

ENDdo













CLOSE DATABASES all


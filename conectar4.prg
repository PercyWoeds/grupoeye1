SET PROCEDURE TO libreria 
SET EXACT ON 
SET EXCLUSIVE OFF 


nombre_servidor ='192.168.1.9\SQLEXPRESS'
nombre_base_datos ='wds'
nombre_usuario ='userpec'
clave_usuario ='123456'
_numero_conexion =""

BaseDatos = conectar_base_datos(nombre_servidor,nombre_base_datos,nombre_usuario,clave_usuario)
		

SELECT 1
USE rutas
GO TOP 

DO WHILE !EOF()

	STORE ALLTRIM(code) TO lcCode
	STORE ALLTRIM(RUTA) TO lcName


		aSql =	SQLExec( _numero_conexion, "SELECT * FROM busquedas_clientes WHERE TRIM(code) =  " + lcCode ,"tempoSQL1" )	
	
						
		if aSql = -1		
		 	wait wind "No existen transacciones pendientes "  nowait  	
		 	
		 		if sqlexec(_numero_conexion,"INSERT  INTO busquedas_clientes (CODE,RUTA ) VALUES (?lcCode,?lcName )" ) = 1
					=sqlcommit(_numero_conexion)
				else
					=sqlrollback(_numero_conexion)
					WAIT WINDOW "error de conexion "
				endif 	 	
		
		ELSE 
					
			if sqlexec(_numero_conexion,"UPDATE chofer  SET name =  "+  lcName +  " WHERE TRIM(code) = lcCode " )  = 1
			=sqlcommit(_numero_conexion)
			else
			=sqlrollback(_numero_conexion)
			endif 
		
				
		
 		endif  
	
	
SELECT 1

IF !EOF()
	skip
ELSE 
	EXIT 
ENDIF 

ENDdo

CLOSE DATABASES ALL 


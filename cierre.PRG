set proc to libreria 

nombre_servidor ='192.168.1.9\SQLEXPRESS'
nombre_base_datos ='XPUMP_DB'
nombre_usuario ='sa'
clave_usuario ='123456'

BaseDatos = conectar_base_datos(nombre_servidor,nombre_base_datos,nombre_usuario,clave_usuario)


  aSql =	SQLExec(_numero_conexion,  " EXEC  sp_CierreTurno_Transaccion "  )	
 IF aSql < 0
 	=MESSAGEBOX("Ha ocurrido un error en el cierre  ",16)
 	
 ENDIF

=SQLDISCONNECT(_numero_conexion) 





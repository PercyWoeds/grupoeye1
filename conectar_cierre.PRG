set proc to libreria 

nombre_servidor ='192.168.1.9\SQLEXPRESS'
nombre_base_datos ='XPUMP_DB'
nombre_usuario ='sa'
clave_usuario ='123456'

BaseDatos = conectar_base_datos(nombre_servidor,nombre_base_datos,nombre_usuario,clave_usuario)

lcCara = '1' 

aSql =	SQLExec(_numero_conexion,  "SELECT * FROM journal where nTurno_journal >= 2559 and nTurno_journal <= 2559  " , "tempo"  )	

sele Tempo
GO TOP
BROWSE
COPY TO c:\pventa\cierreturno2559 TYPE xls


=SQLDISCONNECT(_numero_conexion) 





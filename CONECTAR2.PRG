set proc to libreria 
PUBLIC _numero_conexion
nombre_servidor ='192.168.1.9\SQLEXPRESS'
nombre_base_datos ='XPUMP_DB'
nombre_usuario ='userpec'
clave_usuario ='123456'

BaseDatos = conectar_base_datos(nombre_servidor,nombre_base_datos,nombre_usuario,clave_usuario)

lcCara = '1' 
lcFecha = "2020/06/30"

aSql =	SQLExec(_numero_conexion,  "SELECT * FROM JOURNAL WHERE NTURNO_JOURNAL = 2864 "   , "tempo"  )	

sele Tempo
GO TOP

COPY TO c:\pventa\tmpset195



=SQLDISCONNECT(_numero_conexion) 





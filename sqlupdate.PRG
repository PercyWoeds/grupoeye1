PUBLIC _numero_conexion 
SET PROCEDURE TO libreria 

nombre_servidor ='192.168.1.9\SQLEXPRESS'
nombre_base_datos ='XPUMP_DB'
nombre_usuario ='userpec'
clave_usuario ='123456'

BaseDatos = conectar_base_datos(nombre_servidor,nombre_base_datos,nombre_usuario,clave_usuario)

lcIdJournal = 13867
nestado = "1"
=sqlexec(_numero_conexion,"UPDATE Journal SET nEstadoDesp =  "+  nestado +  " WHERE nId_Journal =  " + STR(lcIdJournal,6) )


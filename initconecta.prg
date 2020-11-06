SET PROCEDURE TO libreria 
PUBLIC nombre_servidor2
PUBLIC nombre_base_datos2
PUBLIC nombre_usuario2 
PUBLIC clave_usuario2
PUBLIC _numero_conexion2
nombre_servidor2 ='192.168.1.9\SQLEXPRESS'
nombre_base_datos2 ='wds'
nombre_usuario2 ='userpec'
clave_usuario2 ='123456'
_numero_conexion2 =""

BaseDatos = conectar_base_datos2(nombre_servidor2,nombre_base_datos2,nombre_usuario2,clave_usuario2)

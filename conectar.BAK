CLOSE DATABASES all

set proc to libreria 

nombre_servidor ='DESKTOP-LEIGGBU\SQLEXPRESS'
nombre_base_datos ='XPUMP_DB'
nombre_usuario ='sa'
clave_usuario ='123456'


xhora = TIME()
xhh = SUBSTR(xhora,1,2)
xmm = "5"


BaseDatos = conectar_base_datos(nombre_servidor,nombre_base_datos,nombre_usuario,clave_usuario)

lcCara = '4' 
*SELECT DATEPART(MINUTE, ffecha_journal) AS Minutes ,* FROM JOURNAL WHERE nLado_Surtidor =  " + lcCara + " and nEstadoDesp  IS NULL and DATEPART(MINUTE, ffecha_journal) AS Minutes <  " + xmm 
aSql =	SQLExec(_numero_conexion, "SELECT * FROM JOURNAL WHERE nEstadoDesp is null", "tempo1" )



SELECT tempo1 

GO TOP
BROWSE

IF FOUND()
	WAIT WIND "OK"
ELSE
	WAIT WIND "NOT "
ENDI 

=SQLDISCONNECT(_numero_conexion) 
CLOSE DATABASES all





FUNCTION _MapDrive(tcDrive, tcResource, tcPassword)
LOCAL lnRet

DECLARE INTEGER WNetAddConnection IN WIN32API;
STRING @lpzRemoteName, STRING @lpzPassword,;
STRING @lpzLocalName

IF PARAMETERS() < 3
 lnRet = WNetAddConnection( @tcResource, 0, @tcDrive)
ELSE
 lnRet = WNetAddConnection( @tcResource, @tcPassword, @tcDrive)
ENDIF
 
IF lnRet # 0
* RETURN "Error "+ALLT(STR(lnRet))+" al conectar el drive "+tcDrive
 RETURN lnRet
ENDIF
RETURN ""
ENDFUNC
 
*Llamar ==>
* _MapDrive("Z:","\\FISG01\despacho")
* 85 Unidad ya esta conectada.
Function nomfile
******************
para cext
fileprt=substr(dtoc(date()),1,2)+ substr(dtoc(date()),4,2)+ substr(time(),1,2)+;
		substr(time(),4,2)+cext
sufijo='0'
do while file(fileprt)
		fileprt=stuff(fileprt,len(fileprt)-len(sufijo)+1,len(sufijo),sufijo)
		sufijo=allt(str(val(sufijo)+1,3))
enddo
RETURN (fileprt)

*------------------
function encripta
para pwd
cadena=""
for i=1 to len(pwd)
	cadena=cadena+chr(asc(substr(pwd,i,1))+len(pwd))
endf
retu cadena


**********************
* VALIDA RUC SUNAT
**********************
FUNCTION ValidaRuc(lcNroRuc)
	IF LEN(ALLTRIM(lcNroRuc)) <> 11 THEN
		RETURN .F.
	ENDIF
	LOCAL aArrayRuc
	DIMENSION aArrayRuc(3,11)
	FOR i = 1 TO 11
		aArrayRuc(1,i)=VAL(SUBS(lcNroRuc,i,1))
	ENDFOR
	aArrayRuc(2,1)=5
	aArrayRuc(2,2)=4
	aArrayRuc(2,3)=3
	aArrayRuc(2,4)=2
	aArrayRuc(2,5)=7
	aArrayRuc(2,6)=6
	aArrayRuc(2,7)=5
	aArrayRuc(2,8)=4
	aArrayRuc(2,9)=3
	aArrayRuc(2,10)=2
	aArrayRuc(3,11)=0
	FOR i=1 TO 10
		aArrayRuc(3,i) = aArrayRuc(1,i) * aArrayRuc(2,i)
		aArrayRuc(3,11) = aArrayRuc(3,11) + aArrayRuc(3,i)
	ENDFOR
	lnResiduo = MOD(aArrayRuc(3,11),11)
	lnUltDigito = 11 - lnResiduo
	DO CASE
		CASE lnUltDigito = 11 OR lnUltDigito=1
			lnUltDigito = 1
		CASE lnUltDigito = 10 OR lnUltDigito=0
			lnUltDigito = 0
	ENDCASE
	IF lnUltDigito = aArrayRuc(1,11) THEN
		RETURN .T.
	ELSE
		RETURN .F.
	ENDIF
ENDFUNC

FUNCTION GoogleQR(pDato,pDimensiones,pImagen)
  WAIT WINDOW "Generando y descargando C�digo QR, espere por favor..." NOWAIT
  DECLARE LONG URLDownloadToFile IN "urlmon";
    LONG pCaller,;
    STRING szURL,;
    STRING szFileName,;
    LONG dwReserved,;
    LONG lpfnCB
  sURL ="https://chart.googleapis.com/chart?cht=qr&chs=" + ;
    pDimensiones + "&chld=Q&chl=" + STRTRAN(pDato,'&','%26')
  nRetVal = URLDownloadToFile (0, sURL, pImagen, 0, 0)
  WAIT CLEAR
  RETURN nRetVal
ENDFUNC



****FUNCIONES SQL SERVER*****

**** SE CONECTA A LA BASE DE DATOS ****

function conectar_base_datos(nombre_servidor,nombre_base_datos,nombre_usuario,clave_usuario)


	conectar="Driver={SQL Server};";
	+"Server="+nombre_servidor+";";
	+"Database="+nombre_base_datos+";";
	+"uid="+nombre_usuario+";"+"pwd="+clave_usuario+"; "
		
	nu_conexion=sqlstringconnect(conectar)

	if nu_conexion<=0
		messagebox('ESTE USUARIO NO TIENE CONEXION A LA BASE DE DATOS',64,'AVISO')
		return .f.
	else
		wait wind "Conecto con base de datos " NOWAIT 
		_numero_conexion=nu_conexion
		return .t.
	ENDIF

endfunc

function conectar_base_datos2(nombre_servidor,nombre_base_datos,nombre_usuario,clave_usuario)

	conectar="Driver={SQL Server};";
	+"Server="+nombre_servidor+";";
	+"Database="+nombre_base_datos+";";
	+"uid="+nombre_usuario+";"+"pwd="+clave_usuario+"; "
	
	nu_conexion=sqlstringconnect(conectar)

	if nu_conexion<=0
		messagebox('ESTE USUARIO NO TIENE CONEXION A LA BASE DE DATOS',64,'AVISO')
		return .f.
	else
		wait wind "Conecto con base de datos " NOWAIT 
		_numero_conexion2 = nu_conexion
		return .t.
	ENDIF

endfunc

**** INSERTA REGISTRO EN LA BASE DE DATOS RECIBIENDO LA TABLA, CADENA DE CAMPOS Y CADENA DE VALORES ****
function inserta_registro(tabla,campos,valores)

sql_insert='insert into '+tabla+' ('+campos+' ) '+'values ( '+valores+' ) '
if sqlexec(_numero_conexion,sql_insert)=1
=sqlcommit(_numero_conexion)
else
=sqlrollback(_numero_conexion)
endif
endfunc

**** ACTUALIZA REGISTRO EN LA BASE DE DATOS RECIBIENDO LA TABLA, CADENA DE CAMPOS Y CADENA DE VALORES ****
function actualiza_registro(tabla,campos,condicion)

sql_actualiza='update '+tabla+ ' set ' +campos+ ' where '+condicion
if sqlexec(_numero_conexion,sql_actualiza)=1
=sqlcommit(_numero_conexion)
else
=sqlrollback(_numero_conexion)
endif

endfunc

**** BUSCA SI EXISTE UN VALOR EN LA TABLA****



**** BUSCA SI EXISTE UN VALOR EN LA TABLA Y RETORNA EL CAMPO QUE SE ELIJE****

function busca_valor(nombre_tabla,campo_elije,condicion)

tempo='TE'+substr(sys(2015),3,8)

sql_busca_valor='select '+campo_elije+ ' from '+nombre_tabla+ ' where '+condicion
valor_retorna=''
sqlexec(_numero_conexion,sql_busca_valor,tempo)
if !empty('tempo')
select &tempo
combina=&tempo..&campo_elije
valor_retorna=combina
use
return valor_retorna
else
use
return valor_retorna
endif
endfunc

function retorna_query(tablas,campos,condicion)

tempo='TE'+substr(sys(2015),3,8)
if !empty(condicion)
sql_busca='select '+campos+ ' from '+tablas+ ' where '+condicion
else
sql_busca='select '+campos+ ' from '+tablas
endif
sqlexec(_numero_conexion,sql_busca,tempo)
return tempo
endfunc

function destruye_query(query)
if used ('&query')
select &query
use
endif
endfunc

function secuencia(tabla,campo,tipo,longitud)
tempo='TE'+substr(sys(2015),3,8)
sql_secuencia='select max'+'('+campo+') as '+campo +' from '+tabla
sqlexec(_numero_conexion,sql_secuencia,tempo)
secuencia=&tempo..&campo
SELECT &tempo
use
if tipo='N'
return secuencia+1
else
res=val(secuencia)+1
secuencia=replicate("0",longitud-(len(allt(str(res)))))+(allt(str(res)))
return secuencia
endif
ENDFUNC
FUNCTION Hora 
PARAMETERS cTiempo 
PRIVATE cHora 
cHora = SUBSTR(cTiempo,1,2) }
RETURN IIF(cHora < "13",STR(Val(cHora),2),STR(Val(cHora)-12,2))+":"+; 
SUBSTR(cTiempo,4,2)+IIF(cHora < "13"," a.m."," p.m.") 
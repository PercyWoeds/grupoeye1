WAIT WINDOW "Generando archivo..." nowait 
SET DELETED ON
SET DATE BRITISH 
SET CENTURY on
SET SAFETY off
set excl off

SELECT  td,	fecha	,turno	,cod_emp	,caja	,serie,	numero	,cod_cli	,ruc	,placa	,odometro,	cod_prod	,cantidad	,precio	,importe	,igv	,fpago,implista,cod_tar,km,chofer,tk_devol,	cod_sucu,	isla	,dni_cli,tipo;
FROM E:\myusb\GRUPOEYE\ISLA01\mo01rb WHERE  fecha >= CTOD("01/12/2018")  AND fecha<=ctod("09/12/2018")  into tabl ventasdias1
SELECT  td,	fecha	,turno	,cod_emp	,caja	,serie,	numero	,cod_cli	,ruc	,placa	,odometro,	cod_prod	,cantidad	,precio	,importe	,igv	,fpago,implista,cod_tar,km,chofer,tk_devol,	cod_sucu,	isla	,dni_cli,tipo;
FROM E:\myusb\GRUPOEYE\ISLA02\mo01rb WHERE  fecha >= CTOD("01/12/2018")  AND fecha<=ctod("09/12/2018")  into tabl ventasdias2
SELECT  td,	fecha	,turno	,cod_emp	,caja	,serie,	numero	,cod_cli	,ruc	,placa	,odometro,	cod_prod	,cantidad	,precio	,importe	,igv	,fpago,implista,cod_tar,km,chofer,tk_devol,	cod_sucu,	isla	,dni_cli,tipo;
FROM E:\myusb\GRUPOEYE\ISLA03\mo01rb WHERE  fecha >= CTOD("01/12/2018")  AND fecha<=ctod("09/12/2018")  into tabl ventasdias3



SELE ventasdias1 
REPLACE ALL tipo WITH "1"
REPLACE ALL placa WITH "0" FOR EMPTY(placa)
SELE ventasdias2
REPLACE ALL tipo WITH "1"
REPLACE ALL placa WITH "0" FOR EMPTY(placa)
SELE ventasdias3 
REPLACE ALL tipo WITH "1"
REPLACE ALL placa WITH "0" FOR EMPTY(placa)
appe from ventasdias2
appe from ventasdias1

COPY TO c:\pventa\data201811.csv TYPE csv

WAIT WINDOW "Archivo procesado "



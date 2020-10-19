publ cadena
pwd='210953'
cadena=""
for i=1 to len(pwd)
	cadena=cadena+chr(asc(substr(pwd,i,1))+len(pwd))
endf
?cadena

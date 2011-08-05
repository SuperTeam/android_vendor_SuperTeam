#!/bin/bash

SCRIPTDIR=`dirname $0`
. $SCRIPTDIR/mensajes.sh

if [ $# -lt 3 ]
then
   msgErr >&2 "Usage: $0 <dir1> <dir2> <file>"
   exit 1
fi

if [ ! -d $1 ]
then
    msgErr >&2 "El directorio $1 no existe"
    exit 1
fi

if [ ! -d $2 ]
then
    msgErr >&2 "El directorio $2 no existe"
    exit 1
fi

if [ -f $3 ]; then
	rm $3
fi
    	
msgStatus "Calculando las diferencias entre los directorios $1 y $2"
exec diff -qr $1 $2 | sort > $3

if [ "$?" -eq 0 ]; 
then
	msgOK "Diferencias obtenidas en el fichero $3"
	exit 0
else
    msgErr "No se ha podido obtener las diferencias correctamente"
    exit 1
fi
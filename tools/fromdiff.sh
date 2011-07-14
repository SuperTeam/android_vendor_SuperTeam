#!/bin/bash

isDIR=false
BUILDMASK=last_build
RELEASEMASK=last_release
PATCHMASK=last_patch

SCRIPTDIR=`dirname $0`
. $SCRIPTDIR/mensajes.sh

if [ $# -lt 3 ]
then
   msgErr >&2 "Usage: $0 <file> <dir|device> <release|patch>"
   exit 1
fi

if [ ! -f $1 ]
then
    msgErr >&2 "El fichero $1 no existe"
    exit 1
fi

#comprobamos si el segundo parámetro es un directorio o el dispositivo
#se diferencia en que el dispositivo no puede llevar el caracter /
if [[ "$2" =~ "/" ]]; then
	isDIR=true
fi

if $isDIR && [ ! -d $2 ]
then
    msgErr >&2 "El directorio $2 no existe"
    exit 1
fi

if [ "$3" == "release" ]
then
	MASK=$RELEASEMASK
else
    MASK=$PATCHMASK
fi

#borramos los ficheros que no están y copiamos los cambiados.

if ! $isDIR
then
	adb remount
fi

while read line; do
    if [[ "$line" =~ "$BUILDMASK" ]]; then
		if [[ "$line" =~ "Only" ]]; then
            base=${line#*Only in *}
            file=${base/: //}
		else
            base=${line%* and*}
            file=${base#*Files *}
		fi
        accion=copiar
    else
        base=${line#*Only in *}
        file=${base/: //}
        accion=borrar
    fi
    
    if [[ $accion == "copiar" ]]; then
    	FINALDIR=${file/build/$3}
    	if [ ! -d $file ]
    	then
    	   FINALDIR=${FINALDIR%*/*}
    	fi
    	if [ ! -d $FINALDIR ]
    	then
    		mkdir -p $FINALDIR
    	fi
    	
        if $isDIR
        then
        	if [ -d $file ]
        	then
                cp -rv $file/* ${file/build/$3}
        	else
                cp -v $file ${file/build/$3}
            fi
        else
            adb push $file .${file#*$BUILDMASK*}
        fi
    fi

    if [[ $accion == "borrar" ]]; then
        msgWarn "borrando $file"
        if $isDIR
        then
        	rm -r $file
        else
            adb shell rm -r .${file#*$MASK*}
        fi
    fi
done < $1

if ! $isDIR
then
    adb remount
fi
	
exit 0	
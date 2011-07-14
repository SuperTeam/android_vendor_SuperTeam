#!/bin/bash

#Inicializamos las variables
SCRIPTDIR=`dirname $0`
TOPDIR=`pwd`
DEVICE=$1
ROMDIR=$TOPDIR/out/target/product/$DEVICE
BUILDDIR=$ROMDIR/last_build
RELEASEDIR=$ROMDIR/last_release
PATCHDIR=$ROMDIR/last_patch
PUBLICDIR=$ROMDIR/last_public
CORES=$( cat /proc/cpuinfo | grep -c processor )

. $SCRIPTDIR/mensajes.sh

if [ $# -lt 1 ]
then
   msgErr >&2 "Usage: $0 <device>"
   exit 1
fi

option=0
while [ $option -ne 5 ]
do
    #inicializamos estados
    echo "Elige una opción:"
    echo "1: make"
    echo "2: squisher"
    echo "3: sincronizar"
    echo "4: crear patch"
    echo "5: salir"

    read option

    if [ $option -eq 5 ]; then
    		exit 0
    fi
	
    if [ "$OUT" = "" ]; then
    	. build/envsetup.sh
    	lunch team_$DEVICE-eng
    fi
	
    if [ $option -eq 1 ]; then
        make -j${CORES} showcommands otapackage
        if [ "$?" -eq 0 ]; then
            msgOK "Compilación correcta"
        else
            msgErr "Error en compilación"
        fi
    fi

    if [ $option -eq 2 ]; then
    	$SCRIPTDIR/squisher
        if [ "$?" -eq 0 ]; then
            msgOK "Personalización correcta"
        else
            msgErr "Error al ejecutar squisher"
        fi
    fi
    
    if [ $option -eq 3 ]; then
    	if [ -d $BUILDDIR ]; then
    		rm -r $BUILDDIR
    	fi
    	
    	mkdir -p $BUILDDIR
    	for f in `ls $OUT/SuperOSR*.zip`; do
            msgStatus "Descomprimiendo $f"
    	    unzip -qd $BUILDDIR/ $f
    	done  
		
    	if [ ! -d $RELEASEDIR ]; then
    		msgErr "No existe el directorio $RELEASEDIR, se mueve la versión build y se obvia la gestión de cambios"
    		mv $BUILDDIR $RELEASEDIR
    	fi
	
    	msgStatus "Calculando las diferencias con la anterior versión compilada"
    	$SCRIPTDIR/sacadiff.sh $BUILDDIR/system $RELEASEDIR/system $ROMDIR/diff.txt
		
        #borramos los ficheros que no están y copiamos los cambiados.
        $SCRIPTDIR/fromdiff.sh $ROMDIR/diff.txt $DEVICE release
        #actualizamos el directorio de la última release
        $SCRIPTDIR/fromdiff.sh $ROMDIR/diff.txt $RELEASEDIR release
    fi
    
    if [ $option -eq 4 ]; then
        if [ ! -d $PUBLICDIR ]; then
        	msgWarn "No existe un directorio con la versión actualmente publicada. Se crea uno nuevo. La propia ROM es el parche."
            cp -r $BUILDDIR $PUBLICDIR
        else
	    	if [ -d $PATCHDIR ]; then
	            rm -r $PATCHDIR
	        fi
	        mkdir $PATCHDIR
	        msgStatus "Calculando las diferencias con la anterior versión publicada"
	        $SCRIPTDIR/sacadiff.sh $BUILDDIR $PUBLICDIR $ROMDIR/public.diff.txt
            $SCRIPTDIR/fromdiff.sh $ROMDIR/public.diff.txt $PATCHDIR patch
	    fi        
    fi    	
done
	

#!/bin/bash

if [ $# -lt 1 ]
then
   echo >&2 "Usage: $0 <device>"
   exit 1
fi

#Inicializamos las variables
SCRIPTDIR=`dirname $0`
TOPDIR=`pwd`
DEVICE=$1
ROMDIR=$TOPDIR/out/target/product/$DEVICE
BUILDDIR=$ROMDIR/last_build
RELEASEDIR=$ROMDIR/last_release
PATCHDIR=$ROMDIR/last_patch
CORES=$( cat /proc/cpuinfo | grep -c processor )

. $( dirname $0 )/mensajes.sh

option=0
while [ $option -ne 4 ]
do
    #inicializamos estados
    echo "Elige una opción para compilar:"
    echo "1: make"
    echo "2: squisher"
    echo "3: patch"
    echo "4: salir"

    read option

    if [ $option -eq 4 ]; then
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
	
        if [ ! -d $PATCHDIR ]; then
            msgErr "No existe el directorio $PATCHDIR, se inicia una nueva versión del parche"
            mkdir $PATCHDIR
        fi
    
    	msgStatus "Calculando las diferencias con la anterior versión"
    	exec diff -qr $BUILDDIR/system $RELEASEDIR/system | sort > $ROMDIR/diff.txt
		
        #borramos los ficheros que no están y copiamos los cambiados.
    	adb remount
		while read line; do
		    if [[ "$line" =~ "$BUILDDIR" ]]; then
		    	base=${line#*$BUILDDIR*}
		        if [[ "$line" =~ "Only" ]]; then
		            file=${base/: //}
		        else
		            file=${base%* and*}
		        fi
		        accion=copiar
		    else
		        base=${line#*$RELEASEDIR*}
		        file=${base/: //}
		        accion=borrar
		    fi
		    if [[ $accion == "copiar" ]]; then
	            msgStatus "copiando $file"
	            adb push $BUILDDIR$file $file
		    	cp -r $BUILDDIR$file $RELEASEDIR$file
		    	cd $BUILDDIR
		    	cp --parents .$file $PATCHDIR
		    	cd ..
		    fi
		    if [[ $accion == "borrar" ]]; then
	            msgWarn "borrando $file"
	            adb shell rm -r $file
                rm -r $RELEASEDIR$file
                rm -r $PATCHDIR$file
		    fi 
		done < $ROMDIR/diff.txt	
		adb remount
    fi
done
	

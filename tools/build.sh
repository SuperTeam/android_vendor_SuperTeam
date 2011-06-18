#!/bin/bash

#Inicializamos las variables
TOPDIR=`pwd`
DEVICE=$1
ROMDIR=$TOPDIR/rom/$DEVICE
UNZIPDIR=$ROMDIR/last_build
RELEASEDIR=$ROMDIR/last_release

option=0
while [ ! $option -eq 3 ]; do
	echo "Elige una opción para compilar:"
	echo "1: make + squisher"
	echo "2: squisher"
	echo "3: salir"
	read option
	if [ $option -eq 3 ]; then
		exit 0
	fi
	
	if [ "$OUT" = "" ]; then
		. build/envsetup.sh
		lunch team_$DEVICE-eng
	fi
	
	if [ $option -eq 1 ]; then
	    make otapackage
	fi
	
	vendor/SuperTeam/tools/squisher
	
	if [ -d $UNZIPDIR ]; then
		rm -r $UNZIPDIR
	fi
	
	mk -p $UNZIPDIR
	for f in `ls $OUT/SuperOSR*.zip`; do
	    unzip -d $UNZIPDIR/ $f
	done  
	
	exec diff -qr $UNZIPDIR/system $RELEASEDIR/system | sort > $ROMDIR/diff.txt
	
#borramos los ficheros que no están y copiamos los cambiados.
	adb remount
	while read line; do
	#echo "adb push $line ${line:${#UNZIPDIR}}"
	    if [[ "$line" =~ "$UNZIPDIR" ]]; then
	    	base=${line#*$UNZIPDIR*}
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
	    	echo "adb push $UNZIPDIR$file $file"
	    	cp -r $UNZIPDIR$file $RELEASEDIR$file
	    fi
	    if [[ $accion == "borrar" ]]; then
	    	echo "adb exec rm -r $file"
	    	rm -r $RELEASEDIR$file
	    fi 
	done < $ROMDIR/diff.txt	
	adb remount
done
	
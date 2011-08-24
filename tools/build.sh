#!/bin/bash

# Copyright (C) 2011 SuperTeam.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


#Inicializamos las variables
SCRIPTDIR=`dirname $0`
TOPDIR=`pwd`
DEVICE=$1
ROMDIR=$TOPDIR/roms/$DEVICE
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

$SCRIPTDIR/preparasource.sh $1

option=0
while [ $option -ne 99 ]
do
    #inicializamos estados
    echo "Elige una opción:"
    echo " 1: make"
    echo " 2: squisher"
    echo " 3: sincronizar"
    echo " 4: crear parche"
    echo " 5: make + squisher + sincronizar"
    echo " 6: limpiar build"
    echo "99: salir"

    read option

    if [ "$OUT" = "" ]; then
    	. build/envsetup.sh
    	lunch team_$DEVICE-eng
        if [ "$?" -ne 0 ]; then
            continue
        fi
    fi
	
    if [ $option -eq 1 ] || [ $option -eq 5 ]; then
        make -j${CORES} otapackage
        if [ "$?" -eq 0 ]; then
            msgOK "Compilación correcta"
        else
            msgErr "Error en compilación"
            continue
        fi
    fi

    if [ $option -eq 2 ] || [ $option -eq 5 ]; then
    	$SCRIPTDIR/squisher
        if [ "$?" -eq 0 ]; then
            msgOK "Personalización correcta"
        else
            msgErr "Error al ejecutar squisher"
            continue
        fi
    fi
    
    if [ $option -eq 3 ] || [ $option -eq 5 ]; then
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
    	else
	
	    	msgStatus "Calculando las diferencias con la anterior versión compilada"
	    	$SCRIPTDIR/sacadiff.sh $BUILDDIR/system $RELEASEDIR/system $ROMDIR/diff.txt
	        cat $ROMDIR/diff.txt
	        
	        #actualizamos el directorio de la última release
			msgOK "¿Actualizar el directorio? (s/N): "
	    	read sync
	
		    if [ $sync == "s" ]; then
		        $SCRIPTDIR/fromdiff.sh $ROMDIR/diff.txt $RELEASEDIR release
		    fi
		    
	        #actualizamos el dispositivo
			msgOK "¿Actualizar el dispositivo? (s/N): "
	    	read sync
	
		    if [ $sync == "s" ]; then
		        $SCRIPTDIR/fromdiff.sh $ROMDIR/diff.txt $DEVICE release
		    fi
	    fi
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
            cd $PATCHDIR
            cp -r $SCRIPTDIR/META-INF .
            msgStatus "Comprimiendo parche"
            zip -qr ../update.zip .
            cd $TOPDIR
	        $SCRIPTDIR/firmar.sh $ROMDIR/update.zip $OUT/update.zip
	        if [ "$?" -eq 0 ]; then
		        msgOK "Fichero $OUT/update.zip creado correctamente"
	        else
	            msgErr "Error al firmar el fichero Fichero $OUT/update.zip"
	            continue
	        fi
	    fi        
    fi    	
    
    if [ $option -eq 6 ]; then
    	make clean
    fi
    
done
	

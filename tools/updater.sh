#!/bin/bash
# Copyright (C) 2011 SuperTeam Development Group.
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
#
#Inicializamos las variables
SCRIPTDIR=`dirname $0`
TOPDIR=`pwd`
DEVICE=$1
ROMDIR=$TOPDIR/roms/$DEVICE
PATCHDIR=$ROMDIR/last_patch
SCRIPTFILE=$PATCHDIR/META-INF/com/google/android/updater-script
DEVICEDIR=`find device -type d -name $1`

. $SCRIPTDIR/mensajes.sh

mBOOTDEV=`grep ST_BOOT_DEV $DEVICEDIR/updater.mk | cut -d "=" -f 2`
mBOOTDEV=${mBOOTDEV:1}

function write_mount (){
	mFS=`grep ST_$1_FS $DEVICEDIR/updater.mk | cut -d "=" -f 2`
	mBK=`grep ST_$1_BLOCK $DEVICEDIR/updater.mk | cut -d "=" -f 2`
	mNM=`grep ST_$1_NAME $DEVICEDIR/updater.mk | cut -d "=" -f 2`
	mDV=`grep ST_$1_DEV $DEVICEDIR/updater.mk | cut -d "=" -f 2`
	echo "mount(\""${mFS:1}"\", \""${mBK:1}"\", \""${mDV:1}"\", \""${mNM:1}"\");" >> $SCRIPTFILE
}

#Descomprimimos lo ficheros base para la instalación
unzip -o $SCRIPTDIR/META-INF.zip -d $PATCHDIR

#Creamos el script del instalador
if [ -f $SCRIPTFILE ]; then
	rm $SCRIPTFILE
fi

echo "ui_print(\"Instalando parche para SuperOSR.\");" >> $SCRIPTFILE
write_mount SYSTEM
write_mount DATA
echo "package_extract_dir(\"system\", \"/system\");" >> $SCRIPTFILE
echo "package_extract_dir(\"data\", \"/data\");" >> $SCRIPTFILE
echo "set_perm_recursive(1000, 1000, 0771, 0644, \"/data/app\");" >> $SCRIPTFILE
echo "unmount(\"/system\");" >> $SCRIPTFILE
echo "unmount(\"/data\");" >> $SCRIPTFILE
if [ -f $PATCHDIR/boot.img ]; then
	echo "assert(write_raw_image(\"boot.img\", \"boot\"));" >> $SCRIPTFILE
	#echo "package_extract_file(\"boot.img\", \""$mBOOTDEV"\");" >> $SCRIPTFILE
fi
echo "ui_print(\"Parche instalado. Gracias.\");" >> $SCRIPTFILE

msgStatus "Ya puede modificar el contenido de $PATCHDIR. Confirme para continuar"
	
read var

cd $PATCHDIR
msgStatus "Comprimiendo parches"
zip -qr ../update.zip .
cd $TOPDIR
$SCRIPTDIR/firmar.sh $ROMDIR/update.zip $OUT/update.zip
if [ "$?" -eq 0 ]; then
	msgOK "Fichero $OUT/update.zip creado correctamente"
else
    msgErr "Error al firmar el fichero Fichero $OUT/update.zip"
    exit -1
fi
	    
exit 0
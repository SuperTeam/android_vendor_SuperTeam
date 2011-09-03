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
LOWDEVICES=dream_sapphire
REPOLOWRES="packages/apps/Settings frameworks/base packages/apps/Parts packages/apps/Phone"

#No se puede subir el cambio al no ser nuestros repos
#system/media packages/apps/Nfc development packages/apps/Calendar frameworks/ex packages/inputmethods/LatinIME packages/providers/DownloadProvider
#packages/providers/CalendarProvider packages/providers/ContactsProvider packages/apps/Camera apps/QuickSearchBox
#apps/DeskClock apps/VoiceDialer apps/Email apps/Gallery apps/Music apps/Tag
#packages/wallpapers/Basic packages/wallpapers/LivePicker packages/wallpapers/MagicSmoke packages/wallpapers/MusicVisualization
#device/sample

#pendientes de subir el repo y no hacerlo por no tener conexión a internet
# vendor/htc
. $SCRIPTDIR/mensajes.sh

if [ $# -lt 1 ]
then
   msgErr >&2 "Usage: $0 <device>"
   exit 1
fi

if [ ! -d out/target/product/$DEVICE ]; then
	LASTDEVICEBUILD=`ls out/target/product`
	mv out out.$LASTDEVICEBUILD
	if [ -d out.$DEVICE ]; then
		mv out.$DEVICE out
	else
		mkdir out
	fi
fi

for d in $REPOLOWRES; do
   	cd $d;
   	msgInfo $d
    if [[ "$LOWDEVICES" =~ "$DEVICE" ]]; then
    	git checkout lowres
    else
    	git checkout gingerbread
    fi
    cd $TOPDIR
done

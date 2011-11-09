#!/bin/bash

# Copyright (C) 2011 The SuperTeam Development Group.
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

. $SCRIPTDIR/mensajes.sh

if [ $# -lt 1 ]
then
   msgErr >&2 "Usage: $0 <device>"
   exit 1
fi

if [ ! -d ../cache ]; then
	mkdir ../cache
fi

if [ ! -d out/target/product/$DEVICE ]; then
	LASTDEVICEBUILD=`ls out/target/product | head -n 1`
	if [ -n "$LASTDEVICEBUILD" ]; then
		mv out ../cache/out.$LASTDEVICEBUILD
	fi
	if [ -d ../cache/out.$DEVICE ]; then
		mv ../cache/out.$DEVICE out
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

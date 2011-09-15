#!/bin/bash
# Copyright (C) 2011 The Superteam Developer Group
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
GIT=git
PROJECTLIST=`cat $TOPDIR/android/default.xml | cut -d "\"" -f 2`

. $SCRIPTDIR/mensajes.sh

for d in $PROJECTLIST; do
	if [ "$1" = status ]; then
		if [ -d $d ]; then
			cd $d
			BRANCH=`$GIT status`
			if [[ "$BRANCH" =~ "Changes" ]] || [[ "$BRANCH" =~ "Untracked" ]]; then
				msgOK $d
				$GIT status
			fi
			cd $TOPDIR
		fi
	fi
done

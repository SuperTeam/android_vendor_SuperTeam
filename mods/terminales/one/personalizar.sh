#!/bin/bash
cd $1
# Eliminamos algunos apk's innecesarios
cd system
rm $1/system/etc/super/04superteam
rm $1/system/bin/fix_permissions
rm $OUT/repack.d/ota/system/media/bootanimation.zip

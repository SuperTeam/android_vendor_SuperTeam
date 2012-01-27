#!/bin/bash
. mensajes.sh
msgStatus "Personalizacion exclusiva"
rm $OUT/repack.d/ota/boot.img
rm -rf $OUT/repack.d/ota/system/app/SpareParts.apk
rm -rf $OUT/repack.d/ota/system/app/SpareParts2.apk

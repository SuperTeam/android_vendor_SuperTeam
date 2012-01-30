#!/bin/bash
. mensajes.sh
msgStatus "Personalizacion exclusiva"
rm $OUT/repack.d/ota/boot.img
rm -rf $OUT/repack.d/ota/system/app/SpareParts.*
rm -rf $OUT/repack.d/ota/system/app/SpareParts2.*
rm -rf $OUT/repack.d/ota/system/etc/super/04superteam

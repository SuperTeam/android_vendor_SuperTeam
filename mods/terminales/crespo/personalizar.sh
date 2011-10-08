#!/bin/bash
. mensajes.sh
msgStatus "Personalizacion exclusiva"
msgStatus " "
rm -rf $OUT/repack.d/ota/system/app/BooksPhone.apk
rm -rf $OUT/repack.d/ota/system/app/GlobalTime.apk
rm -rf $OUT/repack.d/ota/system/app/SpareParts.apk
rm -rf $OUT/repack.d/ota/system/app/SpareParts2.apk
rm -rf $OUT/repack.d/ota/system/etc/super/04superteam

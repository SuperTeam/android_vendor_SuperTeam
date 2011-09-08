#!/bin/bash
. mensajes.sh
msgStatus "Personalizacion exclusiva"
msgStatus " "
rm -rf $OUT/repack.d/ota/system/app/BooksPhone.apk
rm -rf $OUT/repack.d/ota/system/app/GlobalTime.apk
rm -rf $OUT/repack.d/ota/system/etc/super/04superteam
mv $OUT/repack.d/ota/system/media/bootanimation.zip $OUT/repack.d/ota/data/local/bootanimation.zip

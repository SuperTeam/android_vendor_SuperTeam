#!/bin/bash

# Eliminamos algunos apk's para dejar espacio en system
rm -rf $OUT/repack.d/ota/system/app/BooksPhone.apk
rm -rf $OUT/repack.d/ota/system/app/GlobalTime.apk
rm -rf $OUT/repack.d/ota/system/app/SpareParts.apk
rm -rf $OUT/repack.d/ota/system/app/SpareParts2.apk
# Borramos 02permisos para poder utilizar uno especial para passion
rm -rf $OUT/repack.d/ota/system/etc/super2/02permisos

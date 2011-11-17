#!/bin/bash

# Eliminamos algunos apk's para dejar espacio en system
rm -rf $OUT/repack.d/ota/system/app/Cyanbread.apk
rm -rf $OUT/repack.d/ota/system/app/Androidian.apk
rm -rf $OUT/repack.d/ota/system/app/BooksPhone.apk
rm -rf $OUT/repack.d/ota/system/app/GlobalTime.apk
rm -rf $OUT/repack.d/ota/system/app/SpareParts.apk
rm -rf $OUT/repack.d/ota/system/app/SpareParts2.apk
# Borramos 02permisos para poder utilizar uno especial para passion
rm -rf $OUT/repack.d/ota/system/etc/super2/02permisos


# Movemos algunos apk's a data
mv -f $OUT/repack.d/ota/system/app/BatCircular.apk $OUT/repack.d/ota/data/app/BatCircular.apk
mv -f $OUT/repack.d/ota/system/app/BatCircular2.apk $OUT/repack.d/ota/data/app/BatCircular2.apk
mv -f $OUT/repack.d/ota/system/app/BatNelo.apk $OUT/repack.d/ota/data/app/BatNelo.apk
mv -f $OUT/repack.d/ota/system/app/BatNumerada.apk $OUT/repack.d/ota/data/app/BatNumerada.apk

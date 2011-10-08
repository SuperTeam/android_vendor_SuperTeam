#!/bin/bash
. mensajes.sh
msgStatus "Personalizacion exclusiva"
msgStatus " "
# Eliminamos algunos archivos innecesarios
mv -f $OUT/repack.d/ota/system/app/BatCircular.apk $OUT/repack.d/ota/data/app/BatCircular.apk
mv -f $OUT/repack.d/ota/system/app/BatCircular2.apk $OUT/repack.d/ota/data/app/BatCircular2.apk
mv -f $OUT/repack.d/ota/system/app/BatNelo.apk $OUT/repack.d/ota/data/app/BatNelo.apk
mv -f $OUT/repack.d/ota/system/app/BatNumerada.apk $OUT/repack.d/ota/data/app/BatNumerada.apk
mv -f $OUT/repack.d/ota/system/app/Wallpapers.apk $OUT/repack.d/ota/data/app/Wallpapers.apk
mv -f $OUT/repack.d/ota/system/app/GenieWidget.apk $OUT/repack.d/ota/data/app/GenieWidget.apk
rm -rf $OUT/repack.d/ota/system/app/Cyanbread.apk
rm -rf $OUT/repack.d/ota/system/app/Androidian.apk
rm -rf $OUT/repack.d/ota/system/app/BooksPhone.apk
rm -rf $OUT/repack.d/ota/system/app/GlobalTime.apk
rm -rf $OUT/repack.d/ota/system/app/SpareParts.apk
rm -rf $OUT/repack.d/ota/system/app/SpareParts2.apk
rm -rf $OUT/repack.d/ota/system/backup
rm -rf $OUT/repack.d/ota/system/etc/super/03ctrlwipe
rm -rf $OUT/repack.d/ota/system/etc/super/04superteam
rm -rf $OUT/repack.d/ota/system/media/audio/ringtones/Theway.mp3
rm -rf $OUT/repack.d/ota/system/media/audio/ringtones/CrazyDream.ogg
rm -rf $OUT/repack.d/ota/system/media/audio/ringtones/DreamTheme.ogg
rm -rf $OUT/repack.d/ota/system/media/audio/ringtones/URSAMINOR.ogg
rm $OUT/repack.d/ota/system/media/bootanimation.zip

#Corregimos build.prop
msgStatus "Corregimos build.prop"
msgStatus " "
sed -i 's/ro.config.ringtone=Theway.mp3/ro.config.ringtone=Old_Phone.mp3/g' $OUT/repack.d/ota/system//build.prop

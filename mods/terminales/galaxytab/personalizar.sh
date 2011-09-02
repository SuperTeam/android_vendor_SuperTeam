#!/bin/bash
. mensajes.sh
msgStatus "Personalizacion exclusiva"
msgStatus " "
# Eliminamos algunos archivos innecesarios
rm -rf $OUT/repack.d/ota/system/app/LatinIME.apk
rm -rf $OUT/repack.d/ota/system/app/Torch.apk
rm -rf $OUT/repack.d/ota/system/etc/super/04superteam
rm -rf $OUT/repack.d/ota/boot.img
cp $OUT/kernel $OUT/repack.d/ota/zImage
cp $ANDROID_BUILD_TOP/device/samsung/galaxytab/Kernel_instalacion.zip $OUT/Kernel_instalacion.zip

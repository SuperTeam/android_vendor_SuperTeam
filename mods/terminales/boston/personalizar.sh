#!/bin/bash

# No queremos ejecutar este script al incio de la ROM.
rm $1/system/bin/fix_permissions
echo "Copiando Splash"
cp $ANDROID_BUILD_TOP/vendor/SuperTeam/mods/terminales/boston/custom/splash.img $OUT/repack.d/ota/
echo "Copiando Recovery"
cp $OUT/recovery.img $OUT/repack.d/ota/

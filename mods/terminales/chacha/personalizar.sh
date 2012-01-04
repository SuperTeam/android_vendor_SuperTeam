#!/bin/bash

echo "Running $0"

ROOTDIR=$1

# No queremos ejecutar este script al incio de la ROM.
# rm $1/system/bin/fix_permissions

cd $ROOTDIR/system
echo "Some build.prop edits"
#sed -i -e "s/ro.product.device=morrison/ro.product.device=morr/" build.prop
sed -i -e "s/^ro.product.locale.language=.*/ro.product.locale.language=en/" build.prop
sed -i -e "s/^ro.product.locale.region=.*/ro.product.locale.region=US/" build.prop

echo "Removing some big files to make space"

cd $ROOTDIR/system/app
rm LatinImeTutorial.apk
rm Development.*
rm BooksPhone.apk

cd $ROOTDIR/system/backup
rm com.mailtools.saveit*
rm net.jsecurity.printbot*
rm at.tomtasche.reader*

#cd $ROOTDIR/system/media
#mkdir -p $ROOTDIR/data/local/
#mv bootanimation.zip $ROOTDIR/data/local/

cd $ROOTDIR/system/media/audio/ringtones
rm Theway.mp3

cd $ROOTDIR/system/xbin
#rm bash 
rm irssi
rm vim

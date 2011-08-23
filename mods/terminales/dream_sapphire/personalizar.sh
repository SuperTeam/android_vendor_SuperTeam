#!/bin/bash
cd $1/system/app
# Eliminamos algunos apk's innecesarios
rm GenieWidget.apk
rm HtcCopyright.apk
rm HtcEmailPolicy.apk
rm HtcSettings.apk
rm LatinImeTutorial.apk
rm Development.*
mv Gallery.apk Gallery.app
rm BooksPhone.apk

cd ../media
mv bootanimation.zip ../../data/local/
cd audio/ringtones
rm Theway.mp3


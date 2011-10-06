#!/bin/bash
cd $1/system/app
# Eliminamos algunos apk's innecesarios
rm GenieWidget.apk
rm HtcCopyright.apk
rm HtcEmailPolicy.apk
rm HtcSettings.apk
rm LatinImeTutorial.apk
mv Gallery.apk Gallery.app
rm BooksPhone.apk

rm ../media/audio/ringtones/Theway.mp3


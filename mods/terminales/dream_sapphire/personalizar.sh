#!/bin/bash
cd $1/system/app
# Eliminamos algunos apk's innecesarios
rm GenieWidget.apk
rm HtcCopyright.apk
rm HtcEmailPolicy.apk
rm HtcSettings.apk
rm LatinImeTutorial.apk
rm SetupWizard.apk
rm Development.*

cd ../media
mv bootanimation.zip ../../data/local/
cd audio/ringtones
rm Theway.mp3

# Por falta de espacio movemos aplicaciones
mv BooksPhone.apk $1/data/app/com.google.android.booksPhone.apk

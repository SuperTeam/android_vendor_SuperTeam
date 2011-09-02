#!/system/bin/sh
#
#Llamade desde el control de WIPE, recupera la parte específica del terminal 
#como si fuera una ROM recién instalada
echo " "
echo "Recuperacion de datos personalizada"
cp /system/backup/configsup.cf /data/configsup.cf;
cp /system/backup/sup.config /data/sup.config;
cp /system/backup/gokeyboard /data/app/com.jb.gokeyboard-1.apk;
cp /system/backup/gokeyboardes /data/app/com.jb.gokeyboard.langpack.es-1.apk;
cp /system/backup/flash /data/app/com.adobe.flashplayer-1.apk;
cp /system/backup/light /data/app/com.devuni.flashlight-1.apk;
cp /system/backup/googleplus /data/app/com.google.android.apps.plus-1.apk;
cp /system/backup/honey /data/app/HoneyBread-Alpha-V4-signed.apk;
cp /system/backup/bln /data/app/neldar.bln.control.free-1.apk
cp /system/backup/voodoo /data/app/org.projectvoodoo.controlapp.apk;
sleep 3;

#!/system/bin/sh
#
#Llamade desde el control de WIPE, recupera la parte específica del terminal 
#como si fuera una ROM recién instalada
echo " "
echo "Recuperacion de datos personalizada"
cp /system/backup/flash /data/app/com.adobe.flashplayer-1.apk;
cp /system/backup/honey /data/app/HoneyBread-Alpha-V4-signed.apk;
sleep 2;

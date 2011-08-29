#!/system/bin/sh
#
#Llamade desde el control de WIPE, recupera la parte específica del terminal 
#como si fuera una ROM recién instalada
echo " "
echo "Recuperacion de datos personalizada"
cp /system/backup/configsup.cf /data/configsup.cf;
cp /system/backup/sup.config /data/sup.config;
cp /system/backup/tether /data/app/android.tether.apk;
sleep 1;

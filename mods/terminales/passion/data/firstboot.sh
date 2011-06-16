#!/system/bin/sh
#Script Post Instalacion por Super@tmel
# Script 12

busybox mount -o remount,rw /system

#Control de SupSetup
if [ -e /data/supsetup/sup.config ];
then
    echo "+++ Restaurando el backup del SupSetup";
	busybox cp -a /data/supsetup/sup.config /system/bin;
	busybox rm -f /data/supsetup/sup.config;
else
    echo "+++ No existe backup de SupSetup"
fi;

# SetCPU Clocking
# k
echo 245000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq;
echo 998400 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq;
echo ondemand > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor;
echo 40000 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate;
echo 50 > /proc/sys/vm/swappiness;

busybox mount -o remount,ro /system;

echo "+++ Ejecutando primera limpieza"
busybox rm -f -r /data/data/com.google.android.server.checkin;
busybox rm -f /data/app/com.SupSetupv16.apk;
busybox rm -f /data/app/com.SupSetupv16-1.apk;
busybox rm -f /data/app/com.SupSetupv16-2.apk;
busybox rm -f /system/sd/app/com.SupSetupv16.apk;
busybox rm -f /system/sd/app/com.SupSetupv16-1.apk;
busybox rm -f /system/sd/app/com.SupSetupv16-2.apk;
busybox rm -f /data/app/org.jros.SupSetupV20.apk;
busybox rm -f /data/app/org.jros.SupSetupV20-1.apk;
busybox rm -f /data/app/org.jros.SupSetupV20-2.apk;
busybox rm -f /system/sd/app/org.jros.SupSetupV20.apk;
busybox rm -f /system/sd/app/org.jros.SupSetupV20-1.apk;
busybox rm -f /system/sd/app/org.jros.SupSetupV20-2.apk;

sleep 1

echo "Instalando aplicaciones"
 for i in /data/*.apk ; do 
	install -c -D $i /data/app;
echo "+++ Ejectuando limpieza"
	busybox rm $i;
done;

echo "+++ Acabando"
if [ -e /data/firstboot.sh ];
    then
busybox rm -f /data/firstboot.sh;
fi;

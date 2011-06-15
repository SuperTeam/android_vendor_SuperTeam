#!/system/bin/sh
#Script Post Instalacion por Super@tmel
# Script 12

busybox mount -o remount,rw /system;

# SetCPU Clocking
#
echo 245760 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq;
echo 528000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq;
echo ondemand > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor;
echo 40000 > /sys/devices/system/cpu/cpufreq/ondemand/sampling_rate;
echo 60 > /proc/sys/vm/swappiness;

busybox mount -o remount,ro /system;

echo "+++ Acabando"
if [ -e /data/firstboot.sh ];
then
    busybox rm -f /data/firstboot.sh;
fi;

#!/sbin/sh
# customMTD boot only patcher
# get mtdparts from running recovery and patch boot.img with it
# Firerat 2011-01-17
KCMDline="mtdparts`cat /proc/cmdline|awk -Fmtdparts '{print $2}'`"
if [ "$KCMDline" = "mtdparts" ];
then
    # we shouldn't be running this script if no customMTD
    # but just in case exit here if no mtdparts found
    exit
fi
/tmp/unpackbootimg /tmp/boot.img /tmp/
origcmdline=`awk '{gsub(/\ .\ /,"");sub(/mtdparts.+)/,"");print}' /tmp/boot.img-cmdline|awk '{$1=$1};1'`
/tmp/mkbootimg --kernel /tmp/boot.img-zImage --ramdisk /tmp/boot.img-ramdisk.gz --cmdline "$origcmdline $KCMDline" --base `cat /tmp/boot.img-base` -o /tmp/boot.img

rm /tmp/boot.img-*

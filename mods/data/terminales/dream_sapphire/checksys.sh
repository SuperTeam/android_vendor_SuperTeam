#!/sbin/sh
#
# Find system information based on the kernel command line and populate 
# nfo.prop

baseband=`awk '{m=match($0,/androidboot.baseband=([0-9a-zA-Z\.]*)/) ; print(substr($0,RSTART+21,RLENGTH-21))}' < /proc/cmdline`
bootloader=`awk '{m=match($0,/androidboot.bootloader=([0-9a-zA-Z\.]*)/) ; print(substr($0,RSTART+23,RLENGTH-23))}' < /proc/cmdline`
radioseries=`echo $baseband | awk '{print(substr($0,0,4))}'`
custommtd=`awk '/mtdparts/ {print("CustomMTD")}' < /proc/cmdline`
smisize=`awk '{m=match($0,/smisize=([0-9a-zA-Z\.]*)/) ; print(substr($0,RSTART+8,RLENGTH-8))}' < /proc/cmdline`
board=`cat /proc/cpuinfo  | grep Hardware | awk '{print $3}'`

#write out a prop file for the updater script to read
echo "baseband=$baseband" > /tmp/nfo.prop
echo "bootloader=$bootloader" >> /tmp/nfo.prop
echo "radioseries=$radioseries" >> /tmp/nfo.prop
echo "custommtd=$custommtd" >> /tmp/nfo.prop
echo "smisize=$smisize" >> /tmp/nfo.prop
echo "sysboard=$board" >> /tmp/nfo.prop

#!/tmp/busybox sh

/tmp/busybox umount -l /system
/tmp/mke2fs -m 0 -O has_journal,extent,huge_file,flex_bg,uninit_bg,dir_nlink,extra_isize -L system -M /system /dev/block/stl9

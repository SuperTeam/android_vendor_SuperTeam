# Generic SuperTeam
PRODUCT_NAME := OSR
PRODUCT_BRAND := OSR
PRODUCT_DEVICE := generic

# Used by BusyBox
KERNEL_MODULES_DIR:=/system/lib/modules

# Tiny toolbox
TINY_TOOLBOX:=true

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_PROPERTY_OVERRIDES += \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false \
    ro.stats.devname=SuperTe@m \
    ro.stats.romname=SuperOSR

PRODUCT_PROPERTY_OVERRIDES += \
    ro.rommanager.developerid=supermvl \
    ro.sup.superteam

# Specific product packages
PRODUCT_PACKAGES += \
   AndroidTerm \
   libcyanogen-dsp \
   openvpn \
   Parts \
   Stk \
   Wallpapers


# Activa Voip
PRODUCT_COPY_FILES += \
     frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Common overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/SuperTeam/overlay/common

# T-Mobile theme engine
include vendor/SuperTeam/products/themes_common.mk

PRODUCT_COPY_FILES += \
    vendor/SuperTeam/prebuilt/common/bin/verify_cache_partition_size.sh:system/bin/verify_cache_partition_size.sh \
    vendor/SuperTeam/prebuilt/common/sd/vacio:system/sd/vacio \
    vendor/SuperTeam/prebuilt/common/etc/hosts:system/etc/hosts \
    vendor/SuperTeam/prebuilt/common/etc/super/00inicio:system/etc/super/00inicio \
    vendor/SuperTeam/prebuilt/common/etc/super/01sysctl:system/etc/super/01sysctl \
    vendor/SuperTeam/prebuilt/common/etc/super/03firstboot:system/etc/super/03firstboot \
    vendor/SuperTeam/prebuilt/common/etc/super/06mountdl:system/etc/super/06mountdl \
    vendor/SuperTeam/prebuilt/common/etc/super/20userinit:system/etc/super/20userinit \
    vendor/SuperTeam/prebuilt/common/etc/resolv.conf:system/etc/resolv.conf \
    vendor/SuperTeam/prebuilt/common/etc/sysctl.conf:system/etc/sysctl.conf \
    vendor/SuperTeam/prebuilt/common/etc/terminfo/l/linux:system/etc/terminfo/l/linux \
    vendor/SuperTeam/prebuilt/common/etc/terminfo/u/unknown:system/etc/terminfo/u/unknown \
    vendor/SuperTeam/prebuilt/common/etc/profile:system/etc/profile \
    vendor/SuperTeam/prebuilt/common/etc/init.local.rc:system/etc/init.local.rc \
    vendor/SuperTeam/prebuilt/common/bin/apps2sd:system/bin/apps2sd \
    vendor/SuperTeam/prebuilt/common/bin/actapps2sd:system/bin/actapps2sd \
    vendor/SuperTeam/prebuilt/common/bin/bootsound:system/bin/bootsound \
    vendor/SuperTeam/prebuilt/common/bin/compcache:system/bin/compcache \
    vendor/SuperTeam/prebuilt/common/bin/desap:system/bin/desap \
    vendor/SuperTeam/prebuilt/common/bin/fix_permissions:system/bin/fix_permissions \
    vendor/SuperTeam/prebuilt/common/bin/handle_compcache:system/bin/handle_compcache \
    vendor/SuperTeam/prebuilt/common/bin/logca:system/bin/logca \
    vendor/SuperTeam/prebuilt/common/bin/noap:system/bin/noap \
    vendor/SuperTeam/prebuilt/common/bin/reiniciar:system/bin/reiniciar \
    vendor/SuperTeam/prebuilt/common/bin/repapps:system/bin/repapps \
    vendor/SuperTeam/prebuilt/common/bin/rosystem:system/bin/rosystem \
    vendor/SuperTeam/prebuilt/common/bin/rwsystem:system/bin/rwsystem \
    vendor/SuperTeam/prebuilt/common/bin/supmar:system/bin/supmar \
    vendor/SuperTeam/prebuilt/common/bin/supmarc:system/bin/supmarc \
    vendor/SuperTeam/prebuilt/common/bin/sysinit:system/bin/sysinit \
    vendor/SuperTeam/prebuilt/common/bin/swap:system/bin/swap \
    vendor/SuperTeam/prebuilt/common/bin/thumbnails.sh:system/bin/thumbnails.sh \
    vendor/SuperTeam/prebuilt/common/bin/zip:system/bin/zip \
    vendor/SuperTeam/prebuilt/common/bin/zipalign:system/bin/zipalign \
    vendor/SuperTeam/prebuilt/common/xbin/htop:system/xbin/htop \
    vendor/SuperTeam/prebuilt/common/xbin/irssi:system/xbin/irssi \
    vendor/SuperTeam/prebuilt/common/xbin/openvpn-up.sh:system/xbin/openvpn-up.sh \
    vendor/SuperTeam/prebuilt/common/xbin/powertop:system/xbin/powertop

# Sonido para la rom
PRODUCT_COPY_FILES += \
	vendor/SuperTeam/prebuilt/common/media/audio/notifications/Bubbles.ogg:system/media/audio/notifications/Bubbles.ogg \
	vendor/SuperTeam/prebuilt/common/media/audio/notifications/codeccall.ogg:system/media/audio/notifications/codecall.ogg \
	vendor/SuperTeam/prebuilt/common/media/audio/notifications/eXcitement.ogg:system/media/audio/notifications/eXcitement.ogg \
	vendor/SuperTeam/prebuilt/common/media/audio/notifications/icq_message.ogg:system/media/audio/notifications/icq_message.ogg \
	vendor/SuperTeam/prebuilt/common/media/audio/notifications/Spacious.ogg:system/media/audio/notifications/Spacious.ogg \
	vendor/SuperTeam/prebuilt/common/media/audio/notifications/regulus.ogg:system/media/audio/notifications/regulus.ogg \
	vendor/SuperTeam/prebuilt/common/media/audio/alarms/Beeps.mp3:system/media/audio/notifications/Beeps.mp3 \
	vendor/SuperTeam/prebuilt/common/media/audio/alarms/Snooze.mp3:system/media/audio/notifications/Snooze.mp3 \
	vendor/SuperTeam/prebuilt/common/media/audio/ringtones/Old_Phone.mp3:system/media/audio/ringtones/Old_Phone.mp3 \
	vendor/SuperTeam/prebuilt/common/media/audio/ringtones/Theway.mp3:system/media/audio/ringtones/Theway.mp3 \
	vendor/SuperTeam/prebuilt/common/media/audio/ui/camera_click.ogg:system/media/audio/ui/camera_click.ogg \
	vendor/SuperTeam/prebuilt/common/media/audio/ui/Lock.ogg:system/media/audio/ui/Lock.ogg \
	vendor/SuperTeam/prebuilt/common/media/audio/ui/Unlock.ogg:system/media/audio/ui/Unlock.ogg \
	vendor/SuperTeam/prebuilt/common/media/audio/ui/VideoRecord.ogg:system/media/audio/ui/VideoRecord.ogg \
	vendor/SuperTeam/prebuilt/common/media/audio/ui/LowBattery.ogg:system/media/audio/ui/LowBattery.ogg

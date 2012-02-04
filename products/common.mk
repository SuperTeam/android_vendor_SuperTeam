# Generic SuperTeam
PRODUCT_NAME := OSR
PRODUCT_BRAND := OSR
PRODUCT_DEVICE := generic

#Skip test
LIBCORE_SKIP_TESTS   := true
PHONEAPP_SKIP_TESTS  := true
CAMERA_SKIP_TESTS    := true
FRAMEWORK_SKIP_TESTS := true

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
    ro.com.android.dataroaming=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.rommanager.developerid=supermvl \
    ro.sup.superteam \
    ro.stats.devname=SuperTe@m \
    ro.stats.romname=SuperOSR
    
# Default ringtone
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=Theway.mp3 \
    ro.config.notification_sound=Bubbles.ogg

# Specific product packages
PRODUCT_PACKAGES += \
   AndroidTerm \
   libcyanogen-dsp \
   openvpn \
   Parts \
   Stk \
   screenshot \
   CMScreenshot \
   Wallpapers \
   libWnnEngDic 

# Activa Voip
PRODUCT_COPY_FILES += \
     frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Common overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/SuperTeam/overlay/common

# T-Mobile theme engine
include vendor/SuperTeam/products/themes_common.mk

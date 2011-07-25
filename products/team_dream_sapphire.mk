# Inherit AOSP device configuration for dream_sapphire.
$(call inherit-product, device/htc/dream_sapphire/full_dream_sapphire.mk)

# Inherit some common SuperTeam stuff.
$(call inherit-product, vendor/SuperTeam/products/common.mk)

# Añadimos los temas
$(call inherit-product, vendor/SuperTeam/products/themes_small.mk)


#
# Setup device specific product configuration.
#
PRODUCT_NAME := team_dream_sapphire
PRODUCT_BRAND := google
PRODUCT_DEVICE := dream_sapphire
PRODUCT_MODEL := Dream/Sapphire
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_ID=FRG83 BUILD_DISPLAY_ID=GRJ22 BUILD_FINGERPRINT=tmobile/opal/sapphire/sapphire:2.2.1/FRG83/60505:user/release-keys PRIVATE_BUILD_DESC="opal-user 2.2.1 FRG83 60505 release-keys"


# Extra Dream/Sapphire overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/SuperTeam/overlay/dream_sapphire

# Build kernel
#PRODUCT_SPECIFIC_DEFINES += TARGET_PREBUILT_KERNEL=
#PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_DIR=kernel-magic
#PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_CONFIG=aosp_msm_defconfig

#Activa el ADWLauncher
PRODUCT_PACKAGES += \
   ADWLauncher

# Include apps
PRODUCT_PACKAGES += Gallery

# Enable Compcache by default on D/S
PRODUCT_PROPERTY_OVERRIDES += \
	ro.data.on=0 \
	ro.modversion=SuperOSR-ST@-DS-1-AW \
	ro.stats.romversion=1 \
	ro.compcache.default=18 \
	ro.config.alarm_alert=Beeps.mp3 \
	ro.config.ringtone=Theway.mp3 \
	ro.config.notification_sound=Bubbles.ogg \
	ro.product.multi_touch_enabled=true
  
# Use the audio profile hack
WITH_DS_HTCACOUSTIC_HACK := true

#Añadimos permisos extra
PRODUCT_COPY_FILES +=  \
  frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml  

PRODUCT_LOCALES := \
    es_ES \
    ca_ES \
    en_US \
    de_DE \
    eu_ES \
    fr_FR \
    it_IT \
    pt_PT \
    ru_RU \
    pl_PL \
    nl_NL \
    mdpi

PRODUCT_DEFAULT_LANGUAGE := es_ES

TARGET_BUILD_TYPE=release

# Inherit AOSP device configuration for galaxys.
$(call inherit-product, device/samsung/galaxysmtd/full_galaxysmtd.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/SuperTeam/products/common_full.mk)

# Include GSM stuff
$(call inherit-product, vendor/SuperTeam/products/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := team_galaxysmtd
PRODUCT_BRAND := samsung
PRODUCT_DEVICE := galaxysmtd
PRODUCT_MODEL := GT-I9000
PRODUCT_MANUFACTURER := samsung
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=soju BUILD_ID=GRJ22 BUILD_DISPLAY_ID=GRJ22 BUILD_FINGERPRINT=google/soju/crespo:2.3.4/GRJ22/121341:user/release-keys PRIVATE_BUILD_DESC="soju-user 2.3.4 GRJ22 121341 release-keys"

# Build kernel
#PRODUCT_SPECIFIC_DEFINES += TARGET_PREBUILT_KERNEL=
#PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_DIR=kernel-samsung
#PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_CONFIG=aosp_galaxys_defconfig

# Extra galaxys overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/SuperTeam/overlay/galaxysmtd

# Add app
PRODUCT_PACKAGES += \
	DSPManager \
	FM \
	Launcher2 \
	libRS \
	librs_jni

# Extra RIL settings
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.enable.managed.roaming=1 \
    ro.ril.oem.nosim.ecclist=911,112,999,000,08,118,120,122,110,119,995 \
    ro.ril.emc.mode=2

# Add additional mounts
PRODUCT_PROPERTY_OVERRIDES += \
    ro.additionalmounts=/mnt/emmc

#
# Set ro.modversion
#
PRODUCT_PROPERTY_OVERRIDES += \
    ro.modversion=SuperOSR-ST@-Galaxy-S-1-AW \
    ro.stats.romversion=1 \
    ro.config.play.bootsound=0

#
# Copy Samsung Galaxy S specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
	vendor/SuperTeam/prebuilt/galaxys/etc/super/02ctrlwipe:system/etc/super/02ctrlwipe \
	vendor/SuperTeam/prebuilt/galaxys/etc/super/04modulos:system/etc/super/04modulos \
	vendor/SuperTeam/prebuilt/galaxys/etc/super2/01launcher:system/etc/super2/01launcher \
	vendor/SuperTeam/prebuilt/galaxys/etc/super2/02permisos:system/etc/super2/02permisos \
	vendor/SuperTeam/prebuilt/galaxys/etc/super2/04control:system/etc/super2/04control

#PRODUCT_LOCALES := \
#    es_ES \
#    ca_ES \
#    en_US \
#    de_DE \
#    eu_ES \
#    fr_FR \
#    it_IT \
#    pt_PT \
#    ru_RU \
#    hdpi

#PRODUCT_DEFAULT_LANGUAGE := es_ES

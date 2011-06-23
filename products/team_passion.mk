# Inherit AOSP device configuration for passion.
$(call inherit-product, device/htc/passion/full_passion.mk)

# Inherit some common stuff.
$(call inherit-product, vendor/SuperTeam/products/common_full.mk)

# Include GSM stuff
$(call inherit-product, vendor/SuperTeam/products/gsm.mk)

# Broadcom FM
$(call inherit-product, vendor/SuperTeam/products/bcm_fm_radio.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := team_passion
PRODUCT_BRAND := google
PRODUCT_DEVICE := passion
PRODUCT_MODEL := Nexus One
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=passion BUILD_ID=GRJ22 BUILD_DISPLAY_ID=GRJ22 BUILD_FINGERPRINT=google/passion/passion:2.3.4/GRJ22/121341:user/release-keys PRIVATE_BUILD_DESC="passion-user 2.3.4 GRJ22 121341 release-keys"

# Build kernel
PRODUCT_SPECIFIC_DEFINES += TARGET_PREBUILT_KERNEL=
PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_DIR=kernel-2.6.37
PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_CONFIG=aosp_HAVS_mahimahi_defconfig

# Extra Passion overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/SuperTeam/overlay/passion

# Extra RIL settings
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.enable.managed.roaming=1 \
    ro.ril.oem.nosim.ecclist=911,112,999,000,08,118,120,122,110,119,995 \
    ro.ril.emc.mode=2

PRODUCT_PACKAGES += \
   DSPManager \
   hcitool \
   FM \
   Launcher2 \
   Torch

#
# Set ro.modversion
#
PRODUCT_PROPERTY_OVERRIDES += \
    ro.modversion=SuperOSR-ST@-Nexus-1-AW \
    ro.stats.romversion=1 \
    ro.config.play.bootsound=0

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
    hdpi

PRODUCT_DEFAULT_LANGUAGE := es_ES

# Inherit AOSP device configuration for Boston
$(call inherit-product, device/orange/Boston/device_Boston.mk)

# Inherit some common stuff.
$(call inherit-product, vendor/SuperTeam/products/common_full.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := team_boston
PRODUCT_BRAND := Orange
PRODUCT_DEVICE := Boston
PRODUCT_MODEL := Boston
PRODUCT_MANUFACTURER := Orange
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=Boston BUILD_ID=GRJ22 BUILD_DISPLAY_ID=GRJ90 BUILD_FINGERPRINT=google/passion/passion:2.3.4/GRJ22/121341:user/release-keys PRIVATE_BUILD_DESC="passion-user 2.3.4 GRJ22 121341 release-keys"

# Build kernel
TARGET_PREBUILT_KERNEL := device/orange/Boston/kernel

# overlays for Boston
PRODUCT_PACKAGE_OVERLAYS += vendor/SuperTeam/overlay/boston

PRODUCT_PACKAGES += \
   DSPManager \
   Gallery3D \
   Launcher2

#
# Set ro.modversion
#
PRODUCT_PROPERTY_OVERRIDES += \
    ro.data.on=1 \
    ro.modversion=SuperOSR-ST@-Boston-1-AW \
    ro.stats.romversion=1 \
    ro.config.play.bootsound=0

PRODUCT_LOCALES +:= \
    mdpi

PRODUCT_DEFAULT_LANGUAGE := es_ES
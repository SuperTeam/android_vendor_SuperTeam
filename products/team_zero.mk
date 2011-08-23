# Inherit AOSP device configuration for zero.
$(call inherit-product, device/geeksphone/zero/zero.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/SuperTeam/products/common_full.mk)

# Broadcom FM
#$(call inherit-product, vendor/SuperTeam/products/bcm_fm_radio.mk)

PRODUCT_PACKAGES += \
   DSPManager \
   Launcher2 \
   libRS

#
# Setup device specific product configuration.
#
PRODUCT_NAME := team_zero
PRODUCT_BRAND := geeksphone
PRODUCT_DEVICE := zero
PRODUCT_MODEL := Geeksphone ZERO
PRODUCT_MANUFACTURER := Geeksphone
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=geeksphone_zero BUILD_ID=FRG83 BUILD_DISPLAY_ID=GRJ90 BUILD_FINGERPRINT=qcom/msm7627_ffa/msm7627_ffa/7x27:2.2.1/FRG83/eng.SIMCOM.20110314.124514:user/test-keys PRIVATE_BUILD_DESC="msm7627_ffa-user 2.2.1 FRG83 eng.SIMCOM.20110314.124514 test-keys"

# Build kernel
TARGET_PREBUILT_KERNEL := device/geeksphone/zero/kernel
PRODUCT_SPECIFIC_DEFINES += TARGET_PREBUILT_KERNEL=device/geeksphone/zero/kernel

PRODUCT_PACKAGE_OVERLAYS += vendor/SuperTeam/overlay/zero

#
# Move dalvik cache to data partition where there is more room to solve startup problems
#
PRODUCT_PROPERTY_OVERRIDES += dalvik.vm.dexopt-data-only=1

#
# Set ro.modversion
#
PRODUCT_PROPERTY_OVERRIDES += \
    ro.data.on=0 \
    ro.modversion=SuperOSR-ST@-ZERO-1.01-AW \
    ro.stats.romversion=1.01 \
    ro.config.play.bootsound=0

PRODUCT_LOCALES +:= \
    mdpi

PRODUCT_DEFAULT_LANGUAGE := es_ES

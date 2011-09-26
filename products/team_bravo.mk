# Inherit AOSP device configuration for bravo.
$(call inherit-product, device/htc/bravo/full_bravo.mk)

# Inherit some common stuff.
$(call inherit-product, vendor/SuperTeam/products/common_full.mk)


# Broadcom FM
$(call inherit-product, vendor/SuperTeam/products/bcm_fm_radio.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := team_bravo
PRODUCT_BRAND := htc_wwe
PRODUCT_DEVICE := bravo
PRODUCT_MODEL := HTC Desire
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_ID=GRI40 BUILD_DISPLAY_ID=GRJ90 PRODUCT_NAME=htc_bravo BUILD_FINGERPRINT=htc_wwe/htc_bravo/bravo:2.3.3/GRI40/96875.1:user/release-keys TARGET_BUILD_TYPE=userdebug BUILD_VERSION_TAGS=release-keys PRIVATE_BUILD_DESC="3.14.405.1 CL96875 release-keys"

# Build kernel
#PRODUCT_SPECIFIC_DEFINES += TARGET_PREBUILT_KERNEL=
#PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_DIR=kernel-2.6.37
#PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_CONFIG=aosp_HAVS_mahimahi_defconfig

# Extra bravo overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/SuperTeam/overlay/bravo

# Extra RIL settings
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.enable.managed.roaming=1 \
    ro.ril.oem.nosim.ecclist=911,112,113,115,117,999,000,08,118,120,122,110,119,995 \
    ro.ril.emc.mode=2

PRODUCT_SPECIFIC_DEFINES += TARGET_PREBUILT_KERNEL=
PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_DIR=kernel-msm
PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_CONFIG=team_bravo_defconfig

PRODUCT_PACKAGE_OVERLAYS += vendor/SuperTeam/overlay/bravo

PRODUCT_PACKAGES += \
   DSPManager \
   hcitool \
   FM \
   Torch

#
# Set ro.modversion
#
PRODUCT_PROPERTY_OVERRIDES += \
    ro.data.on=0 \
    ro.modversion=SuperOSR-ST@-Desire-2.0.0 \
    ro.stats.romversion=2.0.0 \
    ro.ril.enable.managed.roaming=1 \
    ro.ril.oem.nosim.ecclist=911,112,113,115,117,999,000,08,118,120,122,110,119,995 \
    ro.ril.emc.mode=2 \
    ro.config.play.bootsound=0

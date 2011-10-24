# Inherit AOSP device configuration for zeppelin.
$(call inherit-product, device/htc/chacha/device_chacha.mk)

# Inherit some common stuff.
$(call inherit-product, vendor/SuperTeam/products/common_full.mk)

$(call inherit-product vendor/SuperTeam/products/bcm_fm_radio.mk)


#
# Setup device specific product configuration.
#
PRODUCT_NAME := team_chacha
PRODUCT_BRAND := htc
PRODUCT_DEVICE := chacha
PRODUCT_MODEL := A810e
PRODUCT_MANUFACTURER := HTC

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=chacha BUILD_ID=GRJ22 BUILD_DISPLAY_ID=GWK74 BUILD_FINGERPRINT=google/passion/passion:2.3.4/GRJ22/121341:user/release-keys PRIVATE_BUILD_DESC="passion-user 2.3.4 GRJ22 121341 release-keys"

# Extra Chacha overlay
#PRODUCT_PACKAGE_OVERLAYS += vendor/SuperTeam/overlay/chacha

# Add the Torch app
PRODUCT_PACKAGES += \
    Launcher2 \
    DSPManager \
    Torch

#
# Set ro.modversion
#
PRODUCT_PROPERTY_OVERRIDES += \
    ro.data.on=1 \
    ro.modversion=SuperOSR-chacha-2.2 \
    ro.stats.romversion=2.2 \
    ro.config.play.bootsound=0

PRODUCT_LOCALES := \
    en_US \
    es_ES \
    mdpi

#PRODUCT_SPECIFIC_DEFINES += TARGET_PRELINKER_MAP=$(TOP)/vendor/htc/chacha/prelink-linux-arm-msm722x.map

# Add the FM app
PRODUCT_PACKAGES += \
    FM \
    hcitool

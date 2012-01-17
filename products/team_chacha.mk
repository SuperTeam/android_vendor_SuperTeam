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
PRODUCT_MODEL := HTC ChaCha A810e
PRODUCT_MANUFACTURER := HTC

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_chacha BUILD_ID=GRJ90 BUILD_DISPLAY_ID=GRJ90 BUILD_FINGERPRINT=htc_europe/htc_chacha/chacha:2.3.5/GRJ90/189894.2:user/release-keys PRIVATE_BUILD_DESC="1.54.401.2 CL189894 release-keys"

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
    ro.modversion=SuperOSR-chacha-2.3 \
    ro.stats.romversion=2.3 \
    ro.config.play.bootsound=0

PRODUCT_LOCALES := \
    en_US \
    es_ES \
    en_GB \
    de_DE \
    fr_FR \
    zh_CN \
    nl_NL \
    mdpi

PRODUCT_SPECIFIC_DEFINES += TARGET_PRELINKER_MAP=$(TOP)/vendor/htc/chacha/prelink-linux-arm-msm722x.map

# Add the FM app
PRODUCT_PACKAGES += \
    FM \
    hcitool

# Inherit AOSP device configuration for zeppelin.
$(call inherit-product, device/motorola/zeppelin/zeppelin.mk)

# Inherit some common stuff.
$(call inherit-product, vendor/SuperTeam/products/common_full.mk)

$(call inherit-product vendor/SuperTeam/products/bcm_fm_radio.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := team_zeppelin
PRODUCT_BRAND := motorola
PRODUCT_DEVICE := zeppelin
PRODUCT_MODEL := MB501
PRODUCT_MANUFACTURER := Motorola

UTC_DATE := $(shell date +%s)
DATE     := $(shell date +%Y%m%d)

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=zeppelin \
    BUILD_ID=GRJ22 \
    BUILD_DISPLAY_ID=GWK74 \
    BUILD_FINGERPRINT=google/passion/passion:2.3.4/GRJ22/121341:user/release-keys \
    PRIVATE_BUILD_DESC="passion-user 2.3.4 GRJ22 121341 release-keys" \
    BUILD_NUMBER=${DATE} \
    BUILD_UTC_DATE=${UTC_DATE} \
    BUILD_VERSION_TAGS=release-keys \
    TARGET_BUILD_TYPE=user

# Extra Zeppelin overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/SuperTeam/overlay/zeppelin

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
    ro.modversion=SuperOSR-zeppelin-2.2 \
    ro.config.play.bootsound=0

# Goo updater app
PRODUCT_PROPERTY_OVERRIDES += \
    ro.goo.developerid=adlx \
    ro.goo.board=$(PRODUCT_DEVICE) \
    ro.goo.rom=SuperOSR \
    ro.goo.version=${UTC_DATE}

PRODUCT_LOCALES := \
    en_US \
    es_ES \
    ca_ES \
    en_GB \
    de_DE \
    eu_ES \
    fr_FR \
    it_IT \
    pt_PT \
    pt_BR \
    zh_CN \
    ko_KR \
    ru_RU \
    mdpi

# Add the FM app
PRODUCT_PACKAGES += FM

# Asian IME stuff
PRODUCT_PACKAGES += PinyinIME


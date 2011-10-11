# Inherit AOSP device configuration for zeppelin.
$(call inherit-product, device/motorola/zeppelin/zeppelin.mk)

# Inherit some common stuff.
$(call inherit-product, vendor/SuperTeam/products/common_full.mk)

$(call inherit-product vendor/SuperTeam/products/bcm_fm_radio.mk)


#
# Setup device specific product configuration.
#
PRODUCT_NAME := team_zeppelin_cn
PRODUCT_BRAND := motorola
PRODUCT_DEVICE := zeppelin
PRODUCT_MODEL := MB501
PRODUCT_MANUFACTURER := Motorola

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=zeppelin BUILD_ID=GRJ22 BUILD_DISPLAY_ID=GWK74 BUILD_FINGERPRINT=google/passion/passion:2.3.4/GRJ22/121341:user/release-keys PRIVATE_BUILD_DESC="passion-user 2.3.4 GRJ22 121341 release-keys"

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
    ro.modversion=SuperOSR-zeppelin_cn-2.1.1 \
    ro.stats.romversion=2.1.1 \
    ro.config.play.bootsound=0

PRODUCT_LOCALES := \
    en_US \
    zh_CN \
    ja_JP \
    ko_KR \
    ru_RU \
    mdpi

PRODUCT_DEFAULT_LANGUAGE := en_US

# Add the FM app
PRODUCT_PACKAGES += FM

# Asian IME stuff
PRODUCT_PACKAGES += OpenWnn PinyinIME libWnnEngDic libWnnJpnDic libwnndict

PRODUCT_SUBDEVICE := $(PRODUCT_DEVICE)_cn

# Inherit AOSP device configuration for morrison.
$(call inherit-product, device/motorola/morrison/morrison.mk)

# Inherit some common stuff.
$(call inherit-product, vendor/SuperTeam/products/common_full.mk)

$(call inherit-product vendor/SuperTeam/products/bcm_fm_radio.mk)


#
# Setup device specific product configuration.
#
PRODUCT_NAME := team_morrison_cn
PRODUCT_BRAND := motorola
PRODUCT_DEVICE := morrison
PRODUCT_MODEL := MB200
PRODUCT_MANUFACTURER := Motorola

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=morrison BUILD_ID=GRJ22 BUILD_DISPLAY_ID=GWK74 BUILD_FINGERPRINT=google/passion/passion:2.3.4/GRJ22/121341:user/release-keys PRIVATE_BUILD_DESC="passion-user 2.3.4 GRJ22 121341 release-keys"

# Extra overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/SuperTeam/overlay/morrison

PRODUCT_PACKAGES += \
    Launcher2 \
    DSPManager

PRODUCT_PACKAGES += FM

#
# Set ro.modversion
#
PRODUCT_PROPERTY_OVERRIDES += \
    ro.data.on=1 \
    ro.modversion=SuperOSR-morrison_cn-2.1 \
    ro.stats.romversion=2.1 \
    ro.config.play.bootsound=0

PRODUCT_LOCALES := \
    en_US \
    zh_CN \
    ja_JP \
    ko_KR \
    ru_RU \
    mdpi

PRODUCT_DEFAULT_LANGUAGE := en_US

# Asian IME stuff
PRODUCT_PACKAGES += OpenWnn PinyinIME libWnnEngDic libWnnJpnDic libwnndict

PRODUCT_SUBDEVICE := $(PRODUCT_DEVICE)_cn


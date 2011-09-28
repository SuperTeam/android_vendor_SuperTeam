# Inherit generic zeppelin stuff
$(call inherit-product, vendor/SuperTeam/products/team_zeppelin.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := team_zeppelin_cn

PRODUCT_PROPERTY_OVERRIDES += \
    ro.modversion=SuperOSR-zeppelin_cn-2.0.1 \

PRODUCT_LOCALES := \
    en_US \
    zh_CN \
    ja_JP \
    ko_KR \
    ru_RU \
    mdpi

# Asian IME stuff
PRODUCT_PACKAGES += OpenWnn PinyinIME libWnnEngDic libWnnJpnDic libwnndict

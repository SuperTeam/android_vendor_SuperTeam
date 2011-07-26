# Inherit AOSP device configuration for morrison.
$(call inherit-product, device/motorola/morrison/morrison.mk)

# Inherit some common stuff.
$(call inherit-product, vendor/SuperTeam/products/common_full.mk)

$(call inherit-product vendor/SuperTeam/products/bcm_fm_radio.mk)


#
# Setup device specific product configuration.
#
PRODUCT_NAME := team_morrison
PRODUCT_BRAND := motorola
PRODUCT_DEVICE := morrison
PRODUCT_MODEL := MB200
PRODUCT_MANUFACTURER := Motorola

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=morrison BUILD_ID=GRJ22 BUILD_DISPLAY_ID=GRJ90 BUILD_FINGERPRINT=google/passion/passion:2.3.4/GRJ22/121341:user/release-keys PRIVATE_BUILD_DESC="passion-user 2.3.4 GRJ22 121341 release-keys"

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
    ro.data.on=0 \
    ro.modversion=SuperOSR-morrison-1.0b2 \
    ro.stats.romversion=1.0b2 \
    ro.config.play.bootsound=0

PRODUCT_LOCALES := \
    es_ES \
    ca_ES \
    en_US \
    en_GB \
    de_DE \
    eu_ES \
    fr_FR \
    it_IT \
    zh_CN \
    pt_PT \
    pt_BR \
    ru_RU \
    mdpi

PRODUCT_DEFAULT_LANGUAGE := en_US

$(call inherit-product, device/htc/hero/full_hero.mk)

$(call inherit-product, vendor/SuperTeam/products/common_full.mk)


PRODUCT_NAME := team_hero
PRODUCT_BRAND := HTC
PRODUCT_DEVICE := hero
PRODUCT_MODEL := Hero
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_ID=GRI40 BUILD_DISPLAY_ID=GRI40 BUILD_FINGERPRINT=google/passion/passion/mahimahi:2.3.3/GRI40/102588:user/release-keys PRIVATE_BUILD_DESC="passion-user 2.3.3 GRI40 102588 release-keys"

PRODUCT_SPECIFIC_DEFINES += TARGET_PRELINKER_MAP=$(TOP)/vendor/SuperTeam/prelink-linux-arm-hero.map

PRODUCT_SPECIFIC_DEFINES += TARGET_PREBUILT_KERNEL=$(TOP)/vendor/SuperTeam/kernels/hero/kernel

PRODUCT_PACKAGE_OVERLAYS += vendor/SuperTeam/overlay/hero

PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.enable.managed.roaming=1 \
    ro.ril.oem.nosim.ecclist=911,112,999,000,08,118,120,122,110,119,995 \
    ro.ril.emc.mode=2

PRODUCT_PACKAGES += \
    Gallery

PRODUCT_PROPERTY_OVERRIDES += \
    ro.data.on=0 \
    ro.modversion=SuperOSR-ST@-Hero-1-AW \
    ro.stats.romversion=1 \
    ro.config.play.bootsound=0

PRODUCT_LOCALES := \
    es_ES \
    ca_ES \
    en_US \
    de_DE \
    eu_ES \
    fr_FR \
    it_IT \
    pt_PT \
    ru_RU \
    mdpi

PRODUCT_DEFAULT_LANGUAGE := es_ES

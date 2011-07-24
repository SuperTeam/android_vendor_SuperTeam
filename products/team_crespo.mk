# Inherit AOSP device configuration for crespo.
$(call inherit-product, device/samsung/crespo/full_crespo.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/SuperTeam/products/common_full.mk)


#
# Setup device specific product configuration.
#
PRODUCT_NAME := team_crespo
PRODUCT_BRAND := google
PRODUCT_DEVICE := crespo
PRODUCT_MODEL := Nexus S
PRODUCT_MANUFACTURER := Samsung
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=soju BUILD_ID=GRJ22 BUILD_DISPLAY_ID=GRJ22 BUILD_FINGERPRINT=google/soju/crespo:2.3.4/GRJ22/121341:user/release-keys PRIVATE_BUILD_DESC="soju-user 2.3.4 GRJ22 121341 release-keys" BUILD_NUMBER=121341

# Extra Crespo overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/SuperTeam/overlay/crespo

# Add the Torch app
PRODUCT_PACKAGES += \
    Launcher2 \
    DSPManager \
    Torch

# Extra RIL settings
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.enable.managed.roaming=1 \
    ro.ril.oem.nosim.ecclist=911,112,999,000,08,118,120,122,110,119,995 \
    ro.ril.emc.mode=2

#
# Set ro.modversion
#
PRODUCT_PROPERTY_OVERRIDES += \
    ro.data.on=0 \
    ro.modversion=SuperOSR-ST@-Nexus-S-1-AW \
    ro.stats.romversion=1 \
    ro.config.play.bootsound=0

#PRODUCT_LOCALES := \
#    es_ES \
#    ca_ES \
#    en_US \
#    de_DE \
#    eu_ES \
#    fr_FR \
#    it_IT \
#    pt_PT \
#    ru_RU \
#    hdpi

#PRODUCT_DEFAULT_LANGUAGE := es_ES

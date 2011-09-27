# Inherit device configuration for vivo.
$(call inherit-product, device/htc/pyramid/pyramid.mk)

# Inherit some common stuff.
$(call inherit-product, vendor/SuperTeam/products/common_full.mk)

# GSM stuff.
$(call inherit-product, vendor/SuperTeam/products/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := team_pyramid
PRODUCT_BRAND := htc
PRODUCT_DEVICE := pyramid
PRODUCT_MODEL := Sensation
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_pyramid BUILD_ID=GRJ22 BUILD_DISPLAY_ID=GRJ22 BUILD_FINGERPRINT="tmous/htc_pyramid/pyramid:2.3.4/GRJ22/125597.1:user/release-keys" PRVIATE_BUILD_DESC="1.45.531.1 CL125597 release-keys"

# Extra pyramid overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/SuperTeam/overlay/pyramid

# Add the Torch app
PRODUCT_PACKAGES += Torch

# Build GanOptimizer
PRODUCT_PACKAGES += GanOptimizer

# Extra RIL settings
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.enable.managed.roaming=1 \
    ro.ril.oem.nosim.ecclist=911,112,999,000,08,118,120,122,110,119,995 \
    ro.ril.emc.mode=2

PRODUCT_PACKAGES += \
   ADWLauncher \
   DSPManager 

#
# Set ro.modversion
#
PRODUCT_PROPERTY_OVERRIDES += \
    ro.data.on=0 \
    ro.modversion=SuperOSR-ST@-Pyramid-2.0.2-AW \
    ro.stats.romversion=2.0.2 \
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
    hdpi

PRODUCT_DEFAULT_LANGUAGE := es_ES

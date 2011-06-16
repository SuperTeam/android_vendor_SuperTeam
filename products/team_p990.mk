# Inherit device configuration
$(call inherit-product, device/lge/p990/p990.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/SuperTeam/products/common_full.mk)

# Include GSM stuff
$(call inherit-product, vendor/SuperTeam/products/gsm.mk)


#
# Setup device specific product configuration.
#
PRODUCT_NAME := team_p990
PRODUCT_BRAND := lge
PRODUCT_DEVICE := p990
PRODUCT_MODEL := Optimus 2x
PRODUCT_MANUFACTURER := LGE
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=lge_star BUILD_ID=FRG83G BUILD_DISPLAY_ID=GRJ22 BUILD_FINGERPRINT=lge/lge_star/p990/p990:2.2.2/FRG83G/lgp990-V10b.2ED2ADCFFC:user/release-keys PRIVATE_BUILD_DESC="star-user 2.2.2 FRG83G 2ED2ADCFFC release-keys"

# Extra lg overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/SuperTeam/overlay/p990

#
# Set ro.modversion
#
PRODUCT_PROPERTY_OVERRIDES += \
    ro.modversion=SuperOsr-ST@-Optimus2x-8.0 \
    ro.stats.romversion=8.0 \
    ro.config.play.bootsound=0

PRODUCT_PACKAGES += Launcher2 DSPManager Torch
    
PRODUCT_LOCALES := \
    es_ES \
    ca_ES \
    en_US \
    eu_ES \
    hdpi

PRODUCT_DEFAULT_LANGUAGE := es_ES
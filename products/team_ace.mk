# Inherit device configuration for ace.
$(call inherit-product, device/htc/ace/full_ace.mk)

$(call inherit-product, vendor/SuperTeam/products/common_full.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := team_ace
PRODUCT_BRAND := htc_wwe
PRODUCT_DEVICE := ace
PRODUCT_MODEL := Desire HD
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_ace BUILD_ID=GRI40 BUILD_DISPLAY_ID=GRJ90 BUILD_FINGERPRINT=htc_wwe/htc_ace/ace:2.3.3/GRI40/87995:user/release-keys PRIVATE_BUILD_DESC="2.50.405.2 CL87995 release-keys"

# Extra Ace overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/SuperTeam/overlay/ace

# Add the Torch app
PRODUCT_PACKAGES += \
    Launcher2 \
    DSPManager \
    Stk \
    Torch

# Add AicBootFix for ace battery fix
PRODUCT_PACKAGES += AicBootFix

# Broadcom FM radio
$(call inherit-product, vendor/SuperTeam/products/bcm_fm_radio.mk)

#
# Set ro.modversion
#
PRODUCT_PROPERTY_OVERRIDES += \
    ro.data.on=0 \
    ro.modversion=SuperOSR-ST@-DesireHD-S-2.0.8-AW \
    ro.stats.romversion=2.0.8 \
    ro.config.play.bootsound=0

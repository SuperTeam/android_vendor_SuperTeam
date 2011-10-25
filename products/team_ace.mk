$(call inherit-product, device/htc/ace/full_ace.mk)

$(call inherit-product, vendor/SuperTeam/products/common_full.mk)

PRODUCT_NAME := team_ace
PRODUCT_BRAND := htc_wwe
PRODUCT_DEVICE := ace
PRODUCT_MODEL := Desire HD
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_ace BUILD_ID=GRI40 BUILD_DISPLAY_ID=GWK74 BUILD_FINGERPRINT=htc_wwe/htc_ace/ace:2.3.3/GRI40/87995:user/release-keys PRIVATE_BUILD_DESC="2.50.405.2 CL87995 release-keys"

PRODUCT_PACKAGE_OVERLAYS += vendor/SuperTeam/overlay/ace

PRODUCT_PACKAGES += \
    AicBootFix \
    DSPManager \
    Launcher2 \
    Stk \
    Torch

$(call inherit-product, vendor/SuperTeam/products/bcm_fm_radio.mk)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.data.on=0 \
    ro.modversion=SuperOSR-ST@-DesireHD-S-2.2.4 \
    ro.stats.romversion=2.2.4 \
    ro.config.play.bootsound=0

#include vendor/SuperTeam/products/asian.mk
#PRODUCT_SUBDEVICE := $(PRODUCT_DEVICE)_cn

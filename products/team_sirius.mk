# Inherit AOSP device configuration for P4D Sirius.
$(call inherit-product, device/nvsbl/sirius/full_sirius.mk)

# Inherit some common SuperTeam stuff.
$(call inherit-product, vendor/SuperTeam/products/common_full.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := team_sirius
PRODUCT_BRAND := nvsbl
PRODUCT_DEVICE := sirius
PRODUCT_MODEL := P4D Sirius
PRODUCT_MANUFACTURER := Nvsbl
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=sirius BUILD_ID=GRK39F BUILD_FINGERPRINT=google/soju/crespo:2.3.6/GRK39F/189904:user/release-keys PRIVATE_BUILD_DESC="soju-user 2.3.6 GRK39F 189904 release-keys" BUILD_NUMBER=189904

PRODUCT_PACKAGE_OVERLAYS += vendor/SuperTeam/overlay/sirius

PRODUCT_PACKAGES += \
    Launcher2 \
    DSPManager

PRODUCT_PROPERTY_OVERRIDES += \
    ro.data.on=0 \
    ro.modversion=SuperOSR-ST@-Sirius-2.2.8 \
    ro.stats.romversion=2.2.8 \
    ro.config.play.bootsound=0

PRODUCT_LOCALES := es_ES ca_ES en_US de_DE eu_ES fr_FR it_IT pt_PT ru_RU hdpi

#include vendor/SuperTeam/products/asian.mk
#PRODUCT_SUBDEVICE := $(PRODUCT_DEVICE)_cn

$(call inherit-product, device/samsung/galaxytab/full_galaxytab.mk)

$(call inherit-product, vendor/SuperTeam/products/common_full.mk)

PRODUCT_NAME := team_galaxytab
PRODUCT_BRAND := samsung
PRODUCT_DEVICE := galaxytab
PRODUCT_MODEL := Galaxy Tab
PRODUCT_MANUFACTURER := Samsung
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=soju BUILD_ID=GRJ22 BUILD_DISPLAY_ID=GWK74 BUILD_FINGERPRINT=google/soju/crespo:2.3.4/GRJ22/121341:user/release-keys PRIVATE_BUILD_DESC="soju-user 2.3.4 GRJ22 121341 release-keys"

PRODUCT_PACKAGE_OVERLAYS += vendor/SuperTeam/overlay/galaxytab

PRODUCT_PACKAGES += \
    Launcher2 \
    DSPManager \
    Torch

PRODUCT_PROPERTY_OVERRIDES += \
    ro.additionalmounts=/mnt/sdcard/External_SD \
    ro.data.on=0 \
    ro.modversion=SuperOSR-ST@-GalaxyTab-2.2.8 \
    ro.config.play.bootsound=0

#include vendor/SuperTeam/products/asian.mk
#PRODUCT_SUBDEVICE := $(PRODUCT_DEVICE)_cn

$(call inherit-product, device/samsung/galaxysmtd/full_galaxysmtd.mk)

$(call inherit-product, vendor/SuperTeam/products/common_full.mk)

PRODUCT_NAME := team_galaxysmtd
PRODUCT_BRAND := samsung
PRODUCT_DEVICE := galaxysmtd
PRODUCT_MODEL := Galaxy S
PRODUCT_MANUFACTURER := samsung
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=soju BUILD_ID=GRJ22 BUILD_DISPLAY_ID=GWK74 BUILD_FINGERPRINT=google/soju/crespo:2.3.4/GRJ22/121341:user/release-keys PRIVATE_BUILD_DESC="soju-user 2.3.4 GRJ22 121341 release-keys"

PRODUCT_PACKAGE_OVERLAYS += vendor/SuperTeam/overlay/galaxysmtd

PRODUCT_PACKAGES += \
	DSPManager \
	FM \
	Launcher2 \
	libRS \
	librs_jni

PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.enable.managed.roaming=1 \
    ro.ril.oem.nosim.ecclist=911,112,999,000,08,118,120,122,110,119,995 \
    ro.ril.emc.mode=2 \
    ro.additionalmounts=/mnt/sdcard/External_SD \
    ro.data.on=0 \
    ro.modversion=SuperOSR-ST@-GalaxyS-2.2.6 \
    ro.stats.romversion=2.2.6 \
    ro.config.play.bootsound=0

#include vendor/SuperTeam/products/asian.mk
#PRODUCT_SUBDEVICE := $(PRODUCT_DEVICE)_cn

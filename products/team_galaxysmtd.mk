$(call inherit-product, device/samsung/galaxysmtd/full_galaxysmtd.mk)

$(call inherit-product, vendor/SuperTeam/products/common_full.mk)

PRODUCT_NAME := team_galaxysmtd
PRODUCT_BRAND := samsung
PRODUCT_DEVICE := galaxysmtd
PRODUCT_MODEL := Galaxy S
PRODUCT_MANUFACTURER := samsung
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=GT-I9000 BUILD_ID=GINGERBREAD BUILD_DISPLAY_ID=GWK74 BUILD_FINGERPRINT=samsung/GT-I9000/GT-I9000:2.3.5/GINGERBREAD/XXJVT:user/release-keys PRIVATE_BUILD_DESC="GT-I9000-user 2.3.5 GINGERBREAD XXJVT release-keys"

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
    ro.modversion=SuperOSR-ST@-GalaxyS-2.2.8 \
    ro.stats.romversion=2.2.8 \
    ro.config.play.bootsound=0

#include vendor/SuperTeam/products/asian.mk
#PRODUCT_SUBDEVICE := $(PRODUCT_DEVICE)_cn

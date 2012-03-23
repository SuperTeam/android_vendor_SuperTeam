$(call inherit-product, device/samsung/crespo/full_crespo.mk)

$(call inherit-product, vendor/SuperTeam/products/common_full.mk)

PRODUCT_NAME := team_crespo
PRODUCT_BRAND := google
PRODUCT_DEVICE := crespo
PRODUCT_MODEL := Nexus S
PRODUCT_MANUFACTURER := Samsung
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=soju BUILD_ID=GWK74 BUILD_DISPLAY_ID=GWK74 BUILD_FINGERPRINT=google/soju/crespo:2.3.7/GWK74/185293:user/release-keys PRIVATE_BUILD_DESC="soju-user 2.3.7 GWK74 185293 release-keys" BUILD_NUMBER=185293

# Build kernel
#Based in Kernel Netarchy cfs
#PRODUCT_SPECIFIC_DEFINES += TARGET_PREBUILT_KERNEL=
#PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_DIR=/media/COMPILER/mydroid/SuperTeam/kernel/samsung/Nexus-S
#PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_CONFIG=netarchy-nexus-cfs_defconfig

PRODUCT_PACKAGE_OVERLAYS += vendor/SuperTeam/overlay/crespo

PRODUCT_PACKAGES += \
    Launcher2 \
    DSPManager \
    Torch

PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.enable.managed.roaming=1 \
    ro.ril.oem.nosim.ecclist=911,112,999,000,08,118,120,122,110,119,995 \
    ro.ril.emc.mode=2 \
    ro.data.on=0 \
    ro.modversion=SuperOSR-ST@-NexusS-2.2.8 \
    ro.config.play.bootsound=0

#include vendor/SuperTeam/products/asian.mk
#PRODUCT_SUBDEVICE := $(PRODUCT_DEVICE)_cn



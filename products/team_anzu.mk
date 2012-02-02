$(call inherit-product, device/semc/anzu/device_anzu.mk)

$(call inherit-product, vendor/SuperTeam/products/common_full.mk)

PRODUCT_NAME := team_anzu
PRODUCT_BRAND := SEMC
PRODUCT_DEVICE := anzu
PRODUCT_MODEL := Xperia Arc
PRODUCT_MANUFACTURER := Sony Ericsson
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=LT15i BUILD_ID=4.0.2.A.0.42 BUILD_DISPLAY_ID=GWK74 BUILD_FINGERPRINT=SEMC/LT15i_1247-1061/LT15i:2.3.4/4.0.2.A.0.42/bn_P:user/release-keys PRIVATE_BUILD_DESC="LT15i-user 2.3.4 4.0.3.A.0.42 bn_P test-keys"

# Build kernel
#PRODUCT_SPECIFIC_DEFINES += TARGET_PREBUILT_KERNEL=
#PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_DIR=kernel-msm
#PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_CONFIG=team_anzu_defconfig

# Extra anzu overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/SuperTeam/overlay/anzu

PRODUCT_PACKAGES += \
    Stk \
    Torch

PRODUCT_PROPERTY_OVERRIDES += \
    ro.data.on=0 \
    ro.modversion=SuperOSR-ST@-XperiaArc-S-4.0.0 \
    ro.stats.romversion=4.0.0 \
    ro.config.play.bootsound=0

PRODUCT_RELEASE_NAME := XperiaArc-LT15i

#include vendor/SuperTeam/products/asian.mk
#PRODUCT_SUBDEVICE := $(PRODUCT_DEVICE)_cn

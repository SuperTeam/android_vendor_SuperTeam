# Inherit device configuration for GalaxyTab.
$(call inherit-product, device/samsung/galaxytab/full_galaxytab.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/SuperTeam/products/common_full.mk)


#
# Setup device specific product configuration.
#
PRODUCT_NAME := team_galaxytab
PRODUCT_BRAND := samsung
PRODUCT_DEVICE := galaxytab
PRODUCT_MODEL := Galaxy Tab
PRODUCT_MANUFACTURER := Samsung
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=soju BUILD_ID=GRJ22 BUILD_DISPLAY_ID=GRJ90 BUILD_FINGERPRINT=google/soju/crespo:2.3.4/GRJ22/121341:user/release-keys PRIVATE_BUILD_DESC="soju-user 2.3.4 GRJ22 121341 release-keys"

# Euro Tab
#PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=GT-P1000 BUILD_ID=FROYO BUILD_DISPLAY_ID=FROYO.XXJK5 BUILD_FINGERPRINT=samsung/GT-P1000/GT-P1000/GT-P1000:2.2/FROYO/XXJK5:user/release-keys PRIVATE_BUILD_DESC="GT-P1000-user 2.2 FROYO XXJK5 release-keys"

# for ATT Tab
#PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=SGH-I987 BUILD_ID=FROYO BUILD_DISPLAY_ID=FROYO.UCJK1 BUILD_FINGERPRINT=samsung/SGH-I987/SGH-I987/SGH-I987:2.2/FROYO/UCJK1:user/release-keys PRIVATE_BUILD_DESC="SGH-I987-user 2.2 FROYO UCJK1 release-keys"

# for TMO Tab
#PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=SGH-T849 BUILD_ID=FROYO BUILD_DISPLAY_ID=FROYO.UVJJB BUILD_FINGERPRINT=samsung/SGH-T849/SGH-T849/SGH-T849:2.2/FROYO/UVJJB:user/release-keys PRIVATE_BUILD_DESC="SGH-T849-user 2.2 FROYO UVJJB release-keys"

# Add the FM app
#PRODUCT_PACKAGES += FM

# Extra galaxytab overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/SuperTeam/overlay/galaxytab

# Add the Torch app
PRODUCT_PACKAGES += \
    Launcher2 \
    DSPManager \
    Torch

# Build kernel
#PRODUCT_SPECIFIC_DEFINES += TARGET_PREBUILT_KERNEL=
#PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_DIR=kernel-galaxytab
#PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_CONFIG=p1_android_rfs_eur_cm7_defconfig
#PRODUCT_SPECIFIC_DEFINES += TARGETARCH=arm

# Add additional mounts
PRODUCT_PROPERTY_OVERRIDES += \
ro.additionalmounts=/mnt/emmc \
ro.vold.switchablepair=/mnt/sdcard,/mnt/emmc

#
# Set ro.modversion
#
PRODUCT_PROPERTY_OVERRIDES += \
    ro.data.on=0 \
    ro.modversion=SuperOSR-ST@-GalaxyTab-2.0.2-AW \
    ro.stats.romversion=2.0.2 \
    ro.config.play.bootsound=0

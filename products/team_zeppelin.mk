# Inherit AOSP device configuration for zeppelin.
$(call inherit-product, device/motorola/zeppelin/zeppelin.mk)

# Inherit some common stuff.
$(call inherit-product, vendor/SuperTeam/products/common_full.mk)

$(call inherit-product vendor/SuperTeam/products/bcm_fm_radio.mk)

$(call inherit-product, vendor/SuperTeam/products/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := team_zeppelin
PRODUCT_BRAND := motorola
PRODUCT_DEVICE := zeppelin
PRODUCT_MODEL := CLIQ XT
PRODUCT_MANUFACTURER := Motorola

# Extra Zeppelin overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/SuperTeam/overlay/zeppelin

# Add the Torch app
PRODUCT_PACKAGES += \
    Launcher2 \
    DSPManager \
    Torch

#
# Set ro.modversion
#
PRODUCT_PROPERTY_OVERRIDES += \
    ro.modversion=SuperAosp-ST@-Zeppelin-S-1-AW \
    ro.stats.romversion=1 \
    ro.config.play.bootsound=0
#
# Copy Nexus S specific prebuilt files
#
PRODUCT_COPY_FILES +=  \
	vendor/SuperTeam/prebuilt/zeppelin/etc/super/02ctrlwipe:system/etc/super/02ctrlwipe \
	vendor/SuperTeam/prebuilt/zeppelin/etc/super/04modulos:system/etc/super/04modulos \
	vendor/SuperTeam/prebuilt/zeppelin/etc/super2/01launcher:system/etc/super2/01launcher \
	vendor/SuperTeam/prebuilt/zeppelin/etc/super2/02permisos:system/etc/super2/02permisos \
	vendor/SuperTeam/prebuilt/zeppelin/etc/super2/04control:system/etc/super2/04control

#PRODUCT_LOCALES := \
#    es_ES \
#    ca_ES \
#    en_US \
#    de_DE \
#    eu_ES \
#    fr_FR \
#    it_IT \
#    pt_PT \
#    ru_RU \
#    hdpi

#PRODUCT_DEFAULT_LANGUAGE := es_ES

# Add the FM app
PRODUCT_PACKAGES += FM

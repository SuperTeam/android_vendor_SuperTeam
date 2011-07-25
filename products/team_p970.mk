$(call inherit-product, device/lge/p970/p970.mk)
$(call inherit-product, vendor/SuperTeam/products/common_full.mk)
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

PRODUCT_NAME := team_p970
PRODUCT_BRAND := lge
PRODUCT_DEVICE := p970
PRODUCT_MODEL := Optimus Black
PRODUCT_MANUFACTURER := LGE
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=lge_star BUILD_ID=FRG83G BUILD_DISPLAY_ID=GRJ22 BUILD_FINGERPRINT=lge/lge_spire/p970/p970:2.2.2/FRG83G/lgp970-V10b.2ED2ADCFFC:user/release-keys PRIVATE_BUILD_DESC="star-user 2.2.2 FRG83G 2ED2ADCFFC release-keys"

PRODUCT_PACKAGE_OVERLAYS += vendor/SuperTeam/overlay/p970

PRODUCT_PROPERTY_OVERRIDES += \
    ro.modversion=SuperOSR-ST@-Black-1.0 \
    ro.stats.romversion=1.0 \
    ro.config.play.bootsound=0 \
    ro.kernel.qemu=0

PRODUCT_PACKAGES += Launcher2 DSPManager Torch
    
PRODUCT_LOCALES := \
    es_ES \
    ca_ES \
    en_US \
    eu_ES \
    hdpi

PRODUCT_DEFAULT_LANGUAGE := es_ES
TARGET_BUILD_TYPE=release


$(call inherit-product, device/lge/p970/p970.mk)
$(call inherit-product, vendor/SuperTeam/products/common_full.mk)

PRODUCT_NAME := team_p970
PRODUCT_BRAND := lge
PRODUCT_DEVICE := p970
PRODUCT_MODEL := Optimus Black
PRODUCT_MANUFACTURER := LGE
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=lge_bprj BUILD_ID=FRG83G BUILD_DISPLAY_ID=GRJ90 BUILD_FINGERPRINT=lge/lge_bprj/lgp970/lgp970:2.2.2/FRG83G/LG-P970-V10c.41FC930B:user/release-keys PRIVATE_BUILD_DESC="lge_bprj-user 2.2.2 FRG83G LG-P970-V10c.41FC930B release-keys"

PRODUCT_PACKAGE_OVERLAYS += vendor/SuperTeam/overlay/p970

PRODUCT_PROPERTY_OVERRIDES += \
    ro.modversion=SuperOSR-ST@-Black-2.0.0 \
    ro.stats.romversion=2.0.0 \
    ro.config.play.bootsound=0 \
    ro.data.on=0

PRODUCT_PACKAGES += DSPManager Torch

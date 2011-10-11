$(call inherit-product, device/lge/p990/p990.mk)

$(call inherit-product, vendor/SuperTeam/products/common_full.mk)

PRODUCT_NAME := team_p990
PRODUCT_BRAND := lge
PRODUCT_DEVICE := p990
PRODUCT_MODEL := Optimus 2x
PRODUCT_MANUFACTURER := LGE
PRODUCT_BUILD_PROP_OVERRIDES += \
	PRODUCT_NAME=lge_star \
	BUILD_ID=FRG83G \
	BUILD_DISPLAY_ID=GWK74 \
	BUILD_FINGERPRINT=lge/lge_star/p990/p990:2.2.2/FRG83G/lgp990-V10b.2ED2ADCFFC:user/release-keys \
	PRIVATE_BUILD_DESC="star-user 2.2.2 FRG83G 2ED2ADCFFC release-keys"

PRODUCT_PACKAGE_OVERLAYS += vendor/SuperTeam/overlay/p990

PRODUCT_PROPERTY_OVERRIDES += \
    ro.modversion=SuperOSR-ST@-Optimus2x-2.2.0 \
    ro.stats.romversion=2.2.0 \
    ro.data.on=0 \
    ro.config.play.bootsound=0

PRODUCT_PACKAGES += DSPManager Torch 
VENDOR_INCLUDE_MUSICAPP := true

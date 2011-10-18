$(call inherit-product, device/htc/dream_sapphire/full_dream_sapphire.mk)

$(call inherit-product, vendor/SuperTeam/products/common.mk)

$(call inherit-product, vendor/SuperTeam/products/themes_small.mk)

PRODUCT_NAME := team_dream_sapphire
PRODUCT_BRAND := google
PRODUCT_DEVICE := dream_sapphire
PRODUCT_MODEL := Dream/Sapphire
PRODUCT_MANUFACTURER := HTC
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_ID=FRG83 BUILD_DISPLAY_ID=GWK74 BUILD_FINGERPRINT=tmobile/opal/sapphire/sapphire:2.2.1/FRG83/60505:user/release-keys PRIVATE_BUILD_DESC="opal-user 2.2.1 FRG83 60505 release-keys"

PRODUCT_PACKAGE_OVERLAYS += vendor/SuperTeam/overlay/dream_sapphire

PRODUCT_PACKAGES += Gallery

PRODUCT_PROPERTY_OVERRIDES += \
	ro.data.on=0 \
	ro.modversion=SuperOSR-ST@-dream_sapphire-2.2.0 \
	ro.stats.romversion=2.2.0 \
	ro.compcache.default=18 \
	ro.config.alarm_alert=Beeps.mp3 \
	ro.product.multi_touch_enabled=true \
	ro.setupwizard.mode=DISABLED
	
PRODUCT_LOCALES += pl_PL

#include vendor/SuperTeam/products/asian.mk


# Inherit common stuff
$(call inherit-product, vendor/SuperTeam/products/common.mk)

# Bring in all audio files
include frameworks/base/data/sounds/AudioPackage5.mk

# Theme packages
include vendor/SuperTeam/products/themes.mk

# Default ringtone
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=Theway.mp3 \
    ro.config.notification_sound=Bubbles.ogg

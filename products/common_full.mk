# Inherit common stuff
$(call inherit-product, vendor/SuperTeam/products/common.mk)

# Bring in all audio files
include frameworks/base/data/sounds/AudioPackage5.mk

# Theme packages
include vendor/SuperTeam/products/themes.mk

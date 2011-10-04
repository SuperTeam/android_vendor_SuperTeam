# Inherit generic zeppelin stuff
$(call inherit-product, vendor/SuperTeam/products/team_zeppelin.mk)

# Inherit specific Asia build
$(call inherit-product, vendor/SuperTeam/products/asian.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := team_zeppelin_cn

PRODUCT_PROPERTY_OVERRIDES += ro.modversion=SuperOSR-zeppelin_cn-2.1

PRODUCT_LOCALES += mdpi

PRODUCT_DEFAULT_LANGUAGE := en_US

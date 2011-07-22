# Inherit device configuration
$(call inherit-product, device/lge/p990/p990.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/SuperTeam/products/common_full.mk)

# Include GSM stuff
$(call inherit-product, vendor/SuperTeam/products/gsm.mk)

# Build kernel
PRODUCT_SPECIFIC_DEFINES += TARGET_PREBUILT_KERNEL=vendor/SuperTeam/kernels/p990/kernel
PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_DIR=kernel/tegra
PRODUCT_SPECIFIC_DEFINES += TARGET_KERNEL_CONFIG=superteam_p990_defconfig
PRODUCT_SPECIFIC_DEFINES += TARGET_NO_BUILD_WIFI=true


#
# Setup device specific product configuration.
#
PRODUCT_NAME := team_p990
PRODUCT_BRAND := lge
PRODUCT_DEVICE := p990
PRODUCT_MODEL := Optimus 2x
PRODUCT_MANUFACTURER := LGE
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=lge_star BUILD_ID=FRG83G BUILD_DISPLAY_ID=GRJ22 BUILD_FINGERPRINT=lge/lge_star/p990/p990:2.2.2/FRG83G/lgp990-V10b.2ED2ADCFFC:user/release-keys PRIVATE_BUILD_DESC="star-user 2.2.2 FRG83G 2ED2ADCFFC release-keys"

# Extra lg overlay
PRODUCT_PACKAGE_OVERLAYS += vendor/SuperTeam/overlay/p990

#
# Set ro.modversion
#
PRODUCT_PROPERTY_OVERRIDES += \
    ro.modversion=SuperOSR-ST@-Optimus2x-1.1 \
    ro.stats.romversion=1.1 \
    ro.data.on=0 \
    ro.config.play.bootsound=0

PRODUCT_PACKAGES += Launcher2 DSPManager Torch Quake FM hcitool OpenWnn PinyinIME VoiceDialer libWnnEngDic libWnnJpnDic libwnndict

    
PRODUCT_LOCALES := \
    ca_ES \
    de_DE \
    en_GB \
    en_US \
    es_ES \
    eu_ES \
    fr_FR \
    he_IL \
    it_IT \
    ko_KR \
    nl_NL \
    pl_PL \
    pt_BR \
    pt_PT \
    ru_RU \
    zh_CN \
    ja_JP \
    hdpi

PRODUCT_DEFAULT_LANGUAGE := es_ES
TARGET_BUILD_TYPE := release
# FM Radio
BOARD_HAVE_FM_RADIO := true
TARGET_GLOBAL_CFLAGS += -DHAVE_FM_RADIO
TARGET_GLOBAL_CPPFLAGS += -DHAVE_FM_RADIO

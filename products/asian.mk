# Specific configuration for Asia builds
PRODUCT_LOCALES := \
    en_US \
    zh_CN \
    ja_JP \
    ko_KR \
    ru_RU

# Asian IME stuff
PRODUCT_PACKAGES := $(PRODUCT_PACKAGES) \
    OpenWnn \
    PinyinIME \
    libWnnJpnDic \
    libwnndict

PRODUCT_NOLATIN_IME := true
PRODUCT_SUBDEVICE := $(PRODUCT_DEVICE)_cn
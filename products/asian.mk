# Specific configuration for Asia builds
PRODUCT_LOCALES := \
    en_US \
    zh_CN \
    ja_JP \
    ko_KR \
    ru_RU

# Asian IME stuff
PRODUCT_PACKAGES += OpenWnn PinyinIME libWnnJpnDic libwnndict

ONLY_KEYBOARD_QWERTY := false
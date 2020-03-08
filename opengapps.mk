$(call inherit-product, vendor/opengapps/build/opengapps-packages.mk)

TARGET_GAPPS_ARCH := arm64

TARGET_DENSITY := xhdpi

DONT_DEXPREOPT_PREBUILTS := true

GAPPS_VARIANT := nano

GAPPS_PRODUCT_PACKAGES += Chrome

GAPPS_FORCE_BROWSER_OVERRIDES := true
GAPPS_FORCE_PACKAGE_OVERRIDES := true
GAPPS_FORCE_WEBVIEW_OVERRIDES := true

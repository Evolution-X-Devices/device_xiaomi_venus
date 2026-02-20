#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

TARGET_HAS_UDFPS := true
TARGET_HAS_POWERSHARE := true

# Inherit from sm8350-common
$(call inherit-product, device/xiaomi/sm8350-common/common.mk)

# Inherit from miuicamera-venus
$(call inherit-product-if-exists, device/xiaomi/miuicamera-venus/device.mk)
$(call soong_config_set_bool,camera,override_format_from_reserved,true)
$(call soong_config_set,camera,package_name,com.android.camera)

# Overlays
PRODUCT_PACKAGES += \
    ApertureOverlayVenus

PRODUCT_PACKAGES += \
    FrameworkOverlayVenus \
    SettingsOverlayVenus \
    SettingsProviderOverlayVenus \
    SystemUIOverlayVenus \
    WifiOverlayVenus

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Sku properties
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/sku/build_CN.prop:$(TARGET_COPY_OUT_ODM)/etc/build_CN.prop

# Call the proprietary setup
$(call inherit-product, vendor/xiaomi/venus/venus-vendor.mk)

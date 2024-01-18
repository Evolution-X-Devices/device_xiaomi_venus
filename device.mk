#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm8350-common
$(call inherit-product, device/xiaomi/sm8350-common/common.mk)

# Audio configs
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(LOCAL_PATH)/audio/,$(TARGET_COPY_OUT_VENDOR)/etc/audio/sku_lahaina)

# Fingerprint
PRODUCT_PACKAGES += \
    libudfpshandler \
    vendor.goodix.hardware.biometrics.fingerprint@2.1.vendor

# LiveDisplay
PRODUCT_PACKAGES += \
    vendor.lineage.livedisplay@2.1-service.xiaomi_sm8350

# Overlays
PRODUCT_PACKAGES += \
    FrameworksResVenus \
    SettingsOverlayM2011K2C \
    SettingsOverlayM2011K2G \
    SettingsProviderOverlayVenus \
    SettingsResVenus \
    SystemUIResVenus \
    WifiResVenus

# PowerShare
PRODUCT_PACKAGES += \
    vendor.lineage.powershare@1.0-service.xiaomi

# Rootdir
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init.venus.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.venus.rc

# Sensors
PRODUCT_PACKAGES += \
    sensors.xiaomi.venus

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Touch
PRODUCT_PACKAGES += \
    vendor.lineage.touch@1.0-service.xiaomi

# Call the proprietary setup
$(call inherit-product, vendor/xiaomi/venus/venus-vendor.mk)

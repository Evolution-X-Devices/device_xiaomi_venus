#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from sm8350-common
$(call inherit-product, device/xiaomi/sm8350-common/common.mk)

# Inherit from miuicamera-venus
$(call inherit-product-if-exists, device/xiaomi/miuicamera-venus/device.mk)
$(call soong_config_set_bool,camera,override_format_from_reserved,true)
$(call soong_config_set,camera,package_name,com.android.camera)

# Display Device Config
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/display_id_4630946736638489730.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/displayconfig/display_id_4630946736638489730.xml

# Fingerprint
PRODUCT_PACKAGES += \
    libudfpshandler

# Logging
SPAMMY_LOG_TAGS := \
    MiStcImpl \
    SDM \
    SDM-histogram \
    SRE \
    SensorService \
    WifiHAL \
    cnss-daemon \
    libcitsensorservice@2.0-impl \
    libsensor-displayalgo \
    libsensor-parseRGB \
    libsensor-ssccalapi \
    sensors \
    vendor.qti.hardware.display.composer-service \
    vendor.xiaomi.sensor.citsensorservice@2.0-service

ifneq ($(TARGET_BUILD_VARIANT),eng)
PRODUCT_VENDOR_PROPERTIES += \
    $(foreach tag,$(SPAMMY_LOG_TAGS),log.tag.$(tag)=W)
endif

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay \
    $(LOCAL_PATH)/overlay-lineage

# PowerShare
PRODUCT_PACKAGES += \
    vendor.lineage.powershare-service.default

# Sensors
PRODUCT_PACKAGES += \
    sensors.xiaomi.v2

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/sensors/hals.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/hals.conf

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Shim
PRODUCT_PACKAGES += \
    libprocessgroup_shim

# Rootdir
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/init.venus.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/init.venus.rc

# Call the proprietary setup
$(call inherit-product, vendor/xiaomi/venus/venus-vendor.mk)

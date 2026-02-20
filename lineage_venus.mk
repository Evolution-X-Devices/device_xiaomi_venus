#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from venus device
$(call inherit-product, device/xiaomi/venus/device.mk)

# Inherit some common LineageOS stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

EVO_BUILD_TYPE := Official
TARGET_HAS_UDFPS := true
TARGET_BUILD_APERTURE_CAMERA := false

# Device identifier. This must come after all inclusions
PRODUCT_BRAND := Xiaomi
PRODUCT_DEVICE := venus
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_MODEL := M2011K2G
PRODUCT_NAME := lineage_venus

PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="venus_global-user 14 UKQ1.240624.001 OS2.0.3.0.UKBMIXM release-keys" \
    DeviceProduct=venus \
    SystemName=venus_global

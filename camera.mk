#
# Copyright (C) 2022 Statix
# SPDX-License-Identifer: Apache-2.0
#

PRODUCT_PACKAGES += \
    oplus-fwk \
    com.oplus.camera.unit.sdk.adapter \
    com.oplus.camera.unit.sdk

PRODUCT_BOOT_JARS += oplus-fwk

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/blobs/hiddenapi-package-whitelist-oplus-system.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/hiddenapi-package-whitelist-oplus-system.xml \
    $(LOCAL_PATH)/blobs/permissions-oplus-camera-extra.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/permissions-oplus-camera-extra.xml \
    $(LOCAL_PATH)/blobs/com.oplus.camera.unit.sdk_product.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/com.oplus.camera.unit.sdk_product.xml

OPLUS_CAMERA_PROPERTIES := \
    vendor.camera.aux.packagelist=android,com.oplus.camera \
    persist.vendor.camera.privapp.list=com.oplus.camera \
    persist.camera.privapp.list=com.oplus.camera

PRODUCT_VENDOR_PROPERTIES += $(OPLUS_CAMERA_PROPERTIES)
PRODUCT_PRODUCT_PROPERTIES += $(OPLUS_CAMERA_PROPERTIES)

# Photo
$(call soong_config_set,camera,package_name,com.oplus.packageName)

# Video
$(call soong_config_set_bool,camera,override_format_from_reserved,true)

$(call inherit-product, vendor/oneplus/camera/camera-vendor.mk)

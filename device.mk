#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Generic ramdisk allow list
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_ramdisk.mk)

# Project ID Quota
$(call inherit-product, $(SRC_TARGET_DIR)/product/emulated_storage.mk)

# Virtual A/B
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)

# Dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# pKVM
$(call inherit-product, packages/modules/Virtualization/apex/product_packages.mk)

# Qualcomm
$(call soong_config_set,rfs,mpss_firmware_symlink_target,modem_firmware)
$(call inherit-product, hardware/qcom-caf/common/common.mk)

# SHIPPING API
BOARD_SHIPPING_API_LEVEL := 34
PRODUCT_SHIPPING_API_LEVEL := 34

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# A/B
AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

PRODUCT_VIRTUAL_AB_COMPRESSION_METHOD := lz4

# ANT+
PRODUCT_PACKAGES += \
    com.dsi.ant@1.0.vendor

# Audio
SOONG_CONFIG_NAMESPACES += android_hardware_audio
SOONG_CONFIG_android_hardware_audio += \
    run_64bit
SOONG_CONFIG_android_hardware_audio_run_64bit := true

PRODUCT_PACKAGES += \
    android.hardware.audio@7.1-impl \
    android.hardware.audio.effect@7.0-impl \
    android.hardware.audio.service \
    android.hardware.soundtrigger@2.3-impl

PRODUCT_PACKAGES += \
    audio.primary.pineapple \
    audio.r_submix.default \
    audio.usb.default \
    sound_trigger.primary.pineapple

PRODUCT_PACKAGES += \
    audioadsprpcd \
    libagm_compress_plugin \
    libagm_mixer_plugin \
    libagm_pcm_plugin \
    libagmclient \
    libbatterylistener \
    libpalclient \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libsndcardparser \
    libvolumelistener \
    libhfp_pal \
    libhotword_intf \
    libfmpal \
    vendor.qti.hardware.AGMIPC@1.0-impl

AUDIO_HAL_DIR := hardware/qcom-caf/sm8650/audio/primary-hal

PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.audio.pro.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.pro.xml \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml

# Bluetooth
PRODUCT_PACKAGES += \
    audio.bluetooth.default \
    android.hardware.bluetooth.audio-impl \
    lib_bt_aptx \
    lib_bt_ble \
    lib_bt_bundle

PRODUCT_PACKAGES += \
    android.hardware.audio.common-V3-ndk.vendor

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml

# Boot animation
TARGET_SCREEN_HEIGHT := 2670
TARGET_SCREEN_WIDTH := 1200 

# Boot control
PRODUCT_PACKAGES += \
    android.hardware.boot-service.qti \
    android.hardware.boot-service.qti.recovery

# Camera
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.full.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.full.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.raw.xml



# ContextHub
PRODUCT_PACKAGES += \
    com.android.hardware.contexthub

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.3.vendor \
    android.hardware.drm-service.clearkey

# Fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot-service.example_recovery \
    fastbootd

# Fingerprint
$(call soong_config_set,XIAOMI_BIOMETRICS_FINGERPRINT,USE_NEW_IMPL,true)
PRODUCT_PACKAGES += \
    android.hardware.biometrics.fingerprint-service.xiaomi \
    libudfpshandler

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.fingerprint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.fingerprint.xml

# GPS
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.location.gps.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.location.gps.xml

# Graphics
TARGET_USES_VULKAN = true

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.vulkan.compute-0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.compute-0.xml \
    frameworks/native/data/etc/android.hardware.vulkan.level-1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.level-1.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_1.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_1.xml \
    frameworks/native/data/etc/android.hardware.vulkan.version-1_3.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.vulkan.version-1_3.xml \
    frameworks/native/data/etc/android.software.vulkan.deqp.level-2023-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.vulkan.deqp.level.xml

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml \
    frameworks/native/data/etc/android.software.opengles.deqp.level-2023-03-01.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.opengles.deqp.level.xml


# Health
PRODUCT_PACKAGES += \
    android.hardware.health-service.qti \
    android.hardware.health-service.qti_recovery

# Hypsy
PRODUCT_PACKAGES += \
    xiaomi.system.hypsys.common-service

# IPACM
PRODUCT_PACKAGES += \
    ipacm \
    IPACM_cfg.xml \
    IPACM_Filter_cfg.xml

# Init
PRODUCT_PACKAGES += \
    fstab.qcom

PRODUCT_PACKAGES += \
    init.recovery.qcom.rc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_VENDOR_RAMDISK)/first_stage_ramdisk/fstab.qcom
# IR
PRODUCT_PACKAGES += \
    android.hardware.ir-service.example

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.consumerir.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/android.hardware.consumerir.xml

# Keymint
PRODUCT_PACKAGES += \
    android.hardware.hardware_keystore_V3.xml

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.device_id_attestation.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.device_id_attestation.xml \
    frameworks/native/data/etc/android.hardware.keystore.app_attest_key.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.keystore.app_attest_key.xml

# Linker
PRODUCT_VENDOR_LINKER_CONFIG_FRAGMENTS += \
    $(LOCAL_PATH)/configs/linker.config.json

# Memtrack
PRODUCT_PACKAGES += \
    vendor.qti.hardware.memtrack-service

#Media
PRODUCT_PACKAGES += \
    libcodec2_hidl_shim \
    libshim
# Network
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.ipsec_tunnels.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.ipsec_tunnels.xml

# NFC
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.ese.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/android.hardware.nfc.ese.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/android.hardware.nfc.uicc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/android.hardware.nfc.uicc.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.se.omapi.ese.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/android.hardware.se.omapi.ese.xml \
    frameworks/native/data/etc/android.hardware.se.omapi.uicc.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/android.hardware.se.omapi.uicc.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:$(TARGET_COPY_OUT_ODM)/etc/permissions/com.nxp.mifare.xml

# Overlays
PRODUCT_PACKAGES += \
    CarrierConfigOverlayZorn \
    SystemUIOverlayZorn \
    TelephonyOverlayZorn \
    FrameworkOverlayZorn \
    FrameworkOverlayZornGL \
    SettingsOverlayZorn \
    SettingsProviderOverlayZorn \
    SettingsProviderOverlayZornCN \
    SecureElementOverlayZorn \
    WifiOverlayZorn \
    WifiOverlayZornCN

# Partitions
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true

PRODUCT_PACKAGES += \
    vendor_bt_firmware_mountpoint \
    vendor_dsp_mountpoint \
    vendor_firmware_mnt_mountpoint \
    vendor_modem_firmware_mountpoint

# Properties
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/properties/odm_CN.prop:$(TARGET_COPY_OUT_ODM)/etc/odm_CN.prop \
    $(LOCAL_PATH)/properties/odm_GL.prop:$(TARGET_COPY_OUT_ODM)/etc/odm_GL.prop \
    $(LOCAL_PATH)/properties/odm_IN.prop:$(TARGET_COPY_OUT_ODM)/etc/odm_IN.prop

# QSPA
PRODUCT_PACKAGES += \
    vendor.qti.qspa-service \
    qspa_vendor.rc


# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service-qti

PRODUCT_COPY_FILES += \
vendor/qcom/opensource/power/config/pineapple/powerhint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/powerhint.xml

# QTI fwk-detect
PRODUCT_PACKAGES += \
    libvndfwk_detect_jni.qti_vendor # Needed by CNE app


# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors-service.multihal \
    sensors.dynamic_sensor_hal

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.dynamic.head_tracker.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.dynamic.head_tracker.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH) \
    hardware/xiaomi

# Telephony
PRODUCT_PACKAGES += \
    extphonelib \
    extphonelib-product \
    extphonelib.xml \
    extphonelib_product.xml \
    ims-ext-common \
    ims_ext_common.xml \
    qti-telephony-hidl-wrapper \
    qti-telephony-hidl-wrapper-prd \
    qti_telephony_hidl_wrapper.xml \
    qti_telephony_hidl_wrapper_prd.xml \
    qti-telephony-utils \
    qti-telephony-utils-prd \
    qti_telephony_utils.xml \
    qti_telephony_utils_prd.xml \
    telephony-ext

PRODUCT_PACKAGES += \
    xiaomi-telephony-stub

PRODUCT_BOOT_JARS += \
    telephony-ext \
    xiaomi-telephony-stub

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.telephony.ims.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.ims.xml \
    frameworks/native/data/etc/android.hardware.telephony.mbms.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.mbms.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml

# Touchscreen
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml

# Update engine
PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb-service.qti \
    android.hardware.usb.gadget-service.qti \

PRODUCT_PACKAGES += \
    init.qcom.usb.rc \
    init.qcom.usb.sh \
    usb_compositions.conf

PRODUCT_SOONG_NAMESPACES += \
    vendor/qcom/opensource/usb/etc

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml

# Vendor service manager
PRODUCT_PACKAGES += \
    vndservicemanager

# Verified boot
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml

# Vibrator
$(call soong_config_set,qti_vibrator,effect_lib,libqtivibratoreffect.xiaomi)
$(call soong_config_set_bool,qti_vibrator,use_effect_stream,true)

PRODUCT_PACKAGES += \
    vendor.qti.hardware.vibrator.service

# WiFi
PRODUCT_PACKAGES += \
    android.hardware.wifi-service \
    hostapd \
    hostapd_cli \
    libwifi-hal-qcom \
    libwpa_client \
    wpa_cli \
    wpa_supplicant \
    wpa_supplicant.conf \
    libpasn \
    libwifi-hal

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.aware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.aware.xml

# WiFi firmware symlinks
PRODUCT_PACKAGES += \
    firmware_wlanmdsp.otaupdate_symlink \
    firmware_wlan_mac.bin_symlink \
    firmware_WCNSS_qcom_cfg.ini_symlink

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/wifi/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/configs/wifi/vendor_cmd.xml:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/vendor_cmd.xml \
    $(LOCAL_PATH)/configs/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wcn7750/WCNSS_qcom_cfg.ini \
    $(LOCAL_PATH)/configs/wifi/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.aware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.aware.xml

# Vendor
$(call inherit-product, vendor/xiaomi/zorn/zorn-vendor.mk)

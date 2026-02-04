#!/bin/bash

echo 'Cloning Hardware Tree'
        git clone https://github.com/LineageOS/android_hardware_xiaomi.git -b lineage-23.2 hardware/xiaomi

echo 'Cloning Prebuilt Kernel Tree'
	git clone https://github.com/Xiaomi-zorn-devs/device_xiaomi_zorn-kernel.git -b A16 device/xiaomi/zorn-kernel

echo 'Cloning Vendor Tree'
	git clone https://codeberg.org/Phhgsi/vendor_xiaomi_zorn.git -b main vendor/xiaomi/zorn

echo "vendorsetup.sh execution complete."
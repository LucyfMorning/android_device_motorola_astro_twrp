#
# Copyright 2021 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/motorola/astro

# TWRP Minimal manifest
ALLOW_MISSING_DEPENDENCIES := true
BUILD_BROKEN_DUP_RULES := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := sdm710

TARGET_NO_BOOTLOADER := true
TARGET_USES_UEFI := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := kryo385

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT_RUNTIME := kryo385
TARGET_USES_64_BIT_BINDER := true

# GPU Utils
BOARD_PROVIDES_GPTUTILS := true

# Kernel - CMDLINE
BOARD_KERNEL_CMDLINE := \
    console=ttyMSM0,115200,n8 \
    androidboot.hardware=qcom  \
    androidboot.console=ttyMSM0 \
    androidboot.memcg=1 \
    lpm_levels.sleep_disabled=1 \
    msm_rtb.filter=0x237 \
    service_locator.enable=1 \
    swiotlb=1 \
    earlycon=msm_geni_serial,0xA84000 \
    ehci-hcd.park=3 \
    androidboot.configfs=true \
    cgroup.memory=nokmem,nosocket \
    androidboot.usbcontroller=a600000.dwc3 \
    printk.devkmsg=on \
    androidboot.hab.csv=10 \
    androidboot.hab.product=astro \
    androidboot.hab.cid=50 \
    firmware_class.path=/vendor/firmware_mnt/image \
    androidboot.fastboot=1 \
    androidboot.selinux=permissive

# Kernel - Mkbootimg Args
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x00000000
BOARD_DTB_OFFSET := 0x01f00000
BOARD_KERNEL_OFFSET := 0x00008000
BOARD_RAMDISK_OFFSET := 0x01000000
BOARD_KERNEL_PAGESIZE := 4096
BOARD_KERNEL_SECOND_OFFSET := 0x00f00000
BOARD_KERNEL_TAGS_OFFSET := 0x00000100

BOARD_MKBOOTIMG_ARGS += \
    --header_version $(BOARD_BOOTIMG_HEADER_VERSION) \
    --base $(BOARD_KERNEL_BASE) \
    --dtb_offset $(BOARD_DTB_OFFSET) \
    --kernel_offset $(BOARD_KERNEL_OFFSET) \
    --ramdisk_offset $(BOARD_RAMDISK_OFFSET) \
    --pagesize $(BOARD_KERNEL_PAGESIZE) \
    --second_offset $(BOARD_KERNEL_SECOND_OFFSET) \
    --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)

# Kernel - Instructions
TARGET_KERNEL_VERSION := 4.9
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64

# Kernel - Prebuilt
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/Image.gz

# Kernel - Include DTBO
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img

# Kernel - Include DTB
TARGET_PREBUILD_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_MKBOOTIMG_ARGS += \
	--dtb $(TARGET_PREBUILD_DTB)

# Partition Sizes
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 67108864
BOARD_FLASH_BLOCK_SIZE := 262144 
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 536870912
# BOARD_USERDATAIMAGE_PARTITION_SIZE := 10737418240
BOARD_DTBOIMG_PARTITION_SIZE := 25165824

# Super Partition
BOARD_SUPER_PARTITION_SIZE := 8925478912
BOARD_SUPER_PARTITION_GROUPS := motorola_dynamic_partitions
BOARD_MOTOROLA_DYNAMIC_PARTITIONS_SIZE := 4341104640
BOARD_MOTOROLA_DYNAMIC_PARTITIONS_PARTITION_LIST := \
    system \
    product \
    vendor

# Partition - Types
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_SYSTEMIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := f2fs
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USES_METADATA_PARTITION := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
TARGET_COPY_OUT_VENDOR := vendor
TARGET_COPY_OUT_PRODUCT := product
TARGET_USES_MKE2FS := true

# Platform
TARGET_BOARD_PLATFORM := sdm710
QCOM_BOARD_PLATFORMS += sdm710

# Recovery
TARGET_OTA_ASSERT_DEVICE := astro
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SUPPRESS_SECURE_ERASE := true
RECOVERY_SDCARD_ON_DATA := true
USE_RECOVERY_INSTALLER := true
RECOVERY_INSTALLER_PATH := bootable/recovery/installer
TARGET_RECOVERY_WIPE := $(DEVICE_PATH)/recovery/root/system/etc/recovery.wipe

BOARD_RECOVERY_KERNEL_MODULES_LOAD := \
    $(DEVICE_PATH)/recovery/root/vendor/lib/modules/1.1/nova_0flash_mmi.ko \
    $(DEVICE_PATH)/recovery/root/vendor/lib/modules/1.1/himax_v2_mmi.ko \
    $(DEVICE_PATH)/recovery/root/vendor/lib/modules/1.1/himax_v2_mmi_hx83102d.ko

# Symbolic Simlinks
BOARD_ROOT_EXTRA_SYMLINKS := \
    /mnt/vendor/persist:/persist

# TWRP BoardConfig inherit
include $(DEVICE_PATH)/BoardConfigTWRP.mk

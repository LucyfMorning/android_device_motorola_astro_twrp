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

# TWRP configuration
RECOVERY_SDCARD_ON_DATA := true
TW_EXCLUDE_TWRPAPP := true
TW_EXTRA_LANGUAGES := true
TW_HAS_EDL_MODE := true

# Team Win Recovery - Crypto
TW_INCLUDE_CRYPTO := true
TW_INCLUDE_CRYPTO_FBE := true
TW_INCLUDE_REPACKTOOLS := true
TW_NEW_ION_HEAP := true
TW_USE_TOOLBOX := true
BOARD_USES_QCOM_FBE_DECRYPTION := true

# Team Win Recovery - Debug
TARGET_USES_LOGD := true
TWRP_INCLUDE_LOGCAT := true

TW_INCLUDE_NTFS_3G := true
TW_INCLUDE_FB2PNG := true
TW_INPUT_BLACKLIST := "hbtp_vm"

# Team Win Recovery - Display
TW_BRIGHTNESS_PATH := "/sys/class/backlight/panel0-backlight/brightness"
TW_CUSTOM_BATTERY_PATH := "/sys/class/power_supply/qcom_battery/"
TW_CUSTOM_CPU_TEMP_PATH := "/sys/class/thermal/thermal_zone36/temp" # Big cores max step
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888

TW_MAX_BRIGHTNESS := 4095
TW_DEFAULT_BRIGHTNESS := 420
TW_THEME := portrait_hdpi

TW_Y_OFFSET := 45
TW_H_OFFSET := -44 # Fix 1 pixel 

# Team Win Recovery - Rollback
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := 2099-12-31
PLATFORM_VERSION := 16.1.0
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)

# Team Win Recovery - System Props
TW_OVERRIDE_SYSTEM_PROPS := \
    "ro.build.fingerprint=ro.system.build.fingerprint;ro.build.version.incremental"

# Team Win Recovery - Timezone
TARGET_RECOVERY_QCOM_RTC_FIX := true

# Team Win Recovery - USB
TW_EXCLUDE_DEFAULT_USB_INIT := true
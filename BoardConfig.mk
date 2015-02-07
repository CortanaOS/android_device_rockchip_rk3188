# config.mk
# 
# Product-specific compile-time definitions.
#
TARGET_BOARD_PLATFORM := rk3188
TARGET_BOARD_PLATFORM_GPU := mali400
BOARD_USE_LOW_MEM := false
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a9

# multi usb partitions
BUILD_WITH_MULTI_USB_PARTITIONS := true

TARGET_PREBUILT_KERNEL ?= kernel/arch/arm/boot/Image
TARGET_BOARD_HARDWARE ?= rk30board
BOARD_USE_LCDC_COMPOSER ?= false
TARGET_NO_BOOTLOADER ?= true
TARGET_RELEASETOOLS_EXTENSIONS := device/rockchip/rk3188

BOARD_EGL_CFG := device/rockchip/rk3188/gpu/libmali_smp/egl.cfg

#for widevine drm
BOARD_WIDEVINE_OEMCRYPTO_LEVEL := 3

# To use bmp as kernel logo, uncomment the line below to use bgra 8888 in recovery
#TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
TARGET_RECOVERY_UI_LIB := librecovery_ui_rk3188
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_CPU_SMP ?= true
BOARD_USES_GENERIC_AUDIO ?= true

//MAX-SIZE=512M, for generate out/.../system.img
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1073741824
BOARD_FLASH_BLOCK_SIZE := 131072

BOARD_CONNECTIVITY_VENDOR := Broadcom
BOARD_CONNECTIVITY_MODULE := ap6xxx

# Wifi related defines
FORCE_WIFI_WORK_AS_ANDROID4_2 := false
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           := bcmdhd
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/system/etc/firmware/fw_bcm4329.bin"
WIFI_DRIVER_FW_PATH_P2P     := "/system/etc/firmware/fw_bcm4329_p2p.bin"
WIFI_DRIVER_FW_PATH_AP      := "/system/etc/firmware/fw_bcm4329_apsta.bin"

# bluetooth support
BLUETOOTH_USE_BPLUS := false
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/rockchip/rk3188/bluetooth

# Enable NEON feature
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true

#BOARD_LIB_DUMPSTATE := libdumpstate.$(TARGET_BOARD_PLATFORM)

# google apps
BUILD_WITH_GOOGLE_MARKET ?= true

USE_OPENGL_RENDERER ?= true

# rk30sdk uses Cortex A9
TARGET_EXTRA_CFLAGS += $(call cc-option,-mtune=cortex-a9,$(call cc-option,-mtune=cortex-a8)) $(call cc-option,-mcpu=cortex-a9,$(call cc-option,-mcpu=cortex-a8))

# sensors
BOARD_SENSOR_ST := true

TARGET_BOOTLOADER_BOARD_NAME ?= rk30sdk

BOARD_BP_AUTO := true

#phone pad codec list
BOARD_CODEC_WM8994 := false
BOARD_CODEC_RT5625_SPK_FROM_SPKOUT := false
BOARD_CODEC_RT5625_SPK_FROM_HPOUT := false
BOARD_CODEC_RT3261 := false
BOARD_CODEC_RT3224 := true
BOARD_CODEC_RT5631 := false
BOARD_CODEC_RK616 := false

#if set to true m-user would be disabled and UMS enabled, if set to disable UMS would be disabled and m-user enabled
BUILD_WITH_UMS := true

#if set to true BUILD_WITH_UMS must be false.
BUILD_WITH_CDROM := false
BUILD_WITH_CDROM_PATH ?= /system/etc/cd.iso

# for drmservice
BUILD_WITH_DRMSERVICE :=true

# for tablet encryption
BUILD_WITH_CRYPTO := false

# for update nand 2.1
NAND_UPDATE :=true

# define tablet support NTFS 
BOARD_IS_SUPPORT_NTFS := true

# product has GPS or not
BOARD_HAS_GPS := true

# ethernet
BOARD_HAS_ETHERNET := true

# manifest
SYSTEM_WITH_MANIFEST := true

# multi usb partitions
BUILD_WITH_MULTI_USB_PARTITIONS := false

# no battery
BUILD_WITHOUT_BATTERY := true

#TWRP
DEVICE_RESOLUTION := 1024x600
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := true
TW_NO_USB_STORAGE := false
TW_INCLUDE_JB_CRYPTO := true

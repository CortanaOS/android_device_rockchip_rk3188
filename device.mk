# Copyright (C) 2011 rockchip Limited
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Everything in this directory will become public

$(shell python device/rockchip/rk3188/auto_generator.py $(TARGET_DEVICE) preinstall)
$(shell python device/rockchip/rk3188/auto_generator.py $(TARGET_DEVICE) preinstall_del)
-include device/rockchip/$(TARGET_DEVICE)/preinstall/preinstall.mk
-include device/rockchip/$(TARGET_DEVICE)/preinstall_del/preinstall.mk

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

PRODUCT_AAPT_CONFIG += large

########################################################
# Kernel
########################################################
PRODUCT_COPY_FILES += \
    $(TARGET_PREBUILT_KERNEL):kernel

include frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk

PRODUCT_PACKAGES += WifiDisplay
PRODUCT_PACKAGES += Email
PRODUCT_PACKAGES += StressTest

#copy widevine drm lib & jar

ifeq ($(BOARD_WIDEVINE_OEMCRYPTO_LEVEL),3)

include vendor/widevine/widevine.mk

endif


########################################################
# Google applications
########################################################
ifeq ($(strip $(BUILD_WITH_GOOGLE_MARKET)),true)
PRODUCT_GOOGLE_PREBUILT_MODULES :=
include vendor/google/gapps_kk_mini.mk
endif

########################################################
#rksu
########################################################
ifeq ($(strip $(BUILD_WITH_RKSU)),true)
PRODUCT_COPY_FILES += \
	device/rockchip/rk3188/rksu:system/xbin/rksu
endif

PRODUCT_COPY_FILES += \
    device/rockchip/rk3188/twrp.fstab:recovery/root/etc/twrp.fstab

PRODUCT_COPY_FILES += \
    device/rockchip/rk3188/init.rc:root/init.rc \
    device/rockchip/rk3188/init.environ.rc:root/init.environ.rc \
    device/rockchip/rk3188/init.$(TARGET_BOARD_HARDWARE).rc:root/init.$(TARGET_BOARD_HARDWARE).rc \
    device/rockchip/rk3188/init.$(TARGET_BOARD_HARDWARE).usb.rc:root/init.$(TARGET_BOARD_HARDWARE).usb.rc \
    $(call add-to-product-copy-files-if-exists,device/rockchip/rk3188/init.$(TARGET_BOARD_HARDWARE).bootmode.emmc.rc:root/init.$(TARGET_BOARD_HARDWARE).bootmode.emmc.rc) \
    $(call add-to-product-copy-files-if-exists,device/rockchip/rk3188/init.$(TARGET_BOARD_HARDWARE).bootmode.unknown.rc:root/init.$(TARGET_BOARD_HARDWARE).bootmode.unknown.rc) \
    device/rockchip/rk3188/ueventd.$(TARGET_BOARD_HARDWARE).rc:root/ueventd.$(TARGET_BOARD_HARDWARE).rc \
    device/rockchip/rk3188/media_profiles_default.xml:system/etc/media_profiles_default.xml \
    device/rockchip/rk3188/alarm_filter.xml:system/etc/alarm_filter.xml \
    device/rockchip/rk3188/rk29-keypad.kl:system/usr/keylayout/rk29-keypad.kl

PRODUCT_COPY_FILES += \
    hardware/broadcom/wlan/bcmdhd/config/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    hardware/broadcom/wlan/bcmdhd/config/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \

PRODUCT_COPY_FILES += \
    device/rockchip/rk3188/init.connectivity.rc:root/init.connectivity.rc

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio_policy.conf:system/etc/audio_policy.conf


PRODUCT_COPY_FILES += \
    device/rockchip/rk3188/fstab.$(TARGET_BOARD_HARDWARE).bootmode.unknown:root/fstab.$(TARGET_BOARD_HARDWARE).bootmode.unknown \
    device/rockchip/rk3188/fstab.$(TARGET_BOARD_HARDWARE).bootmode.emmc:root/fstab.$(TARGET_BOARD_HARDWARE).bootmode.emmc

# For audio-record 
PRODUCT_PACKAGES += \
    libsrec_jni

# For tts test
PRODUCT_PACKAGES += \
    libwebrtc_audio_coding

include device/rockchip/rk3188/gpu/rk30xx_gpu.mk  
include device/rockchip/rk3188/vpu/rk30_vpu.mk
include device/rockchip/rk3188/wifi/rk30_wifi.mk
include device/rockchip/rk3188/nand/rk30_nand.mk
include device/rockchip/rk3188/ipp/rk29_ipp.mk
include device/rockchip/rk3188/ion/rk30_ion.mk
include device/rockchip/rk3188/bin/rk30_bin.mk

ifeq ($(strip $(BOARD_HAVE_BLUETOOTH)),true)
    include device/rockchip/rk3188/bluetooth/rk30_bt.mk
endif
include device/rockchip/rk3188/gps/rk30_gps.mk
include device/rockchip/rk3188/app/rkupdateservice.mk
include device/rockchip/rk3188/app/rkUserExperienceService.mk
#include vendor/google/chrome.mk
include device/rockchip/rk3188/etc/adblock.mk

# uncomment the line bellow to enable phone functions
include device/rockchip/rk3188/phone/rk30_phone.mk

include device/rockchip/rk3188/features/rk-core.mk
include device/rockchip/rk3188/features/rk-camera.mk
include device/rockchip/rk3188/features/rk-camera-front.mk
include device/rockchip/rk3188/features/rk-gms.mk

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapersPicker \
    NoiseField \
    PhaseBeam \
    librs_jni \
    libjni_pinyinime \
    hostapd_rtl

# HAL
PRODUCT_PACKAGES += \
    power.$(TARGET_BOARD_PLATFORM) \
    sensors.$(TARGET_BOARD_HARDWARE) \
    gralloc.$(TARGET_BOARD_HARDWARE) \
    hwcomposer.$(TARGET_BOARD_HARDWARE) \
    lights.$(TARGET_BOARD_HARDWARE) \
    camera.$(TARGET_BOARD_HARDWARE) \
    Camera \
    akmd 

# charge
PRODUCT_PACKAGES += \
    charger \
    charger_res_images 


PRODUCT_CHARACTERISTICS := tablet

# audio lib
PRODUCT_PACKAGES += \
    audio_policy.$(TARGET_BOARD_HARDWARE) \
    audio.primary.$(TARGET_BOARD_HARDWARE) \
    audio.alsa_usb.$(TARGET_BOARD_HARDWARE) \
    audio.a2dp.default\
    audio.r_submix.default\
    audio.usb.default

# Filesystem management tools
# EXT3/4 support
PRODUCT_PACKAGES += \
    mke2fs \
    e2fsck \
    tune2fs \
    resize2fs \
    mkdosfs

# audio lib
PRODUCT_PACKAGES += \
    libasound \
    alsa.default \
    acoustics.default \
    libtinyalsa

PRODUCT_PACKAGES += \
	alsa.audio.primary.$(TARGET_BOARD_HARDWARE)\
	alsa.audio_policy.$(TARGET_BOARD_HARDWARE)

$(call inherit-product-if-exists, external/alsa-lib/copy.mk)
$(call inherit-product-if-exists, external/alsa-utils/copy.mk)

#//*************************************************
#//* add by bonovo zbiao for android box
#//*************************************************
#PRODUCT_COPY_FILES += \
#    device/rockchip/$(TARGET_DEVICE)/newsmy_initlogo.rle:root/initlogo.rle
#    #device/rockchip/$(TARGET_DEVICE)/bootanimation.zip:system/media/bootanimation.zip 

PRODUCT_PACKAGES += \
		blogd \
		seriald \
		BonovoAvIn \
		libbonovoavin \
		BonovoRadio \
		libradio\
		BonovoMcu\
		libbonovomcu\
		BonovoHandle \
		libbonovohandle \
		BonovoKeyEditor \
		libbonovokeyeditor \
		libbonovobluetooth \
		BonovoBluetooth \
		libbonovovin \
		BonovoVIn \
		libbonovobackdraft \
		BonovoBackDraft \
		BonovoRadar \
		BonovoAirConditioning \
		BonovoCarDoor \
		BonovoSoundBalance \
		gps.$(TARGET_BOARD_HARDWARE)

PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.strictmode.visual=false \
    dalvik.vm.jniopts=warnonly

ifeq ($(strip $(BUILD_WITH_CRYPTO)),true)
    PRODUCT_PROPERTY_OVERRIDES += ro.crypto.state=unencrypted
endif

ifeq ($(strip $(BOARD_HAVE_BLUETOOTH)),true)
    PRODUCT_PROPERTY_OVERRIDES += ro.rk.bt_enable=true
else
    PRODUCT_PROPERTY_OVERRIDES += ro.rk.bt_enable=false
endif

ifeq ($(strip $(MT6622_BT_SUPPORT)),true)
    PRODUCT_PROPERTY_OVERRIDES += ro.rk.btchip=mt6622
endif

ifeq ($(strip $(BLUETOOTH_USE_BPLUS)),true)
    PRODUCT_PROPERTY_OVERRIDES += ro.rk.btchip=broadcom.bplus
endif

ifeq ($(strip $(MT7601U_WIFI_SUPPORT)),true)
    PRODUCT_PROPERTY_OVERRIDES += ro.rk.wifichip=mt7601u
endif


PRODUCT_TAGS += dalvik.gc.type-precise


########################################################
# build with UMS? CDROM?
########################################################
ifeq ($(strip $(BUILD_WITH_UMS)),true)
	PRODUCT_PROPERTY_OVERRIDES += \
		ro.factory.hasUMS=true \
		persist.sys.usb.config=mass_storage,adb 
       		#testing.mediascanner.skiplist = /mnt/internal_sd/Android/


	PRODUCT_COPY_FILES += \
    		device/rockchip/rk3188/init.$(TARGET_BOARD_HARDWARE).hasUMS.true.rc:root/init.$(TARGET_BOARD_HARDWARE).environment.rc
else
ifeq ($(strip $(BUILD_WITH_CDROM)),true)
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.factory.hasUMS=cdrom \
        ro.factory.cdrom=$(BUILD_WITH_CDROM_PATH) \
        persist.sys.usb.config=mass_storage,adb 
        

    PRODUCT_COPY_FILES += \
        device/rockchip/rk3188/init.$(TARGET_BOARD_HARDWARE).hasCDROM.true.rc:root/init.$(TARGET_BOARD_HARDWARE).environment.rc
else
	PRODUCT_PROPERTY_OVERRIDES += \
		ro.factory.hasUMS=false \
		persist.sys.usb.config=mtp,adb 
       		#testing.mediascanner.skiplist = /mnt/shell/emulated/Android/

        PRODUCT_COPY_FILES += \
                device/rockchip/rk3188/init.$(TARGET_BOARD_HARDWARE).hasUMS.false.rc:root/init.$(TARGET_BOARD_HARDWARE).environment.rc
endif
endif

########################################################
# build with drmservice
########################################################
ifeq ($(strip $(BUILD_WITH_DRMSERVICE)),true)
	PRODUCT_PACKAGES += \
	               drmservice
endif



########################################################
# this product has GPS or not
########################################################
ifeq ($(strip $(BOARD_HAS_GPS)),true)
	PRODUCT_PROPERTY_OVERRIDES += \
		ro.factory.hasGPS=true
else
	PRODUCT_PROPERTY_OVERRIDES += \
                ro.factory.hasGPS=false
endif

########################################################
# this product has Ethernet or not
########################################################
ifneq ($(strip $(BOARD_HS_ETHERNET)),true)
    PRODUCT_PROPERTY_OVERRIDES += ro.rk.ethernet_enable=false
endif

#######################################################
#build system support ntfs?
########################################################
ifeq ($(strip $(BOARD_IS_SUPPORT_NTFS)),true)
     PRODUCT_PROPERTY_OVERRIDES += \
         ro.factory.storage_suppntfs=true
else
     PRODUCT_PROPERTY_OVERRIDES += \
         ro.factory.storage_suppntfs=false
endif

########################################################
# build without barrery
########################################################
ifeq ($(strip $(BUILD_WITHOUT_BATTERY)),true)
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.factory.without_battery=true
else
    PRODUCT_PROPERTY_OVERRIDES += \
        ro.factory.without_battery=false
endif
 
# NTFS support
PRODUCT_PACKAGES += \
    ntfs-3g

PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

PRODUCT_PACKAGES += \
    librecovery_ui_$(TARGET_DEVICE)


ifeq ($(strip $(BOARD_BOOT_READAHEAD)),true)
    PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/proprietary/readahead/readahead:root/sbin/readahead \
        $(LOCAL_PATH)/proprietary/readahead/readahead_list.txt:root/readahead_list.txt
endif

#whtest for bin
PRODUCT_COPY_FILES += \
    device/rockchip/rk3188/whtest.sh:system/bin/whtest.sh

# for preinstall
PRODUCT_COPY_FILES += \
    device/rockchip/rk3188/preinstall_cleanup.sh:system/bin/preinstall_cleanup.sh
    
# for data clone
include device/rockchip/rk3188/data_clone/packdata.mk

#getbootmode.sh for stresstest
PRODUCT_COPY_FILES += \
    device/rockchip/rk3188/getbootmode.sh:system/bin/getbootmode.sh \

$(call inherit-product, external/wlan_loader/wifi-firmware.mk)

ifeq ($(strip $(BOARD_CONNECTIVITY_VENDOR)), MediaTek_mt7601)
$(call inherit-product, hardware/mediatek/config/mt7601/product_package.mk)
endif

ifeq ($(strip $(BOARD_CONNECTIVITY_VENDOR)), MediaTek)
ifeq ($(strip $(BOARD_CONNECTIVITY_MODULE)), combo_mt66xx)
$(call inherit-product, hardware/mediatek/config/$(strip $(BOARD_CONNECTIVITY_MODULE))/product_package.mk)
endif
ifeq ($(strip $(BOARD_CONNECTIVITY_MODULE)), mt5931_6622)
$(call inherit-product, hardware/mediatek/config/$(strip $(BOARD_CONNECTIVITY_MODULE))/product_package.mk)
endif
endif

ifeq ($(strip $(BOARD_CONNECTIVITY_MODULE)), mt6622)
$(call inherit-product, hardware/mediatek/config/$(strip $(BOARD_CONNECTIVITY_MODULE))/product_package.mk)
endif

ifeq ($(strip $(BOARD_CONNECTIVITY_VENDOR)), RealTek)
include hardware/realtek/wlan/config/config-rtl.mk
endif

ifeq ($(strip $(BOARD_CONNECTIVITY_VENDOR)), Espressif)
include hardware/esp/wlan/config/config-espressif.mk
endif

# Copy manifest to system/
ifeq ($(strip $(SYSTEM_WITH_MANIFEST)),true)
    PRODUCT_COPY_FILES += \
        manifest.xml:system/manifest.xml
endif

# Copy init.usbstorage.rc to root
ifeq ($(strip $(BUILD_WITH_MULTI_USB_PARTITIONS)),true)
    PRODUCT_COPY_FILES += \
        device/rockchip/rk3188/init.usbstorage.rc:root/init.usbstorage.rc
endif


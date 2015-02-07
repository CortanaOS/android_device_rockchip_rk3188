# Copyright (C) 2013 OmniROM Project
# Copyright (C) 2012 The CyanogenMod Project
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
$(call inherit-product, vendor/omni/config/common_tablet.mk)

$(call inherit-product, build/target/product/full_base.mk)
include device/rockchip/rk3188/BoardConfig.mk
$(call inherit-product, device/rockchip/rk3188/device.mk)
PRODUCT_BRAND := rockchip
PRODUCT_DEVICE := rk3188
PRODUCT_NAME := omni_rk3188
PRODUCT_MANUFACTURER := Newsmy
PRODUCT_MODEL := CarPad-II-P
RODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=nuxxxx TARGET_DEVICE=rk3188 BUILD_FINGERPRINT="newsmy/nuxxxx/nu3001:4.4.4/JRO03C/N7100XXALJ3:user/release-keys" PRIVATE_BUILD_DESC="nuxxxx-user 4.4.4 JRO03C N7100XXALJ3 release-keys"


# Get the long list of APNs
PRODUCT_COPY_FILES += device/rockchip/rk3188/phone/etc/apns-full-conf.xml:system/etc/apns-conf.xml
PRODUCT_COPY_FILES += device/rockchip/rk3188/phone/etc/spn-conf.xml:system/etc/spn-conf.xml
